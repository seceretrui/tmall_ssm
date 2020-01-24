package com.ruihe.tmall.service.impl;

import com.ruihe.tmall.mapper.CategoryMapper;
import com.ruihe.tmall.pojo.Category;
import com.ruihe.tmall.service.CategoryService;
import com.ruihe.tmall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by seceretrui 2020/01/20/16:15
 */
@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> list(Page page) {
        return categoryMapper.list(page);
    }

    @Override
    public int total() {
        return categoryMapper.total();
    }

    @Override
    public void add(Category category) {
        categoryMapper.add(category);
    }

    @Override
    public void delete(Category category) {
        categoryMapper.delete(category);
    }
}
