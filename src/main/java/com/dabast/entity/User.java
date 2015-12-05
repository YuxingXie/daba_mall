package com.dabast.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.Date;
import java.util.List;

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
    @Field(value = "userCategory")
    private String userCategory;//1注册用户 2,。经销商
//    @DBRef private Set<Address> address;
    @Field("registerTime")
    private Date registerTime;

    @Field("validateCode")
    private String validateCode;
    @Field("lastActivateTime")
    private Date lastActivateTime;
    @Field("phone")
    private String phone;
    private String loginStatus;
    @Field(value = "cart")
    private Cart cart;
    @Field(value = "addresses")
    private String[] addresses;
    @Field private boolean disabled;//禁用
    @Field(value = "idCardNo")
    private String idCardNo;
    private boolean activated;//激活
    @Transient
    private List<Account> userAccounts;
    public String[] getAddresses() {
        return addresses;
    }

    public void setAddresses(String[] addresses) {
        this.addresses = addresses;
    }

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

    public String getLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(String loginStatus) {
        this.loginStatus = loginStatus;
    }

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

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    public List<Account> getUserAccounts() {
        return userAccounts;
    }

    public void setUserAccounts(List<Account> userAccounts) {
        this.userAccounts = userAccounts;
    }

    public String getUserCategory() {
        return userCategory;
    }

    public void setUserCategory(String userCategory) {
        this.userCategory = userCategory;
    }

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }
}
