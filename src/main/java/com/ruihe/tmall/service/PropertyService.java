package com.ruihe.tmall.service;

import com.ruihe.tmall.pojo.Property;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by seceretrui 2020/02/01/14:24
 */
public interface PropertyService {
    void add(Property p);
    void delete(int id);
    void update(Property p);
    Property get(int id);
    List<Property> list(int cid);
}
