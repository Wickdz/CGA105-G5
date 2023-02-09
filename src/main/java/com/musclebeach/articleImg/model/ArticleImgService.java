package com.musclebeach.articleImg.model;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Connection;
import java.util.List;

@Service
public class ArticleImgService {
    @Resource
    private ArticleImgDAO_interface dao;

    public ArticleImgVO addArticleImg(byte[] artImg, Integer artID) {

        ArticleImgVO articleImgVO = new ArticleImgVO();

        articleImgVO.setArtImg(artImg);
        articleImgVO.setArtID(artID);

        dao.insert(articleImgVO);
        return articleImgVO;
    }

    public ArticleImgVO addArticleImg2(byte[] artImg, Integer artID, Connection con) {
        ArticleImgVO articleImgVO = new ArticleImgVO();
        articleImgVO.setArtImg(artImg);
        articleImgVO.setArtID(artID);
        dao.insert2(articleImgVO, con);
        return articleImgVO;
    }

    public void deleteArticleImg(Integer imgID) {
        dao.delete(imgID);
    }

    public ArticleImgVO updateArticleImg(Integer imgID, byte[] artImg) {

        ArticleImgVO articleImgVO = new ArticleImgVO();

        articleImgVO.setImgID(imgID);
        articleImgVO.setArtImg(artImg);

        return articleImgVO;
    }

    public List<ArticleImgVO> getAllByArtID(Integer artID) {
        return dao.getAllByArtID(artID);
    }

    public List<ArticleImgVO> getAll() {
        return dao.getAll();
    }

    public ArticleImgVO getOneArticleImg(Integer imgID) {
        return dao.findByPrimaryKey(imgID);
    }

    public Boolean insertArticleImages(List<ArticleImgVO> articleImgVOList) {
        return dao.insertImagesBatch(articleImgVOList) > 0;
    }
}
