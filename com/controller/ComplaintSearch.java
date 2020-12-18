package com.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

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
 * Servlet implementation class ComplaintSearch
 */
@WebServlet("/ComplaintSearch")
public class ComplaintSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BLManager bl = new BLManager();
	Customer c = new Customer();
	Employee e = new Employee();
	Complaint com = new Complaint();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String fdate1 = request.getParameter("fdate");
		String tdate1 = request.getParameter("tdate");
		System.out.println(fdate1);
		Date fdate=Date.valueOf(fdate1);
		Date tdate=Date.valueOf(tdate1);
		
		List<Complaint> com=bl.serachbyfdatetotdate(fdate,tdate);
		
		HttpSession session=request.getSession();
		session.setAttribute("comp",com);
		
		response.sendRedirect("complaintsummary1.jsp");
		
	}

}
