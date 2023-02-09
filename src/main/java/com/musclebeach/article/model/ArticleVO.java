package com.musclebeach.article.model;

import com.musclebeach.articleMessage.model.ArticleMessageService;
import com.musclebeach.articleMessage.model.ArticleMessageVO;
import com.musclebeach.articleType.model.ArticleTypeService;
import com.musclebeach.articleType.model.ArticleTypeVO;
import com.musclebeach.common.util.ApplicationContextUtil;
import org.springframework.context.ApplicationContext;

import java.sql.Timestamp;
import java.util.List;

public class ArticleVO implements java.io.Serializable {
    private final ApplicationContext ctx = ApplicationContextUtil.getContext();
    private final ArticleMessageService articleMessageService = ctx.getBean(ArticleMessageService.class);
    private final ArticleTypeService articleTypeService = ctx.getBean(ArticleTypeService.class);

    private Integer artID;
    private Integer memID;
    private Integer typeID;
    private String artTitle;
    private String artContent;
    private Timestamp artStime;
    private Timestamp artLtime;
    private Integer artStatus;

    public Integer getArtID() {
        return artID;
    }

    public void setArtID(Integer artID) {
        this.artID = artID;
    }

    public Integer getMemID() {
        return memID;
    }

    public void setMemID(Integer memID) {
        this.memID = memID;
    }

    public Integer getTypeID() {
        return typeID;
    }

    public void setTypeID(Integer typeID) {
        this.typeID = typeID;
    }

    public String getArtTitle() {
        return artTitle;
    }

    public void setArtTitle(String artTitle) {
        this.artTitle = artTitle;
    }

    public String getArtContent() {
        return artContent;
    }

    public void setArtContent(String artContent) {
        this.artContent = artContent;
    }

    public Timestamp getArtStime() {
        return artStime;
    }

    public void setArtStime(Timestamp artStime) {
        this.artStime = artStime;
    }

    public Timestamp getArtLtime() {
        return artLtime;
    }

    public void setArtLtime(Timestamp artLtime) {
        this.artLtime = artLtime;
    }

    public Integer getArtStatus() {
        return artStatus;
    }

    public void setArtStatus(Integer artStatus) {
        this.artStatus = artStatus;
    }

    public List<ArticleMessageVO> getArticleMessageVO() {  //取得文章留言
        return articleMessageService.getAllByArtID(artID);
    }

    public ArticleTypeVO getArticleTypeVO() {
        return articleTypeService.getOneArticleType(typeID);
    }
}
