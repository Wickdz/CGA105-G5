package com.musclebeach.articleImg.controller;

import com.musclebeach.articleImg.model.ArticleImgService;
import com.musclebeach.articleImg.model.ArticleImgVO;
import com.musclebeach.common.util.ApplicationContextUtil;
import org.springframework.context.ApplicationContext;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@WebServlet({"/back-end/article/articleImg.do", "/front-end/article/articleImg.do"})
@MultipartConfig
public class ArticleImgServlet extends HttpServlet {
    private final ApplicationContext ctx = ApplicationContextUtil.getContext();
    private final ArticleImgService articleImgService = ctx.getBean(ArticleImgService.class);

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
        Integer artID = -1;
        List<byte[]> artImgs = new ArrayList<byte[]>();
        List<ArticleImgVO> articleImgVOList = new ArrayList<>();
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求
            req.setAttribute("errorMsgs", errorMsgs);
//		/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
            // 照片
            Collection<Part> parts = req.getParts();
            for (Part part : parts) {
                if (part.getName().equals("artImg")) {
                    InputStream in = part.getInputStream();
                    byte[] imgData = new byte[in.available()];
                    in.read(imgData);
                    in.close();
                    artImgs.add(imgData);
                }
            }
            if (artImgs.isEmpty()) {
                errorMsgs.put("artImg", "文章图片: 请上传图片");
            }
            artID = Integer.valueOf(req.getParameter("artID").trim());
            for (byte[] artImg : artImgs) {
                ArticleImgVO articleImgVO = new ArticleImgVO();
                articleImgVO.setArtImg(artImg);
                articleImgVO.setArtID(artID);
                articleImgVOList.add(articleImgVO);
            }
            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                req.setAttribute("articleImgVOList", articleImgVOList); // 含有輸入格式錯誤的articleVO物件,也存入req
                RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/update_article_input.jsp");
                failureView.forward(req, res);
                return; // 程式中斷
            }
            /*************************** 2.開始新增資料 ***************************************/
            articleImgService.insertArticleImages(articleImgVOList);
            /*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
            res.getWriter().println("success");
            String url = "/back-end/article/listOneArticle.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneArticle.jsp
            successView.forward(req, res);
        }
    }
}
