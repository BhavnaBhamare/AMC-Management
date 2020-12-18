package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Complaint;
import com.pojo.Customer;
import com.pojo.Employee;

/**
 * Servlet implementation class ComplaintDelete
 */
@WebServlet("/ComplaintDelete")
public class ComplaintDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BLManager bl = new BLManager();
	Customer c = new Customer();
	Employee e = new Employee();
	Complaint com = new Complaint();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String comid=request.getParameter("comid");
		  int id=Integer.parseInt(comid);
		  
		  com=bl.serachbycomid(id);
		  
		  bl.deletecomplaint(com);
		  
		  response.sendRedirect("complaintsummary1.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
