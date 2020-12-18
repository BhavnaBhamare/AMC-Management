package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Customer;

/**
 * Servlet implementation class SearchCustomer
 */
@WebServlet("/SearchCustomer")
public class SearchCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	BLManager bl=new BLManager();
	Customer c=new Customer();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cname=request.getParameter("cname");
		
		List<Customer> c=bl.serachbycustname(cname);
		
		HttpSession session=request.getSession();
		session.setAttribute("cust",c);
		
		response.sendRedirect("searchcustomer1.jsp");
		
	}

}
