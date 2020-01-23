package com.ruihe.tmall.mapper;

import com.ruihe.tmall.pojo.Category;
import com.ruihe.tmall.util.Page;

import java.util.List;

/**
 * Created by seceretrui 2020/01/20/16:11
 */
public interface CategoryMapper {
    List<Category> list(Page page);
    int total();
    void add(Category category);
}
