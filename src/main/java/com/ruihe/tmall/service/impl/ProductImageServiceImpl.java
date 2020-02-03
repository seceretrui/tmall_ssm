package com.ruihe.tmall.service.impl;

import com.ruihe.tmall.mapper.ProductImageMapper;
import com.ruihe.tmall.pojo.ProductImage;
import com.ruihe.tmall.pojo.ProductImageExample;
import com.ruihe.tmall.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by seceretrui 2020/02/03/13:39
 */
@Service
public class ProductImageServiceImpl implements ProductImageService{
    @Autowired
    ProductImageMapper productImageMapper;
    @Override
    public void add(ProductImage p) {
        productImageMapper.insert(p);
    }

    @Override
    public void delete(int id) {
        productImageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<ProductImage> list(int pid, String type) {
        ProductImageExample example = new ProductImageExample();
        example.createCriteria().andPidEqualTo(pid)
                                .andTypeEqualTo(type);
        example.setOrderByClause("id desc");
        return productImageMapper.selectByExample(example);
    }

    @Override
    public ProductImage get(int id) {
        return productImageMapper.selectByPrimaryKey(id);
    }
}
