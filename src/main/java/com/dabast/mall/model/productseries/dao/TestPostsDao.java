package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.TestAuthors;
import com.dabast.entity.TestPosts;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBRef;
import org.bson.types.ObjectId;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestPostsDao extends BaseMongoDao<TestPosts> {
    public void insertDBRef(TestPosts testPosts) {
        List<TestAuthors> authors=testPosts.getAuthors();
//        DBCollection dbCollection=new DBCollectionImpl()
        for (TestAuthors author:authors){
            DB db=getMongoTemplate().getDb(); String ns="testAuthors" ; Object id=new ObjectId();
            DBRef dbRef=new DBRef(db,ns,id);
        }

    }
}
