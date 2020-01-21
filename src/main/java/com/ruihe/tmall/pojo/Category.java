package com.ruihe.tmall.pojo;

import lombok.Data;

/**
 * Created by seceretrui 2020/01/20/15:58
 */

@Data
public class Category {
    private Integer id;
    private String name;

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}
