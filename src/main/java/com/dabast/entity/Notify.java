package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2015/12/20.
 */
@Document(collection = "notify")
public class Notify {
    @Id
    private String id;
    @DBRef
    private User toUser;
    private String content;
    private Date date;
    private boolean read;
    private String title;
    private Map<String,Object> importantStuffs;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getToUser() {
        return toUser;
    }

    public void setToUser(User toUser) {
        this.toUser = toUser;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean getRead() {
        return read;
    }

    public void setRead(boolean read) {
        this.read = read;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Map<String, Object> getImportantStuffs() {
        return importantStuffs;
    }

    public void setImportantStuffs(Map<String, Object> importantStuffs) {
        this.importantStuffs = importantStuffs;
    }
}
