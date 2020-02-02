package com.ruihe.tmall.service;

import com.ruihe.tmall.pojo.Product;

import java.util.List;

/**
 * Created by seceretrui 2020/02/02/13:01
 */
public interface ProductService {
    void add(Product p);
    void delete(int id);
    void update(Product p);
    Product get(int id);
    List<Product> list(int cid);
}
