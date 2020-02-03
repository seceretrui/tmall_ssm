package com.ruihe.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruihe.tmall.pojo.Product;
import com.ruihe.tmall.pojo.ProductImage;
import com.ruihe.tmall.service.ProductImageService;
import com.ruihe.tmall.service.ProductService;
import com.ruihe.tmall.util.ImageUtil;
import com.ruihe.tmall.util.Page;
import com.ruihe.tmall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by seceretrui 2020/02/03/13:51
 */
@Controller
public class ProductImageController {
    @Autowired
    ProductImageService productImageService;

    @Autowired
    ProductService productService;

    @RequestMapping("admin_add_productImage")
    public String add(ProductImage productImage, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        productImageService.add(productImage);
        String fileName = productImage.getId() + ".jpg";
        String imageFolder;
        String imageFolder_small = null;
        String imageFolder_middle = null;
        if (productImageService.type_single.equals(productImage.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
        } else {
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
        }

        File file = new File(imageFolder, fileName);
        file.getParentFile().mkdirs();

        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);

        if (ProductImageService.type_single.equals(productImage.getType())) {
            File f_small = new File(imageFolder_small, fileName);
            File f_middle = new File(imageFolder_middle, fileName);

            ImageUtil.resizeImage(file, 56, 56, f_small);
            ImageUtil.resizeImage(file, 217, 190, f_middle);
        }
        return "redirect:/admin_productImage_list?pid="+productImage.getPid();
    }

    @RequestMapping("admin_delete_productImage")
    public String delete(int id, HttpSession session) throws IOException {
        ProductImage p = productImageService.get(id);

        String fileName = p.getId() + ".jpg";
        String imageFolder;
        String imageFolder_small = null;
        String imageFolder_middle = null;

        if (productImageService.type_single.equals(p.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
            File f = new File(imageFolder, fileName);
            File f_small = new File(imageFolder_small, fileName);
            File f_middle = new File(imageFolder_middle, fileName);
            f.delete();
            f_small.delete();
            f_middle.delete();
        } else {
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
            File f = new File(imageFolder, fileName);
            f.delete();
        }
        productImageService.delete(id);
        return "redirect:/admin_productImage_list?pid="+p.getPid();
    }

    @RequestMapping("admin_productImage_list")
    public String list(int pid, Model model) {
        Product p = productService.get(pid);
        List<ProductImage> listSingle = productImageService.list(pid, ProductImageService.type_single);
        List<ProductImage> listDetail = productImageService.list(pid, ProductImageService.type_detail);

        model.addAttribute("p", p);
        model.addAttribute("listSingle", listSingle);
        model.addAttribute("listDetail", listDetail);

        return "admin/listProductImage";
    }
}
