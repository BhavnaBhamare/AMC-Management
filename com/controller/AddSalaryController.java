package com.controller;

import java.io.IOException;
import java.util.Date;
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

/**
 * Servlet implementation class AddSalaryController
 */
@WebServlet("/AddSalaryController")
public class AddSalaryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	BLManager bl=new BLManager();
	Employee emp=new Employee();
	Salary s=new Salary();
	Attendance a=new Attendance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
		String salary = request.getParameter("salary");
		String bonus = request.getParameter("bonus");
		String month=request.getParameter("month");
	
		double sal=Double.parseDouble(salary);
		double bon=Double.parseDouble(bonus);
		int perd=(int)sal/30;
		double total=sal+bon;
		
		
		emp=bl.serachbyempid(email);
		
		int id=emp.getEid();
		System.out.println(id);
		List<Long> al=bl.searchbynoOfleavs(id);
		
		String atten="";
		for(long l:al)
		{
			atten=atten+(int)l;
		}
		int count =Integer.parseInt(atten);
		
		int temp=perd*count;
		
		total=total-temp;
		
		
		s.setEmployee(emp);
		s.setSalary(sal);
		s.setBonus(bon);
		s.setTotal(total);
		s.setMonth(month);
		
        bl.savesalary(s);
		

        String m="Salary Added successfully";
		HttpSession session=request.getSession();
		session.setAttribute("empadd",m);
		
		response.sendRedirect("StaffSalary.jsp");
		
	}

}
