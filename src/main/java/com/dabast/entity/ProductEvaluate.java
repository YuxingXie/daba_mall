package com.dabast.entity;

/**
 * Created by Administrator on 2015/11/27.
 */
public class ProductEvaluate {
    private String content;
    private String[] pictures;
    private Integer grade;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String[] getPictures() {
        return pictures;
    }

    public void setPictures(String[] pictures) {
        this.pictures = pictures;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}
