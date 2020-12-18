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
import com.pojo.Attendance;
import com.pojo.Employee;

/**
 * Servlet implementation class AddAttendanceController
 */
@WebServlet("/AddAttendanceController")
public class AddAttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	BLManager bl=new BLManager();
	Employee e=new Employee();
	Attendance ad=new Attendance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
		String email = request.getParameter("email");
		String status = request.getParameter("status");
		String adate = request.getParameter("adate");
		
		Date d=Date.valueOf(adate);
		
		
	
		
		e=bl.serachbyempid(email);
		
		ad.setEmployee(e);
		ad.setAdate(d);
		ad.setStatus(status);
		
		bl.saveattendance(ad);
		

        String m="Attendance Added successfully";
		HttpSession session=request.getSession();
		session.setAttribute("empadd", m);
		
		response.sendRedirect("StaffAttendence.jsp");
	}

}
