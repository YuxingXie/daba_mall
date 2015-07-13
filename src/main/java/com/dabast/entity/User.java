package com.dabast.entity;

import org.bson.types.ObjectId;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.Date;
import java.util.Set;

/**
 * Created by Administrator on 2015/5/22.
 */
@Document(collection = "users")
public class User {
    @Id private String id;
    @Field(value = "name")
    @Length(min=2,max=12)
    private String name;
    @Field(value = "sex")
    private String sex;
    @Field(value = "height")
    private Integer height;
    @Length(min=6)
    @Field("password")
    private String password;
    @Field("email")
    @Email
    private String email;
//    @DBRef private Set<Address> address;
    @Field("registerTime")
    private Date registerTime;
    @Field("status")
    private Integer status;
    @Field("validateCode")
    private String validateCode;
    @Field("lastActivateTime")
    private Date lastActivateTime;
    @Field("phone")
    private String phone;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

//    public Set<Address> getAddress() {
//        return address;
//    }
//    public void setAddress(Set<Address> address) {
//        this.address = address;
//    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }


    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }

    public String getValidateCode() {
        return validateCode;
    }

    public Date getLastActivateTime() {
        return lastActivateTime;
    }

    public void setLastActivateTime(Date lastActivateTime) {
        this.lastActivateTime = lastActivateTime;
    }
}
