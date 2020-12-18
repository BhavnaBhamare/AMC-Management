package com.controller;

import java.io.IOException;
import java.sql.Date;

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

@WebServlet("/ComplaintUpdate")
public class ComplaintUpdate extends HttpServlet {
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
		  
		  HttpSession session=request.getSession();
		  session.setAttribute("comp",com);
		  
		  response.sendRedirect("UpdateComplaint.jsp");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cname = request.getParameter("cname");
		String ename = request.getParameter("ename");
		String status = request.getParameter("status");
		String problem = request.getParameter("problem");
		String sdate = request.getParameter("sdate");
		String expense = request.getParameter("expense");
		
		
		System.out.println("records-----------"+cname+" "+ename+" "+status+" "+problem+" "+sdate+" "+expense);

		Date d = Date.valueOf(sdate);
		int exp = Integer.parseInt(expense);

		c = bl.serachbycname(cname);
		e = bl.serachbyename(ename);

		com.setCustomer(c);
		com.setEmployee(e);
		com.setStatusdate(d);
		com.setExpense(exp);
		com.setProblem(problem);
		com.setStatus(status);

		bl.updatecomplaint(com);

		String m = "Complaint Update";
		HttpSession session = request.getSession();
		session.setAttribute("empadd", m);

		response.sendRedirect("complaintStatus.jsp");
	}

}
