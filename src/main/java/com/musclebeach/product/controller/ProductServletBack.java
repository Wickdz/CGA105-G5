package com.musclebeach.product.controller;

import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.product.model.entity.Product;
import com.musclebeach.product.model.entity.ProductType;
import com.musclebeach.product.model.service.ProductService;
import com.musclebeach.product.model.service.ProductTypeService;
import org.springframework.context.ApplicationContext;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

@WebServlet({"/back-end/product/listOneProd", "/back-end/product/getOneForUpdate", "/back-end/product/delete",
        "/back-end/product/updateProdInput", "/back-end/product/addOneProd", "/back-end/product/listAllProd1",
        "/back-end/product/addOneProd1", "/back-end/product/select_page1"})
@MultipartConfig
public class ProductServletBack extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ApplicationContext context = ApplicationContextUtil.getContext();
    private final ProductService prodSvc = context.getBean(ProductService.class);
    private final ProductTypeService productTypeServiceBack = context.getBean(ProductTypeService.class);

    public static byte[] getPictureByteArray(String path) throws IOException {
        FileInputStream fis = new FileInputStream(path);
        byte[] buffer = new byte[fis.available()];
        fis.read(buffer);
        fis.close();
        return buffer;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);

            /*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
            String str = request.getParameter("proID");
            if (str == null || (str.trim()).length() == 0) {
                errorMsgs.add("請輸入商品編號");
            }
            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/back-end/product/select_page.jsp");
                failureView.forward(request, response);
                return;// 程式中斷
            }

            Integer proID = null;
            try {
                proID = Integer.valueOf(str);
            } catch (Exception e) {
                errorMsgs.add("商品編號格式不正確");
            }
            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/back-end/product/select_page.jsp");
                failureView.forward(request, response);
                return;//// 程式中斷
            }

            /*************************** 2.開始查詢資料 *****************************************/

            Product prodVO = prodSvc.getOneProd(proID);
            if (prodVO == null) {
                errorMsgs.add("查無資料");
            }
            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/back-end/product/select_page.jsp");
                failureView.forward(request, response);
                return;// 程式中斷
            }

            /*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
            request.setAttribute("prodVO", prodVO); // 資料庫取出的prodVO物件,存入req
            String url = "/back-end/product/listOneProd.jsp";
            RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
            successView.forward(request, response);
        }

        if ("insert".equals(action)) { // 來自addProd.jsp的請求

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);

            /*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
            String proName = request.getParameter("proName");
            String proNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
            if (proName == null || proName.trim().length() == 0) {
                errorMsgs.add("商品名稱: 請勿空白");
            } else if (!proName.trim().matches(proNameReg)) { // 以下練習正則(規)表示式(regular-expression)
                errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到40之間");
            }
            Integer typeID = Integer.valueOf(request.getParameter("typeID").trim());

            Integer proQty = null;
            try {
                proQty = Integer.valueOf(request.getParameter("proQty"));
            } catch (NumberFormatException e) {
                proQty = 0;
                errorMsgs.add("商品數量請填數字");
            }

            Integer proPrice = null;
            try {
                proPrice = Integer.valueOf(request.getParameter("proPrice"));
            } catch (NumberFormatException e) {
                proPrice = 0;
                errorMsgs.add("價格請填數字");
            }

            String proContent = request.getParameter("proContent").trim();
            if (proContent == null || proContent.trim().length() == 0) {
                errorMsgs.add("商品描述請勿空白");
            }

            Product prodVO = new Product();
            prodVO.setProName(proName);
            prodVO.setTypeID(typeID);
            prodVO.setProQty(proQty);
            prodVO.setProPrice(proPrice);
            prodVO.setProContent(proContent);

            // 接收圖片參數
            Part part = request.getPart("proImg");

            // 將圖片轉為byte陣列
            InputStream in = part.getInputStream();
            byte[] proImg = new byte[in.available()];
            if (proImg.length == 0) {
                in = getServletContext().getResourceAsStream("/back-end/product/images/nopic.png");
                proImg = new byte[in.available()];
            }

            in.read(proImg);
            in.close();

            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                request.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
                RequestDispatcher failureView = request.getRequestDispatcher("/back-end/product/addProd.jsp");
                failureView.forward(request, response);
                return;
            }
            /*************************** 2.開始新增資料 ***************************************/

            System.out.println("id = " + typeID);
            prodVO = prodSvc.addProdAndFile(proName, typeID, proQty, proPrice, proContent, proImg);
            System.out.println(prodVO);
            /*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
            String url = "/back-end/product/listAllProd.jsp";
            RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllProd.jsp
            successView.forward(request, response);
        }

        if ("insert_type".equals(action)) { // 來自addProdType.jsp的請求

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);

            /*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
            String typeName = request.getParameter("typeName");
            String typeNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
            if (typeName == null || typeName.trim().length() == 0) {
                errorMsgs.add("商品類別: 請勿空白");
            } else if (!typeName.trim().matches(typeNameReg)) { // 以下練習正則(規)表示式(regular-expression)
                errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到40之間");
            }

            ProductType prodTypeVO = new ProductType();
            prodTypeVO.setTypeName(typeName);

            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                request.setAttribute("prodTypeVO", prodTypeVO); // 含有輸入格式錯誤的prodVO物件,也存入req
                RequestDispatcher failureView = request.getRequestDispatcher("/back-end/product/addProdType.jsp");
                failureView.forward(request, response);
                return;
            }
            /*************************** 2.開始新增資料 ***************************************/

            prodTypeVO = productTypeServiceBack.addProdType(typeName);
            System.out.println(prodTypeVO);
            /*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
            String url = "/back-end/product/listAllProdType.jsp";
            RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllProdType.jsp
            successView.forward(request, response);
        }


        if ("delete".equals(action)) { // 來自listAllProd.jsp

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);

            /*************************** 1.接收請求參數 ***************************************/
            Integer proID = Integer.valueOf(request.getParameter("proID"));

            /*************************** 2.開始刪除資料 ***************************************/

            prodSvc.deleteProd(proID);

            /*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
            String url = "/back-end/product/listAllProd.jsp";
            RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
            successView.forward(request, response);
        }

        if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求
            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);

            try {
                /*************************** 1.接收請求參數 ****************************************/
                Integer proID = Integer.valueOf(request.getParameter("proID"));

                /*************************** 2.開始查詢資料 ****************************************/

                Product prodVO = prodSvc.getOneProd(proID);

                /*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
                request.setAttribute("prodVO", prodVO); // 資料庫取出的ProdVO物件,存入req

                String url = "/back-end/product/update_prod_input.jsp";
                RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
                successView.forward(request, response);
                /***************************其他可能的錯誤處理**********************************/
            } catch (Exception e) {
                errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/back-end/product/listAllProd.jsp");
                failureView.forward(request, response);
            }
        }

        if ("update".equals(action)) { // 來自update_prod_input.jsp的請求
            System.out.println("test0");
            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);
            System.out.println(request.getParameter("proID"));
            System.out.println(request.getParameter("typeID"));
            System.out.println(request.getParameter("proPrice"));

            /*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
            Integer proID = Integer.valueOf(request.getParameter("proID"));
            System.out.println("test2");
            String proName = request.getParameter("proName");
            String proNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
            if (proName == null || proName.trim().length() == 0) {
                errorMsgs.add("商品名稱: 請勿空白");
            } else if (!proName.trim().matches(proNameReg)) { // 以下練習正則(規)表示式(regular-expression)
                errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到40之間");
            }
            System.out.println("test22");
            Integer typeID = null;
            try {
                typeID = Integer.valueOf(request.getParameter("typeID"));
            } catch (NumberFormatException e) {
                typeID = 0;
                errorMsgs.add("商品類別請填數字.");
            }

            Integer proQty = null;
            try {
                proQty = Integer.valueOf(request.getParameter("proQty"));
            } catch (NumberFormatException e) {
                proQty = 0;
                errorMsgs.add("商品數量請填數字");
            }

            Integer proPrice = null;
            try {
                proPrice = Integer.valueOf(request.getParameter("proPrice"));
            } catch (NumberFormatException e) {
                proPrice = 0;
                errorMsgs.add("商品價格請填數字");
            }

            String proContent = request.getParameter("proContent").trim();
            if (proContent == null || proContent.trim().length() == 0) {
                errorMsgs.add("商品描述請勿空白");
            }

            Integer proStatus = null;
            try {
                proStatus = Integer.valueOf(request.getParameter("prodStatus").trim());
            } catch (NumberFormatException e) {
                proStatus = 0;
                errorMsgs.add("商品數量請填0(下架)或1(上架)");
            }

            Timestamp updateTime = Timestamp.valueOf(request.getParameter("updateTime"));
            Timestamp createTime = Timestamp.valueOf(request.getParameter("createTime"));

            ProductType productType = new ProductType();
            productType.setTypeID(typeID);
            System.out.println("test3");
            Product prodVO = new Product();

            prodVO.setProID(proID);
            prodVO.setProName(proName);
            prodVO.setTypeID(typeID);
            prodVO.setProQty(proQty);
            prodVO.setProPrice(proPrice);
            prodVO.setProContent(proContent);
            prodVO.setProStatus(proStatus);
            prodVO.setUpdateTime(updateTime);
            prodVO.setCreateTime(createTime);
            prodVO.setProductType(productType); // 問題在這裡
            System.out.println("test4");
            // 接收圖片參數
            Part part = request.getPart("proImg");

            // 將圖片轉為byte陣列
            InputStream in = part.getInputStream();
            byte[] proImg = new byte[in.available()];
            if (proImg.length == 0) {
                proImg = prodSvc.getOneProdIMG(proID).getProImg();
            }

            in.read(proImg);
            in.close();
            System.out.println("test5");
            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                request.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的ProdVO物件,也存入req
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/back-end/product/update_prod_input.jsp");
                failureView.forward(request, response);
                return; // 程式中斷
            }
            System.out.println("test6");
            /*************************** 2.開始修改資料 *****************************************/


            prodVO = prodSvc.updateProd(proID, proName, typeID, proQty, proPrice, proContent, proStatus, updateTime, createTime, proImg);


            /*************************** 3.修改完成,準備轉交(Send the Success view) *************/
            request.setAttribute("prodVO", prodVO); // 資料庫update成功後,正確的的prodVO物件,存入req
            String url = "/back-end/product/listOneProd.jsp";
            RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交listOneProd.jsp
            successView.forward(request, response);
        }

    }
}
