package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Billing;
import com.pojo.Customer;
import com.pojo.Manageproduct;
import com.pojo.Quatation;

/**
 * Servlet implementation class SearchInvoice
 */
@WebServlet("/SearchInvoice")
public class SearchInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BLManager bl = new BLManager();
	Customer c = new Customer();
	Manageproduct m = new Manageproduct();
	Billing b = new Billing();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
        String pname = request.getParameter("pname");
        String cname = request.getParameter("cname");
		
        b=bl.searchbypdoctname12(pname,cname);
		
		HttpSession session = request.getSession();
		session.setAttribute("quate",b);
		
		response.sendRedirect("generateInvoice.jsp");
	}

}
