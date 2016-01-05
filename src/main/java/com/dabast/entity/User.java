package com.dabast.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Document(collection = "users")
public class User {
    @Id private String id;
    @Field(value = "name")
    @Length(min=2,max=20)
    private String name;
    @Field
    private String realName;
    @Field(value = "sex")
    private String sex;
    @Field(value = "height")
    private Integer height;
    @Length(min=6)
    @Field("password")
    private String password;
    @Field("email")
    @Email
    @Indexed
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
//    @DBRef
    private Cart cart;
    @Field(value = "addresses")
    private String[] addresses;
    @Field private boolean disabled;//禁用
    @Field(value = "idCardNo")
    private String idCardNo;
    private boolean activated;//激活
    @Transient
    private List<Account> userAccounts;
    @Transient
    private List<Interest> interests;
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

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
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
    private PersonalRealMessage realMessage;

    public PersonalRealMessage getRealMessage() {
        return realMessage;
    }

    public void setRealMessage(PersonalRealMessage realMessage) {
        this.realMessage = realMessage;
    }

    public List<Interest> getInterests() {
        return interests;
    }

    public void setInterests(List<Interest> interests) {
        this.interests = interests;
    }

    /**
     * 这些和登录相关，不保存
     */

    @Transient
    private boolean remember;
    @NotNull
    @Transient
    private String rePassword;
    @Transient
    private String loginStr;
    @Transient
    private boolean mergeCart;

    public boolean isMergeCart() {
        return mergeCart;
    }

    public void setMergeCart(boolean mergeCart) {
        this.mergeCart = mergeCart;
    }



    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    public String getLoginStr() {
        return loginStr;
    }

    public void setLoginStr(String loginStr) {
        this.loginStr = loginStr;
    }
}
