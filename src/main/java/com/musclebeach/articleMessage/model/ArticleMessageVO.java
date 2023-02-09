package com.musclebeach.articleMessage.model;

import java.sql.Timestamp;

public class ArticleMessageVO implements java.io.Serializable {
    private Integer msgID;
    private Integer memID;
    private Integer artID;
    private String msgContent;
    private Integer msgStatus;
    private Timestamp msgStime;

    public Integer getMsgID() {
        return msgID;
    }

    public void setMsgID(Integer msgID) {
        this.msgID = msgID;
    }

    public Integer getMemID() {
        return memID;
    }

    public void setMemID(Integer memID) {
        this.memID = memID;
    }

    public Integer getArtID() {
        return artID;
    }

    public void setArtID(Integer artID) {
        this.artID = artID;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public Integer getMsgStatus() {
        return msgStatus;
    }

    public void setMsgStatus(Integer msgStatus) {
        this.msgStatus = msgStatus;
    }

    public Timestamp getMsgStime() {
        return msgStime;
    }

    public void setMsgStime(Timestamp msgStime) {
        this.msgStime = msgStime;
    }

}
