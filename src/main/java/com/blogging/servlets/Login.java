package com.blogging.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import com.blogging.dao.UserDao;
import com.blogging.entities.Message;
import com.blogging.entities.User;
import com.blogging.helper.ConnectionProvider;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		User u = dao.getEmailAndPassword(email, password);

		if (u == null) {
//			login error
			Message msg = new Message("Invalid details!...Please try again", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);

			response.sendRedirect("Login.jsp");

		} else {
			// login successful
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
			/*
			 * Using sessions in web applications allows you to store user-specific data on
			 * the server, maintaining state across multiple requests. This is useful for
			 * tracking user authentication, preferences, and other data during their visit.
			 * Sessions enhance security by keeping sensitive information server-side and
			 * improve the user experience by personalizing interactions without needing to
			 * re-authenticate.
			 */

		}
	}

}
