package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<ProductSelected> productSelectedList;
    public List<ProductSelected> getProductSelectedList() {
        return productSelectedList;
    }

    public void setProductSelectedList(List<ProductSelected> productSelectedList) {
        this.productSelectedList = productSelectedList;
    }
    public void merge(ProductSelected anotherProductSelected){
        List<ProductSelected> productSelectedList=this.getProductSelectedList();
        if (productSelectedList==null){
            productSelectedList=new ArrayList<ProductSelected>();
            productSelectedList.add(anotherProductSelected);
            this.setProductSelectedList(productSelectedList);
            return;
        }
        for (ProductSelected thisProductSelected : this.getProductSelectedList()){
            if (thisProductSelected.equals(anotherProductSelected)){
                thisProductSelected.setAmount(thisProductSelected.getAmount()+anotherProductSelected.getAmount());
                return;
            }
        }
        productSelectedList.add(anotherProductSelected);
//        setProductSelectedList(productSelectedList);
    }
    public void merge(Cart anotherCart){
        if (anotherCart==null) return;
        if (anotherCart.getProductSelectedList()==null) return;
        List<ProductSelected> thisProductSelectedList=this.getProductSelectedList();
        if (thisProductSelectedList==null){
            this.setProductSelectedList(anotherCart.getProductSelectedList());
            return;
        }
        outer:for (ProductSelected anotherProductSelected:anotherCart.getProductSelectedList()){
            inner:for (ProductSelected thisProductSelected : this.getProductSelectedList()){
                if (thisProductSelected.equals(anotherProductSelected)){
                    thisProductSelected.setAmount(thisProductSelected.getAmount()+anotherProductSelected.getAmount());
                    break outer;
                }
            }
            thisProductSelectedList.add(anotherProductSelected);
//            setProductSelectedList(thisProductSelectedList);
        }

    }




}
