package com.ruihe.tmall.controller;

import com.ruihe.tmall.pojo.Category;
import com.ruihe.tmall.service.CategoryService;
import com.ruihe.tmall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by seceretrui 2020/01/20/16:22
 */

@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_category_list")
    public String list(Model model, Page page) {
        int total = categoryService.total();
        page.setTotal(total);
        List<Category> categoryList = categoryService.list(page);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("page", page);
        return "admin/listCategory";
    }
}
