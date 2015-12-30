package com.dabast.admin.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.IconCompressUtil;
import com.dabast.entity.*;
import com.dabast.mall.service.IProductSeriesService;
import com.dabast.support.vo.Message;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
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
         return "redirect:/admin-login.jsp";
    }
    @RequestMapping(value="")
    public String index_() {
        return "redirect:/admin-login.jsp";
    }

    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.setAttribute(Constant.LOGIN_ADMINISTRATOR,null);
        session.removeAttribute(Constant.LOGIN_ADMINISTRATOR);
        return "redirect:/admin-login.jsp";
    }
    @RequestMapping(value="/login")
    public ResponseEntity<Message> login(@RequestBody Administrator administrator,HttpSession session) {
        Message message=new Message();
        if (administrator.getName()==null&&administrator.getName().trim().equals("")){
            message.setMessage("用户名不能为空");
            message.setSuccess(false);
            return new ResponseEntity<Message>(message, HttpStatus.OK);
        }
        if (administrator.getPassword()==null&&administrator.getName().trim().equals("")){
            message.setMessage("密码不能为空");
            message.setSuccess(false);
            return new ResponseEntity<Message>(message, HttpStatus.OK);
        }
        Administrator dbAdmin= ServiceManager.administratorService.findByNameAndPassword(administrator.getName(),administrator.getPassword());

        if (dbAdmin==null){
            message.setMessage("用户名密码错误");
            message.setSuccess(false);
            return new ResponseEntity<Message>(message, HttpStatus.OK);
        }
        message.setSuccess(true);
        message.setMessage("登陆成功，即将为您跳转!");
        session.setAttribute(Constant.LOGIN_ADMINISTRATOR,dbAdmin);
        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }
    @RequestMapping(value="/test")
    public String xx() {
        ServiceManager.orderService.removeOrderInterval(1000*60*60*24*2);
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
        ProductSeriesPrice productSeriesPrice=new ProductSeriesPrice();
        Date now=new Date();
        productSeriesPrice.setAdjustDate(now);
        productSeriesPrice.setBeginDate(now);
        productSeriesPrice.setPrice(price);
        List<ProductSeriesPrice> prices=new ArrayList<ProductSeriesPrice>();
        prices.add(productSeriesPrice);
        productSeries.setProductSeriesPrices(prices);

        ProductStoreInAndOut inAndOut=new ProductStoreInAndOut();
        inAndOut.setAmount(storeAmount);
        inAndOut.setDate(new Date());
        inAndOut.setType("in");
        inAndOut.setOperator(getLoginAdministrator(session));
        List<ProductStoreInAndOut> inAndOuts=new ArrayList<ProductStoreInAndOut>();
        inAndOuts.add(inAndOut);
        store.setInAndOutList(inAndOuts);
//        ServiceManager.productStoreInAndOutService.insert(inAndOut);
        productSeries.setProductStore(store);
        productSeriesService.insert(productSeries);
//        List<ProductProperty> productProperties=new ArrayList<ProductProperty>();
        JSONArray productPropertiesJsonArray=JSONArray.fromObject(productPropertiesJson);
        for (Object object:productPropertiesJsonArray.toArray()){
            JSONObject jsonObjectProductProperty=(JSONObject) object;
//            if(jsonObjectProductProperty.get("propertyName")==null||jsonObjectProductProperty.get("propertyName").toString().length()==0) continue;
            ProductProperty productProperty=new ProductProperty();
            Assert.notNull(jsonObjectProductProperty.get("propertyName"));
            String propertyName=jsonObjectProductProperty.get("propertyName").toString();
            if (propertyName.equals("")) continue;
            productProperty.setPropertyName(propertyName);
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

        return "redirect:/admin/index/index";
    }

    private List<ProductSeriesPicture> getProductSeriesPicturesAndSaveFiles(MultipartFile[] files, String dirStr, ServletContext context) throws IOException {
        //循环获取file数组中得文件
//        Map<String,ProductSeriesPicture> originalPrefixesMap= new HashMap<String, ProductSeriesPicture>();
        List<ProductSeriesPicture> productSeriesPictures=new ArrayList<ProductSeriesPicture>();
        for(int i = 0;i<files.length;i++){
            MultipartFile file = files[i];
            //保存文件到数据库
            String pictureId=productSeriesService.saveFile(file.getOriginalFilename(), file.getBytes());
            String originalFilename=file.getOriginalFilename();
            String prefix=originalFilename.substring(0,originalFilename.lastIndexOf("."));//如xxx.zom,xxx.ico,xxx
            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));//后缀名如.jpg
//            String originalPrefix=new String();//原始前缀，xxx.zom.jpg,xxx.ico.jpg,xxx.jpg的原始前缀都是xxx
//            if (prefix.indexOf(".")>0){
//                originalPrefix=prefix.substring(0,prefix.lastIndexOf("."));
//            }else{
//                originalPrefix=prefix;
//            }
            ProductSeriesPicture productSeriesPicture=new ProductSeriesPicture();
            productSeriesPicture.setBigPicture("pic/" + pictureId);
            String bigPictureStr=dirStr+"/"+pictureId+suffix;
            File bigPictureFile=new ServletContextResource(context,bigPictureStr).getFile();
            file.transferTo(bigPictureFile);

            //生成305*350的中等大小图,无论中图小图都保持16:9的比例
            String mdTempPictureStr=dirStr+"/"+pictureId+".md"+suffix;
            File mdTempPictureFile=new ServletContextResource(context,mdTempPictureStr).getFile();
            IconCompressUtil.compressPic(bigPictureFile,mdTempPictureFile , 320, 180, false);
            String mdPictureId=productSeriesService.saveFile(mdTempPictureFile.getName(), mdTempPictureFile);
            String mdPictureStr = dirStr + "/" + mdPictureId+suffix;
            File mdPictureFile=new ServletContextResource(context, mdPictureStr).getFile();
            mdTempPictureFile.renameTo(mdPictureFile);
            productSeriesPicture.setPicture("pic/" + mdPictureId);
            //生成小图标75*75像素小图标
            String smTempPictureStr=dirStr+"/"+pictureId+".sm"+suffix;
            File smTempPictureFile=new ServletContextResource(context,smTempPictureStr).getFile();
            IconCompressUtil.compressPic(bigPictureFile,smTempPictureFile , 64, 36, false);
            String smPictureId=productSeriesService.saveFile(smTempPictureFile.getName(), smTempPictureFile);
            String smPictureStr = dirStr + "/" + smPictureId+suffix;
            File smPictureFile=new ServletContextResource(context, smPictureStr).getFile();
            smTempPictureFile.renameTo(smPictureFile);
            productSeriesPicture.setIconPicture("pic/" + smPictureId);
            productSeriesPictures.add(productSeriesPicture);

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
    @RequestMapping(value="/home_page_block/new")
    public ResponseEntity<HomePageBlock> create(@RequestBody HomePageBlock homePageBlock){
        ServiceManager.homePageBlockService.insert(homePageBlock);
        return new ResponseEntity<HomePageBlock>(homePageBlock, HttpStatus.OK);
    }
    @RequestMapping(value="/home_page_block/list/json")
    public ResponseEntity<List<HomePageBlock>> jsonList(){
        List<HomePageBlock> list=ServiceManager.homePageBlockService.findAll();
        return new ResponseEntity<List<HomePageBlock>>(list, HttpStatus.OK);
    }
    @RequestMapping(value="/home_page_block/remove/{id}")
    public ResponseEntity<List<HomePageBlock>> removeHomePageBlock(@PathVariable String id){
        ServiceManager.homePageBlockService.removeById(id);
        List<HomePageBlock> list=ServiceManager.homePageBlockService.findAll();
        return new ResponseEntity<List<HomePageBlock>>(list, HttpStatus.OK);
    }
}
