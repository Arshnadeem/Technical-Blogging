package com.blogging.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.Part;

import com.blogging.dao.PostDao;
import com.blogging.entities.Posts;
import com.blogging.entities.User;
import com.blogging.helper.ConnectionProvider;
import com.blogging.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
        
		int cId = Integer.parseInt(request.getParameter("cid"));
        String pTitle = request.getParameter("postTitle");
        String pcontent = request.getParameter("postContent");
        String pcode = request.getParameter("postCode");
       
        Part part = request.getPart("postPic");
        
        //getting session for userid
        HttpSession session = request.getSession();
        User user =(User)session.getAttribute("currentUser");
        
        
        Posts p = new Posts(pTitle, pcontent, pcode, part.getSubmittedFileName(), null, cId , user.getId());
        
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        
        if(dao.savePost(p)) {
        	
        	// Fetch ServletContext
        				ServletContext context = request.getServletContext();
        				// Get the real path for the "pics" directory
        				String path = context.getRealPath("/") + "blogPics" + File.separator + part.getSubmittedFileName();
        				System.out.print(path);
        				Helper.saveFile(part.getInputStream(), path);
        				out.print("done");

        }else {
        	out.print("error");
        }

        // Further processing can be done here like saving to the database, etc.
    }

}
