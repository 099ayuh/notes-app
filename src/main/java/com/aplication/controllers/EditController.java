package com.aplication.controllers;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aplication.config.Dao;

@WebServlet("/edit")
public class EditController extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String nid = req.getParameter("nid");
		String note = req.getParameter("note");
		LocalDate currentDate = LocalDate.now();
		System.out.println(note);
		Dao.updateNote(nid, note, currentDate.toString());
		res.sendRedirect("home");
	}
}
