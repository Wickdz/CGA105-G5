package com.musclebeach.product.model.service;

import com.musclebeach.product.model.dao.ProductDao;
import com.musclebeach.product.model.dao.ProductImgDao;
import com.musclebeach.product.model.entity.Product;
import com.musclebeach.product.model.entity.ProductImg;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ProductServiceBack {
    @Qualifier("ProductDaoImplBack")
    private ProductDao dao;
    @Qualifier("ProductImgDaoImplBack")
    private ProductImgDao dao1;

    public Product getOneProd(Integer prodid) {
        return dao.getById(prodid);
    }

    public ProductImg getOneProdIMG(Integer prodid) {
        return dao1.findByProdID(prodid);
    }

    public List<Product> getAll() {
        return dao.getAll();
    }

    public Product addProd(String proName, Integer typeID, Integer proQty, Integer proPrice,
                           String proContent, Integer proStatus, Integer prodID, byte[] ProImg) {

        Product product = new Product();

        product.setProName(proName);
        product.setTypeID(typeID);
        product.setProQty(proQty);
        product.setProPrice(proPrice);
        product.setProContent(proContent);
        product.setProStatus(proStatus);
        dao.add(product);

        ProductImg prodIMG = new ProductImg();
        prodIMG.setProImg(ProImg);
        prodIMG.setProID(prodID);

        return product;
    }

    public void deleteProd(Integer prodID) {
        dao.delete(prodID);

    }

    public Product updateProd(Integer prodID, String proName, Integer typeID, Integer proQty, Integer proPrice,
                              String proContent, Integer proStatus, Timestamp updateTime, Timestamp createTime, byte[] proImg) {

        Product product = new Product();

        product.setProID(prodID);
        product.setProName(proName);
        product.setTypeID(typeID);
        product.setProQty(proQty);
        product.setProPrice(proPrice);
        product.setProContent(proContent);
        product.setProStatus(proStatus);
        product.setUpdateTime(updateTime);
        product.setCreateTime(createTime);

        ProductImg productImg = new ProductImg();
//		prodIMG.setProdID(product.getProdID());
        productImg.setProImg(proImg);

//		List<ProductImg> alist = new ArrayList<ProductImg>();
//		alist.add(prodIMG);

//		product.setUpdateImg(productImg);

        dao.updateWithProd_IMG(product, productImg);
        return product;
    }

    public ProductImg upload(byte[] proImg, Integer prodID) {

        ProductImg prod_IMGVO = new ProductImg();

        prod_IMGVO.setProImg(proImg);
        prod_IMGVO.setProID(prodID);
        dao1.insert(prod_IMGVO);
        return prod_IMGVO;
    }

    public Product addProdAndFile(String proName, Integer typeID, Integer proQty, Integer proPrice,
                                  String proContent, byte[] proImg) {

        Product prodVO = new Product();
        prodVO.setProName(proName);
        prodVO.setTypeID(typeID);
        prodVO.setProQty(proQty);
        prodVO.setProPrice(proPrice);
        prodVO.setProContent(proContent);

        ProductImg prodIMG = new ProductImg();

        prodIMG.setProImg(proImg);
        List<ProductImg> alist = new ArrayList<ProductImg>();
        alist.add(prodIMG);

        dao.insertWithProd_IMG(prodVO, alist);
        return prodVO;

    }
}
