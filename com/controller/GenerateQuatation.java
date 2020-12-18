package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Customer;
import com.pojo.Manageproduct;
import com.pojo.Quatation;

/**
 * Servlet implementation class GenerateQuatation
 */
@WebServlet("/GenerateQuatation")
public class GenerateQuatation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BLManager bl = new BLManager();
	Customer c = new Customer();
	Manageproduct m = new Manageproduct();

	Quatation q = new Quatation();

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String pname = request.getParameter("pname");
		
		q=bl.searchbypdoctname1(pname);
		
		HttpSession session = request.getSession();
		session.setAttribute("quate", q);
		
		response.sendRedirect("generateQuatation.jsp");
		
	}

}
