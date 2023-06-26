package com.aplication.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aplication.config.Dao;
import com.aplication.model.Notes;

@WebServlet("/home")
public class HomeController extends HttpServlet {

	public boolean checkSession(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("username") == null) {
			res.sendRedirect("index.jsp");
			return false;
		}
		return true;
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		boolean status = checkSession(req, res);
		if (status) {
			HttpSession session = req.getSession(false);
			String uid = (String) session.getAttribute("uid");
			ArrayList<Notes> notes = Dao.getAllNotesByUid(uid);
			req.setAttribute("notes", notes);
			req.getRequestDispatcher("home.jsp").forward(req, res);
		}
	}
}