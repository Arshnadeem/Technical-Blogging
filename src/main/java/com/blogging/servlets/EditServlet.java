package com.blogging.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletContext;
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

import com.blogging.dao.UserDao;
import com.blogging.entities.Message;
import com.blogging.entities.User;
import com.blogging.helper.ConnectionProvider;
import com.blogging.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		fetch data 
		PrintWriter out = response.getWriter();
		String userEmail = request.getParameter("user_Email");
		String userName = request.getParameter("user_Name");
		String userPassword = request.getParameter("user_Password");
		String userAbout = request.getParameter("user_About");
		Part getImg = request.getPart("image");
		String imgName = getImg.getSubmittedFileName();

//		get the user from session in login page
		HttpSession s = request.getSession();
		User u = (User) s.getAttribute("currentUser");

		u.setEmail(userEmail);
		u.setName(userName);
		u.setPassword(userPassword);
		u.setAbout(userAbout);
		String oldFile = u.getProfile();
		u.setProfile(imgName);

//		update database 

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.userUpdate(u);
		if (ans) {
			out.print("User data updated to Db");

			// Fetch ServletContext
			ServletContext context = request.getServletContext();

			// Get the real path for the "pics" directory
			String path = context.getRealPath("/") + "pics" + File.separator + u.getProfile();

			// oldpath
			String oldpathFile = context.getRealPath("/") + "pics" + File.separator + oldFile;

			if (!oldpathFile.equals("default.png")) {
				Helper.deleteFile(oldpathFile);
			}

			if (Helper.saveFile(getImg.getInputStream(), path)) {
				out.print("Profile Updated...");

				Message msg = new Message("Profile details updated...", "success", "alert-success");
				s.setAttribute("msg", msg);
			} else {
				out.print("file not saved successfully");
				Message msg = new Message("Something went wrong", "error", "alert-error");
				s.setAttribute("msg", msg);
			}

		} else {
			out.print("Not updated");
			Message msg = new Message("Something went wrong", "error", "alert-error");
			s.setAttribute("msg", msg);
		}

		response.sendRedirect("profile.jsp");
	}

}
