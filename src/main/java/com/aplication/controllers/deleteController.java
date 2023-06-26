package com.aplication.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aplication.config.Dao;

@WebServlet("/delete")
public class deleteController extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int noteId = Integer.parseInt(req.getParameter("note_id"));
		Dao.deleteNoteByNoteId(noteId);
		res.sendRedirect("home");
	}

}
