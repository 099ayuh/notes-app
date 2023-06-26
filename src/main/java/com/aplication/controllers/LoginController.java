package com.aplication.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aplication.config.Dao;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	public void checkSession(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		if (session.getAttribute("username") != null) {
			res.sendRedirect("home");
		} else {
			res.sendRedirect("http://localhost:8080/notes-app/");
		}
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		checkSession(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String username = req.getParameter("uname");
		String password = req.getParameter("upass");
		System.out.println(username + " " + password);
		boolean result = Dao.verifyUser(username, password);
		if (result) {
			String uid = Dao.getUID(username, password);
			HttpSession session = req.getSession(false);
			session.setAttribute("uid", uid);
			session.setAttribute("username", username);
			res.sendRedirect("home");
		} else {
			req.setAttribute("error", "username and password id not correct");
			req.getRequestDispatcher("index.jsp").forward(req, res);
		}
	}
}
