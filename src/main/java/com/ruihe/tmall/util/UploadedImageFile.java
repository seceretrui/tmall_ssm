package com.ruihe.tmall.util;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by seceretrui 2020/01/21/22:20
 */
public class UploadedImageFile {
    MultipartFile image;

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }
}
