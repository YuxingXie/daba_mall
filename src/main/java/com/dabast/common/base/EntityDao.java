package com.dabast.common.base;

import com.mongodb.CommandResult;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.mongodb.core.query.Query;

import java.util.Collection;
import java.util.List;

public interface EntityDao <E>{
    public String saveFile(String fileName,byte[] file);
    public GridFSDBFile findFileById(String id);
//    public int upsert(E queryEntity,E updateEntity);
    void insert(E e);
    List<E> findEquals(E e);
    List<E> findAll();
    List<E> findAll(DBObject condition);
    E findOne(DBObject queryCondition);
    E findOne(E condition);
    public List<E> textQuery(String  keyWord);
    List<E> findRange(String key, Object min, Object max);
    E findById(ObjectId id);
    List<E> findNotEquals(E e);
    List<E> findKeyIn(String key, Collection collection);

    List<E> findKeyNotIn(String key, Collection collection);

    List<E> findKeyIsNull(String key);

    List<E> findByRegex(String key, String regex);

    List<E> findInArray(String key, Object[] values);

    List<E> findRef(String refKey, Object value);

    Page<E> findPage(int pageIndex);

    void update(E e);

    CommandResult runCommand(String s);

    Object find(Object parse);

    E findById(String id);

    void removeById(String id);

    List<E> findAll(Query query);
}
