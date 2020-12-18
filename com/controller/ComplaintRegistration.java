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

/**
 * Servlet implementation class ComplaintRegistration
 */
@WebServlet("/ComplaintRegistration")
public class ComplaintRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BLManager bl = new BLManager();
	Customer c = new Customer();
	Employee e = new Employee();
	Complaint com = new Complaint();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		String cname = request.getParameter("cname");
		String ename = request.getParameter("ename");
		String status = request.getParameter("status");
		String problem = request.getParameter("problem");
		String sdate = request.getParameter("sdate");
		String expense = request.getParameter("expense");

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

		bl.savecomplaint(com);

		String m = "Complaint Added";
		HttpSession session = request.getSession();
		session.setAttribute("empadd", m);

		response.sendRedirect("complaintRegister.jsp");

	}

}
