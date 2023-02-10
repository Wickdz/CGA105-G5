package com.musclebeach.mem.controller;

import com.mem.model.MemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/spanMember")
public class SpanMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer memberId = Integer.valueOf(request.getParameter("memberId"));
        MemService memService = new MemService();
        memService.updateMemStatus(memberId);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("除籍成功！");
    }
}
