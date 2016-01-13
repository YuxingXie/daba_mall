package com.dabast.admin.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.IconCompressUtil;
import com.dabast.common.util.MongoDbUtil;
import com.dabast.entity.*;
import com.dabast.mall.service.IProductSeriesService;
import com.dabast.support.vo.Message;
import com.dabast.support.vo.NotifySearch;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import com.mongodb.util.JSON;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bson.types.ObjectId;
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
    private static Logger logger = LogManager.getLogger();
    protected static final String DEFAULT_SORT_COLUMNS = null;
    protected static final String REDIRECT_ACTION = "";

    @Resource private IProductSeriesService productSeriesService;

    @InitBinder("productSeries")
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

    @RequestMapping(value="/")
    public String adminLogin() {
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
    @RequestMapping(value="/index/json")
    public ResponseEntity< Map<String,Object>> index(HttpSession session) {
        Map<String,Object> map=new HashMap<String, Object>();
        long todoOrders=ServiceManager.orderService.findUnHandlerOrdersCount();
        long returnOrders=ServiceManager.orderService.findReturnExchangeOrdersCount();
        DBObject dbObject=new BasicDBObject();
        Administrator administrator=getLoginAdministrator(session);
        dbObject.put("toAdministrator",new DBRef("administrator",new ObjectId(administrator.getId())));
        long notifies=ServiceManager.notifyService.count(dbObject);

        map.put("todoOrders",todoOrders);
        map.put("returnOrders",returnOrders);
        map.put("notifies",notifies);

        return new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
    }

    @RequestMapping(value="/product_series/new")
    public ResponseEntity<ProductSeries> saveProductSeries(@RequestBody ProductSeries productSeries,HttpServletRequest request,HttpSession session) throws IOException {
        Assert.notNull(productSeries.getProductSeriesPrices());
        Assert.notNull(productSeries.getProductSeriesPrices().get(0));
        Date now=new Date();
        productSeries.getProductSeriesPrices().get(0).setBeginDate(now);
        productSeries.getProductSeriesPrices().get(0).setAdjustDate(now);
        productSeries.setShelvesDate(new Date());
        Assert.notNull(productSeries.getProductStore());
        Assert.notNull(productSeries.getProductStore().getInAndOutList());
        Assert.notNull(productSeries.getProductStore().getInAndOutList().get(0));
        productSeries.getProductStore().getInAndOutList().get(0).setOperator(getLoginAdministrator(session));
        productSeries.getProductStore().getInAndOutList().get(0).setType("in");
        productSeriesService.insert(productSeries);
        List<ProductProperty> productProperties=productSeries.getProductProperties();
        if (productProperties!=null){
            for (ProductProperty productProperty:productProperties){
                productProperty.setProductSeries(productSeries);
                ServiceManager.productPropertyService.insert(productProperty);
                List<ProductPropertyValue> propertyValues=productProperty.getPropertyValues();
                for (ProductPropertyValue propertyValue:propertyValues){
                    propertyValue.setProductProperty(productProperty);
                    ServiceManager.productPropertyValueService.insert(propertyValue);
                }
            }
        }

        MongoDbUtil.clearTransientFields(productSeries);
        return new ResponseEntity<ProductSeries>(productSeries,HttpStatus.OK);
    }
    @RequestMapping(value="/product_series/update_img")
    public String uploadImg(String productSeriesId,@RequestParam("files") MultipartFile[] files,HttpServletRequest request,HttpSession session) throws IOException {

        ProductSeries productSeries=new ProductSeries();
        productSeries.setId(productSeriesId);
        if(files!=null&&files.length>0){
            String dirStr="statics/img/product";
            ServletContext context= ProjectContext.getServletContext();
            ServletContextResource dirResource=new ServletContextResource(context,dirStr);
            mkDirs(dirResource);
            List<ProductSeriesPicture> productSeriesPictures = getProductSeriesPicturesAndSaveFiles(files, dirStr, context);
            productSeries.setPictures(productSeriesPictures);
            productSeriesService.update(productSeries);
        }
        return "redirect:/admin/product_series/list";
    }

    private List<ProductSeriesPicture> getProductSeriesPicturesAndSaveFiles(MultipartFile[] files, String dirStr, ServletContext context) throws IOException {
        //循环获取file数组中得文件
//        Map<String,ProductSeriesPicture> originalPrefixesMap= new HashMap<String, ProductSeriesPicture>();
        List<ProductSeriesPicture> productSeriesPictures=new ArrayList<ProductSeriesPicture>();
        for(int i = 0;i<files.length;i++){
            MultipartFile file = files[i];
            //保存文件到数据库
            String pictureId=productSeriesService.saveFile(file.getOriginalFilename(), file.getBytes());
            logger.info("产品原图保存："+pictureId);
            String originalFilename=file.getOriginalFilename();
            String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));//后缀名如.jpg

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
            logger.info("产品标准图保存："+mdPictureId);
            String mdPictureStr = dirStr + "/" + mdPictureId+suffix;
            File mdPictureFile=new ServletContextResource(context, mdPictureStr).getFile();
            mdTempPictureFile.renameTo(mdPictureFile);
            productSeriesPicture.setPicture("pic/" + mdPictureId);
            //生成小图标75*75像素小图标
            String smTempPictureStr=dirStr+"/"+pictureId+".sm"+suffix;
            File smTempPictureFile=new ServletContextResource(context,smTempPictureStr).getFile();
            IconCompressUtil.compressPic(bigPictureFile,smTempPictureFile , 64, 36, false);
            String smPictureId=productSeriesService.saveFile(smTempPictureFile.getName(), smTempPictureFile);
            logger.info("产品小图保存："+smPictureId);
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
    @RequestMapping(value="/adjust_price/{id}")
    public String adjust_price(@PathVariable String id,ModelMap map){
        ProductSeries productSeries=productSeriesService.findProductSeriesById(id);
       map.addAttribute("productSeries",productSeries);
        return "admin/product_series/adjust_price";
    }

    @RequestMapping(value="/do/adjust_price")
    public String do_adjust_price(@ModelAttribute ProductSeriesPrice productSeriesPrice,String productSeriesId,ModelMap map){
        ProductSeries productSeries=productSeriesService.findById(productSeriesId);
        List<ProductSeriesPrice> prices=productSeries.getProductSeriesPrices();
        ProductSeriesPrice lastPrice=prices.get(prices.size()-1);
        Assert.isTrue(lastPrice.getEndDate()==null);
        Date now=new Date();
        lastPrice.setEndDate(now);
        productSeriesPrice.setBeginDate(now);
        productSeriesPrice.setAdjustDate(now);
        prices.add(productSeriesPrice);
        ProductSeries update=new ProductSeries();
        update.setId(productSeriesId);
        update.setProductSeriesPrices(prices);
        productSeriesService.update(update);
        return "redirect:/admin/product_series/list";
    }
    @RequestMapping(value="/adjust_store/{id}")
    public String adjust_store(@PathVariable String id,ModelMap map){
        ProductSeries productSeries=productSeriesService.findProductSeriesById(id);
        map.addAttribute("productSeries",productSeries);
        return "admin/product_series/adjust_store";
    }
    @RequestMapping(value="/adjust_sort/{id}")
    public String adjust_sort(@PathVariable String id,ModelMap map){
        ProductSeries productSeries=productSeriesService.findProductSeriesById(id);
        map.addAttribute("productSeries",productSeries);
        return "admin/product_series/adjust_sort";
    }
    @RequestMapping(value="/do/adjust_sort")
    public String do_adjust_sort(String subCategoryId,String productSeriesId,ModelMap map,HttpSession session){
        Date now=new Date();
        ProductSeries update=new ProductSeries();
        update.setId(productSeriesId);
        ProductSubCategory subCategory=new ProductSubCategory();
        subCategory.setId(subCategoryId);
        update.setProductSubCategory(subCategory);
        productSeriesService.update(update);
        return "redirect:/admin/product_series/list";
    }
    @RequestMapping(value="/do/adjust_store")
    public String do_adjust_store(@ModelAttribute ProductStoreInAndOut inAndOut,String productSeriesId,Integer warningAmount,ModelMap map,HttpSession session){
        ProductSeries productSeries=productSeriesService.findById(productSeriesId);
        ProductStore store=productSeries.getProductStore();
        List<ProductStoreInAndOut> inAndOuts=store.getInAndOutList();
        if (warningAmount!=null &&warningAmount.intValue()!=0) store.setWarningAmount(warningAmount);
        Date now=new Date();
        inAndOut.setDate(now);
        inAndOut.setOperator(getLoginAdministrator(session));
        inAndOuts.add(inAndOut);
        ProductSeries update=new ProductSeries();
        update.setId(productSeriesId);
        update.setProductStore(store);
        productSeriesService.update(update);
        return "redirect:/admin/product_series/list";
    }
    @RequestMapping(value="/top3")
    public String top3Maker(ModelMap map){
        List<String[]> list=ServiceManager.productSeriesService.getTop3ProductSeriesDemo();
        map.addAttribute("top3",list);
        return "admin/top3/create_input";
    }
    @RequestMapping(value="/top3/demo")
    public String top3Demo(ModelMap map){
        List<String[]> list=ServiceManager.productSeriesService.getTop3ProductSeriesDemo();
        map.addAttribute("top3",list);
        return "forward:/top3preview.jsp";
    }
    @RequestMapping(value="/top3/preview")
    public String top3preview(ModelMap map, String data){
        List<String[]> s= (List<String[]>)JSON.parse(data);
        map.addAttribute("top3",s);
        return "forward:/top3preview.jsp";
    }

    @RequestMapping(value="/topCarousel/list/json")
    public ResponseEntity<List<TopCarousel>> topCarouselList(ModelMap map){
        List<TopCarousel> topCarousels= ServiceManager.topCarouselService.findAll();
        return new ResponseEntity<List<TopCarousel>>(topCarousels,HttpStatus.OK);
    }
    @RequestMapping(value="/topCarousel/new")
    public ResponseEntity<Message> topCarouselCreate(ModelMap map, @RequestBody TopCarousel topCarousel){
        Message message=new Message();
        ServiceManager.topCarouselService.insert(topCarousel);
        if (topCarousel.getId()!=null){
            message.setSuccess(true);
            message.setMessage("保存成功!");
        }else{
            message.setSuccess(false);
            message.setMessage("保存失败!");
        }

        return new ResponseEntity<Message>(message,HttpStatus.OK);
    }
    @RequestMapping(value="/notify/remove")
    public ResponseEntity<Map<String,Object>> removeProduct( @RequestBody Notify notify,HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();
        ServiceManager.notifyService.removeById(notify.getId());
        DBObject dbObject=new BasicDBObject();
        Administrator administrator=getLoginAdministrator(session);
        dbObject.put("fromAdministrator",new DBRef("administrator",new ObjectId(administrator.getId())));
        List<Notify> notifies=ServiceManager.notifyService.findAll(dbObject);
        map.put("list",notifies);
        return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
    }
    @RequestMapping(value="/product_series/remove")
    public ResponseEntity<Map<String,Object>> removeProduct( @RequestBody ProductSeries productSeries,HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();
        Message message=new Message();
        //查询是否生成订单
        long useInOrder=ServiceManager.orderService.findOrdersCountByProductSeries(productSeries);
        if (useInOrder==0){
            //是否有加入购物车
            List<User> users=ServiceManager.userService.findUsersByProductSeriesInCart(productSeries);
            List<Interest> interests=ServiceManager.interestService.findByProductSeries(productSeries);
            Date now=new Date();
            if (interests!=null&&interests.size()>0){
                for(Interest interest:interests){
                    User user=interest.getUser();
                    Notify notify=new Notify();
                    notify.setToUser(user);
                    notify.setContent("我们很遗憾的通知您，您关注的商品\"" + productSeries.getName() + "\"被系统删除，因此我们将此商品从您的关注列表中移除了。感谢您对大坝的支持！");
                    notify.setDate(now);
                    notify.setTitle("系统通知");
                    notify.setFromAdministrator(getLoginAdministrator(session));
                    ServiceManager.notifyService.insert(notify);
                    ServiceManager.interestService.removeById(interest.getId());
                }
            }
            if(users!=null&&users.size()>0){
                for (User user:users){
                    Assert.notNull(user.getCart());
                    Assert.notNull(user.getCart().getProductSelectedList());
                    List<ProductSelected> productSelectedList=user.getCart().getProductSelectedList();
                    List<ProductSelected> newProductSelectedList=new ArrayList<ProductSelected>();
                    for (ProductSelected productSelected:productSelectedList){
                        if (!productSelected.getProductSeries().getId().equalsIgnoreCase(productSeries.getId())){
                            newProductSelectedList.add(productSelected);
                        }
                    }
                    User updateUser=new User();
                    updateUser.setId(user.getId());
                    Cart cart=new Cart();
                    cart.setProductSelectedList(newProductSelectedList);
                    updateUser.setCart(cart);
                    ServiceManager.userService.update(updateUser);

                    Notify notify=new Notify();
                    notify.setToUser(user);
                    notify.setContent("我们很遗憾的通知您，您购物车中的商品\"" + productSeries.getName() + "\"被系统删除，因此我们将此商品从您的购物车移除了。感谢您对大坝的支持！");
                    notify.setDate(now);
                    notify.setTitle("系统通知");
                    notify.setFromAdministrator(getLoginAdministrator(session));
                    ServiceManager.notifyService.insert(notify);
                }
            }

            //删除关联的DBRef,包括productSubCategory,productCategory,productProperty,productPropertyValue,productEvaluate,salesCampaign,homePageBlock
            ServiceManager.productPropertyService.removeByProductSeries(productSeries);
            ServiceManager.productEvaluateService.removeByProductSeries(productSeries);
            ServiceManager.salesCampaignService.removeProductSeries(productSeries);
            ServiceManager.homePageBlockService.removeProductSeries(productSeries);
            ServiceManager.productSeriesService.removeProductSeriesAndPictures(productSeries);
            message.setSuccess(true);
            message.setMessage("删除成功!");
            List<ProductSeries> list=productSeriesService.findAll();
            map.put("list",list);
        }else{
            message.setSuccess(false);
            message.setMessage("已有订单使用该产品，删除失败!");
        }
        map.put("message",message);
        return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
    }


    @RequestMapping(value="/notifies/data")
    public ResponseEntity<List<Notify>> notifies(ModelMap map, @RequestBody NotifySearch notifySearch,HttpSession session){
        DBObject dbObject=new BasicDBObject();
        String fromTo=notifySearch.getFromToMe();
        String read=notifySearch.getRead();
        Administrator administrator=getLoginAdministrator(session);
        if (fromTo!=null&&fromTo.equals("toMe")){
            dbObject.put("toAdministrator",new DBRef("administrator",new ObjectId(administrator.getId())));
        }else if (fromTo!=null&&fromTo.equals("fromMe")){
            dbObject.put("fromAdministrator",new DBRef("administrator",new ObjectId(administrator.getId())));
        }
        if (read!=null&&read.equals("read")){
            dbObject.put("read",true);
        }else if (read!=null&&read.equals("unread")){
            BasicDBList dbList=new BasicDBList();
            dbList.add(new BasicDBObject("read",false));
            dbList.add(new BasicDBObject("read",new BasicDBObject("$exists",false)));
            dbObject.put("$or",dbList);
        }
        List<Notify> notifies=ServiceManager.notifyService.findAll(dbObject);
        return new ResponseEntity<List<Notify>>(notifies,HttpStatus.OK);
    }
}
