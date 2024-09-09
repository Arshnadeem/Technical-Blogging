package com.blogging.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import com.blogging.dao.LikeDao;
import com.blogging.helper.ConnectionProvider;


public class LikeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LikeServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");  // Set content type to plain text
        PrintWriter out = response.getWriter();

        String operation = request.getParameter("operation");
        int postId = Integer.parseInt(request.getParameter("pId"));
        int userId = Integer.parseInt(request.getParameter("uId"));

        LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
        boolean isLiked = ldao.isLikedByUser(postId, userId);

        if (isLiked) {
            ldao.removeLike(postId, userId);
            out.print("unliked");
        } else {
            ldao.insertLike(postId, userId);
            out.print("liked");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
