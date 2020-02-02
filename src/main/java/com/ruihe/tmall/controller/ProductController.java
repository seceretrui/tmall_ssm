package com.ruihe.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruihe.tmall.pojo.Category;
import com.ruihe.tmall.pojo.Product;
import com.ruihe.tmall.service.CategoryService;
import com.ruihe.tmall.service.ProductService;
import com.ruihe.tmall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Created by seceretrui 2020/02/02/13:36
 */
@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_product_add")
    public String add(Product p) {
        p.setCreateDate(new Date());
        productService.add(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_delete")
    public String delete(int id) {
        Product p = productService.get(id);
        productService.delete(id);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_edit")
    public String edit(Model model, int id) {
        Product p = productService.get(id);
        Integer cid = p.getCid();
        Category c = categoryService.get(cid);
        p.setCategory(c);
        model.addAttribute("p", p);
        return "admin/editProduct";
    }

    @RequestMapping("admin_product_update")
    public String update(Product p) {
        productService.update(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }
    @RequestMapping("admin_product_list")
    public String list(Model model, Page page, int cid) {
        List<Product> ps = productService.list(cid);
        Category c = categoryService.get(cid);
        PageHelper.offsetPage(0, 5);

        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        page.setParam("cid="+cid);

        model.addAttribute("c", c);
        model.addAttribute("page", page);
        model.addAttribute("ps", ps);
        return "admin/listProduct";
    }
}
