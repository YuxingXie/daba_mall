package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.entity.Bank;
import com.dabast.mall.service.impl.BankService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/bank")
public class BankController extends BaseRestSpringController {
    protected static final String DEFAULT_SORT_COLUMNS = null;
    protected static final String REDIRECT_ACTION = "";
    private static Logger logger = LogManager.getLogger();
    @Resource private BankService bankService;
    @Resource private Validator validator;


    @InitBinder("bank")
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }


    @ModelAttribute
    public void init(ModelMap model) {
//        model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
    }
    @RequestMapping(value="/json")
    public ResponseEntity<List<Bank>> jsonBanks(ModelMap model) {
        List<Bank> banks=bankService.findAll();
        return new ResponseEntity<List<Bank>>(banks, HttpStatus.OK);
    }


} 
