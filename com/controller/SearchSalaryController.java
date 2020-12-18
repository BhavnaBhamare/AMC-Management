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
import com.pojo.Attendance;
import com.pojo.Employee;
import com.pojo.Salary;

@WebServlet("/SearchSalaryController")
public class SearchSalaryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	BLManager bl=new BLManager();
	Salary s=new Salary();
	Attendance a=new Attendance();
	Employee e=new Employee();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String month=request.getParameter("month");
		
		List<Salary> ad=bl.serachbymonthlist(month);
				
		HttpSession session=request.getSession();
		session.setAttribute("month",ad);
		
		response.sendRedirect("GenerateSalary1.jsp");
	}

}
