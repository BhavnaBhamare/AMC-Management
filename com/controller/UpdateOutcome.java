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
import com.pojo.Manageoutgoing;
import com.pojo.Productgroup;

@WebServlet("/UpdateOutcome")
public class UpdateOutcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Productgroup pg = new Productgroup();
	Manageoutgoing mi = new Manageoutgoing();
	BLManager bl = new BLManager();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int moid = Integer.parseInt(request.getParameter("moid"));
		mi = bl.searchByouid(moid);
		HttpSession session = request.getSession();
		session.setAttribute("list", mi);
		response.sendRedirect("updateOutcome.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String productGroupName = request.getParameter("productGroupName");
		pg = bl.searchbyproductGroupName(productGroupName);

		int outstock = Integer.parseInt(request.getParameter("instock"));
		Date d = Date.valueOf(request.getParameter("outstockdate"));

		mi.setProductgroup(pg);
		mi.setOutstock(outstock);
		mi.setOutstockdate(d);
		
		bl.updateoutstock(mi);
		
		String m = "Update  successfully";
		HttpSession session = request.getSession();
		session.setAttribute("msg", m);
		response.sendRedirect("ViewOutcome.jsp");
	}

}
