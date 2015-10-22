package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/7/28.
 */
@Document(collection = "cart")
public class Cart {
    @Id
    private String id;
    @Field(value = "userId")
    private String userId;

    private List<ProductSelected> productSelectedList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

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
        setProductSelectedList(productSelectedList);
    }

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
