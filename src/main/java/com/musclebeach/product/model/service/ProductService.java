package com.musclebeach.product.model.service;

import com.musclebeach.product.model.entity.Product;
import com.musclebeach.product.model.entity.ProductImg;

import java.util.List;

public interface ProductService {
    Product getOneProd(Integer proID);

    ProductImg getOneProdIMG(Integer proID);

    List<Product> getAll();

    Product addProd(String proName, Integer typeID, Integer proQty, Integer proPrice,
                    String proContent, Integer proStatus, Integer proID, byte[] ProImg);

    void deleteProd(Integer proID);

    Product updateProd(Integer proID, String proName, Integer typeID, Integer proQty, Integer proPrice,
                       String proContent, Integer proStatus, byte[] proImg);

    ProductImg upload(byte[] proImg, Integer proID);

    Product addProdAndFile(String proName, Integer typeID, Integer proQty, Integer proPrice,
                           String proContent, byte[] proImg);

    Product getSpecifiedProduct(Integer proID);

    List<Product> findAllProduct();

    List<Product> findSameCategoryProduct(Integer prodType);

    List<Product> findSpecifiedProduct(String keyword);

    byte[] findProductImg(Integer proID);
}
