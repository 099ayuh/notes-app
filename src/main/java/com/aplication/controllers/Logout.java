package com.aplication.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		if (session.getAttribute("username") != null) {
			System.out.println("deleted ");
			session.invalidate();
			res.sendRedirect("http://localhost:8080/notes-app/");
		}
	}

}
