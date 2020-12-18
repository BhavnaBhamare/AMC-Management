package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Customer;

/**
 * Servlet implementation class AddCustomer
 */
@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	BLManager bl=new BLManager();
	Customer c=new Customer();
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cname=request.getParameter("fname");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phno=request.getParameter("phno");
		
		Date d=new Date();
		
		c.setCname(cname);
		c.setEmail(email);
		c.setAddress(address);
		c.setPhone(phno);
		c.setRegdate(d);
		
	    bl.savecustomer(c);
		
        String m="Customer Added successfully";
		HttpSession session=request.getSession();
		session.setAttribute("empadd", m);
		
		response.sendRedirect("addcustomer.jsp");
		
	}

}
