package com.aplication.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aplication.config.Dao;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

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
		String uid = req.getParameter("uid");
		String username = req.getParameter("uname");
		String password = req.getParameter("upass");
		System.out.println(username + " " + password);
		boolean result = Dao.saveUser(uid, username, password);
		if (result) {
			res.sendRedirect("http://localhost:8080/notes-app/");
		}
	}
}
