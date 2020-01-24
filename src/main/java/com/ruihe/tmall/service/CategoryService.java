package com.ruihe.tmall.service;

import com.ruihe.tmall.pojo.Category;
import com.ruihe.tmall.util.Page;

import java.util.List;

/**
 * Created by seceretrui 2020/01/20/16:12
 */
public interface CategoryService {
    List<Category> list(Page page);
    int total();
    void add(Category category);
    void delete(int id);
}
