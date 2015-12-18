package com.dabast.admin.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.dabast.mall.service.IProductSeriesService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseRestSpringController {
    protected static final String DEFAULT_SORT_COLUMNS = null;
    protected static final String REDIRECT_ACTION = "";

    @Resource private IProductSeriesService productSeriesService;

    @InitBinder("productSeries")
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

    @RequestMapping(value="/")
    public String index() {
         return "redirect:/admin/index/index";
    }

    @RequestMapping(value="/product_series/new")
    public String createProductSeries(ProductSeries productSeries,
                                      Double price,Integer storeAmount,
                                      Integer warningAmount,
                                      String productSubCategoryId,
                                      @RequestParam("files") MultipartFile[] files,
                                      String productPropertiesJson,
                                      HttpServletRequest request,HttpSession session) throws IOException {

//        printRequestParameters(request);
        if(files!=null&&files.length>0){
            String dirStr="statics/img/product";
            ServletContext context= ProjectContext.getServletContext();
            ServletContextResource dirResource=new ServletContextResource(context,dirStr);
            mkDirs(dirResource);
            List<ProductSeriesPicture> productSeriesPictures = getProductSeriesPicturesAndSaveFiles(files, dirStr, context);
            productSeries.setPictures(productSeriesPictures);

        }
        productSeries.setNewProduct(true);
        productSeries.setShelvesDate(new Date());
        ProductSubCategory productSubCategory=ServiceManager.productSubCategoryService.findById(productSubCategoryId);
        productSeries.setProductSubCategory(productSubCategory);
        ProductStore store=new ProductStore();
        store.setWarningAmount(warningAmount);
        productSeries.setProductStore(store);
        productSeriesService.insert(productSeries);
//        List<ProductProperty> productProperties=new ArrayList<ProductProperty>();
        JSONArray productPropertiesJsonArray=JSONArray.fromObject(productPropertiesJson);
        for (Object object:productPropertiesJsonArray.toArray()){
            JSONObject jsonObjectProductProperty=(JSONObject) object;
//            if(jsonObjectProductProperty.get("propertyName")==null||jsonObjectProductProperty.get("propertyName").toString().length()==0) continue;
            ProductProperty productProperty=new ProductProperty();
            Assert.notNull(jsonObjectProductProperty.get("propertyName"));
            productProperty.setPropertyName(jsonObjectProductProperty.get("propertyName").toString());
            productProperty.setProductSeries(productSeries);
            ServiceManager.productPropertyService.insert(productProperty);
            JSONArray jsonArrayPropertyValues=JSONArray.fromObject(jsonObjectProductProperty.get("propertyValues"));

            for (Object productPropertyValueObject:jsonArrayPropertyValues){
                ProductPropertyValue productPropertyValue=new ProductPropertyValue();
                JSONObject productPropertyValueJSONObject=(JSONObject)productPropertyValueObject;
                Assert.notNull(productPropertyValueJSONObject.get("value"));
                if (productPropertyValueJSONObject.get("value").toString().equals("")) continue;
//                System.out.println(productPropertyValueJSONObject.get("value"));
                productPropertyValue.setValue(productPropertyValueJSONObject.get("value").toString());
                productPropertyValue.setProductProperty(productProperty);
                productProperty.setProductSeries(productSeries);
                ServiceManager.productPropertyValueService.insert(productPropertyValue);
            }
        }
        ProductSeriesPrice productSeriesPrice=new ProductSeriesPrice();
        Date now=new Date();
        productSeriesPrice.setAdjustDate(now);
        productSeriesPrice.setBeginDate(now);
        productSeriesPrice.setPrice(price);
        productSeriesPrice.setProductSeries(productSeries);
        ServiceManager.productSeriesPriceService.insert(productSeriesPrice);
        List<ProductSeriesPrice> prices=productSeries.getProductSeriesPrices();
        if (prices==null) prices=new ArrayList<ProductSeriesPrice>();
        prices.add(productSeriesPrice);
        productSeries.setProductSeriesPrices(prices);
//        ServiceManager.productSeriesService.upsert(productSeries);
//        ServiceManager.productStoreService.insert(store);
        ProductStoreInAndOut inAndOut=new ProductStoreInAndOut();
        inAndOut.setAmount(storeAmount);
        inAndOut.setDate(new Date());
        inAndOut.setProductSeries(productSeries);
        inAndOut.setType("in");
        inAndOut.setOperator(getLoginUser(session));
        ServiceManager.productStoreInAndOutService.insert(inAndOut);
        productSeries.setProductStore(store);
//        ServiceManager.productSeriesService.upsert(productSeries);
        return "redirect:/admin/index/index";
    }

    private List<ProductSeriesPicture> getProductSeriesPicturesAndSaveFiles(MultipartFile[] files, String dirStr, ServletContext context) throws IOException {
        //循环获取file数组中得文件
        Map<String,ProductSeriesPicture> originalPrefixesMap= new HashMap<String, ProductSeriesPicture>();
        for(int i = 0;i<files.length;i++){
            MultipartFile file = files[i];
            //保存文件到数据库
            String picture=productSeriesService.saveFile(file.getOriginalFilename(), file.getBytes());
            String originalFilename=file.getOriginalFilename();
            String prefix=originalFilename.substring(0,originalFilename.lastIndexOf("."));//如xxx.zom,xxx.ico,xxx
            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));//后缀名如.jpg
            String originalPrefix=new String();//原始前缀，xxx.zom.jpg,xxx.ico.jpg,xxx.jpg的原始前缀都是xxx
            if (prefix.indexOf(".")>0){
                originalPrefix=prefix.substring(0,prefix.lastIndexOf("."));
            }else{
                originalPrefix=prefix;
            }
            ProductSeriesPicture pictureOfOriginalPrefix=null;
            if (!originalPrefixesMap.containsKey(originalPrefix)){
                pictureOfOriginalPrefix=new ProductSeriesPicture();
                originalPrefixesMap.put(originalPrefix,pictureOfOriginalPrefix);
            }else{
                pictureOfOriginalPrefix=originalPrefixesMap.get(originalPrefix);
            }
            if (prefix.endsWith(".zoom")){//大图
                pictureOfOriginalPrefix.setBigPicture("pic/"+picture);
            }else if(prefix.endsWith(".ico")){//小图
                pictureOfOriginalPrefix.setIconPicture("pic/" + picture);
            }else{//原图
                pictureOfOriginalPrefix.setPicture("pic/"+picture);
            }
            String destFileStr=dirStr+"/"+picture+suffix;
            file.transferTo(new ServletContextResource(context,destFileStr).getFile());
        }
        List<ProductSeriesPicture> productSeriesPictures=new ArrayList<ProductSeriesPicture>();
        for (String key:originalPrefixesMap.keySet()){
            productSeriesPictures.add(originalPrefixesMap.get(key));
        }
        return productSeriesPictures;
    }

    private void mkDirs(ServletContextResource dirResource) throws IOException {
        File dirFile=dirResource.getFile();
        if (!dirFile.exists() || !dirFile.isDirectory()){
            dirFile.mkdirs();
        }
    }
    public static void main(String args[]){
        Map<String,ProductSeriesPicture> pictureMap=new HashMap<String, ProductSeriesPicture>();
        ProductSeriesPicture productSeriesPicture001=new ProductSeriesPicture();
        productSeriesPicture001.setPicture("001.jpg");
        productSeriesPicture001.setBigPicture("001.zoom.jpg");
        productSeriesPicture001.setIconPicture("001.ico.jpg");
        pictureMap.put("001",productSeriesPicture001);

        ProductSeriesPicture productSeriesPicture002=new ProductSeriesPicture();
        productSeriesPicture002.setPicture("002.jpg");
        productSeriesPicture002.setBigPicture("002.zoom.jpg");
        productSeriesPicture002.setIconPicture("002.ico.jpg");
        pictureMap.put("002",productSeriesPicture002);
        pictureMap.get("002").setBigPicture("002.big.jpg");
        System.out.println(pictureMap.get("002").getBigPicture());
    }
    @RequestMapping(value="/product_category/new")
    public String createProductCategory(ModelMap model, HttpServletRequest request,String categoryType,String categoryName,String subCategoryName,String productCategoryId){
        Assert.notNull(subCategoryName);
        printRequestParameters(request);
        if (categoryType.equals("1")){
            Assert.notNull(categoryName);
            ProductCategory productCategory=new ProductCategory();
            productCategory.setCategoryName(categoryName);
            ServiceManager.productCategoryService.insert(productCategory);
            ProductSubCategory productSubCategory=new ProductSubCategory();
            productSubCategory.setProductCategory(productCategory);
            productSubCategory.setSubCategoryName(subCategoryName);
            ServiceManager.productSubCategoryService.insert(productSubCategory);
        }else if (categoryType.equals("2")){
            ProductCategory productCategory=null;
            if(productCategoryId==null){
                Assert.notNull(categoryName);
                productCategory=new ProductCategory();
                productCategory.setCategoryName(categoryName);
                ServiceManager.productCategoryService.insert(productCategory);
            }else productCategory=ServiceManager.productCategoryService.findById(productCategoryId);
            ProductSubCategory productSubCategory=new ProductSubCategory();
            productSubCategory.setSubCategoryName(subCategoryName);
            productSubCategory.setProductCategory(productCategory);
            ServiceManager.productSubCategoryService.insert(productSubCategory);
        }
        return "redirect:/admin/product_category/create_input";
    }
}
