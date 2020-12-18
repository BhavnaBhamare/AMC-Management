package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/StockManageutgoing")
public class StockManageutgoing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BLManager bl = new BLManager();
	Productgroup pg = new Productgroup();
	Manageoutgoing mo = new Manageoutgoing();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String flag = request.getParameter("flag");

		if (flag.equals("Add Outcome")) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			String productGroupName = request.getParameter("productGroupName");

			pg = bl.searchbyproductGroupName(productGroupName);

			String stock = request.getParameter("outstock");
			int outstock = Integer.parseInt(stock);
			Date d = Date.valueOf(request.getParameter("outstockdate"));

			mo.setProductgroup(pg);
			mo.setOutstock(outstock);
			mo.setOutstockdate(d);

			bl.saveOutgoing(mo);

			String m = "Stock Added successfully";
			HttpSession session = request.getSession();
			session.setAttribute("empadd", m);
			response.sendRedirect("StockOutgoingManagment.jsp");

		} else if (flag.equals("View Outcome")) {
			response.sendRedirect("ViewOutcome.jsp");
		}
	}

}
