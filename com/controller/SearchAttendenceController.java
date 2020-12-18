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

/**
 * Servlet implementation class SearchAttendenceController
 */
@WebServlet("/SearchAttendenceController")
public class SearchAttendenceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    BLManager bl=new BLManager();
	Employee e=new Employee();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session=request.getSession();
	  String email=request.getParameter("email");
	  e=bl.serachbyempid(email);
	  
	  int eid=e.getEid();
	  List<Attendance> alist=bl.searchbyattendence(eid);
	session.setAttribute("alist", alist);
	
	response.sendRedirect("viewAttendence.jsp");
	}

}
