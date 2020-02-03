package com.ruihe.tmall.service;

import com.ruihe.tmall.pojo.ProductImage;

import java.util.List;

/**
 * Created by seceretrui 2020/02/03/13:36
 */
public interface ProductImageService {
    String type_single = "type_single";
    String type_detail = "type_detail";
    void add(ProductImage p);
    void delete(int id);
    List<ProductImage> list(int pid, String type);
    ProductImage get(int id);
}
