package com.musclebeach.article.model;

import com.musclebeach.articleImg.model.ArticleImgVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ArticleService {
    @Resource
    private ArticleDAO_interface dao;

    public ArticleVO addArticle(Integer memID, Integer typeID, String artTitle, String artContent) {

        ArticleVO articleVO = new ArticleVO();

        articleVO.setMemID(memID);
        articleVO.setTypeID(typeID);
        articleVO.setArtTitle(artTitle);
        articleVO.setArtContent(artContent);
        dao.insert(articleVO);

        return articleVO;
    }

    public ArticleVO addWithArticleImgs(Integer memID, Integer typeID, String artTitle, String artContent,
                                        List<byte[]> list) {

        ArticleVO articleVO = new ArticleVO();

        articleVO.setMemID(memID);
        articleVO.setTypeID(typeID);
        articleVO.setArtTitle(artTitle);
        articleVO.setArtContent(artContent);

        List<ArticleImgVO> articleImgVO = (List<ArticleImgVO>) new ArticleImgVO();

        for (byte[] item : list) {
            ((ArticleImgVO) articleImgVO).setArtImg(item);
        }

        dao.insertWithArticleImgs(articleVO, articleImgVO);

        return articleVO;
    }

    public ArticleVO updateArticle(Integer artID, Integer memID, Integer typeID, String artTitle, String artContent,
                                   Integer artStatus) {

        ArticleVO articleVO = new ArticleVO();

        articleVO.setArtID(artID);
        articleVO.setMemID(memID);
        articleVO.setTypeID(typeID);
        articleVO.setArtTitle(artTitle);
        articleVO.setArtContent(artContent);
        articleVO.setArtStatus(artStatus);

        dao.update(articleVO);

        return articleVO;
    }

    public ArticleVO getOneArticleVO(Integer artID) {
        return dao.findByPrimaryKey(artID);
    }

    public List<ArticleVO> getAll() {
        return dao.getAll();
    }

    public List<ArticleVO> getAllByTypeID(Integer TypeID) {
        return dao.getAllByTypeID(TypeID);
    }

    public List<ArticleVO> getAll(Map<String, String[]> map) {    //複合查詢
        return dao.getAll(map);
    }
}
