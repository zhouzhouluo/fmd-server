package com.fmd.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T> {  
	  
    public void save(T entity);  
  
    public void update(T entity);  
  
    public void delete(Serializable id);  
  
    public T getById(Serializable id);  
  
    public List<T> getByHQL(String hql, Object... params);  
}
