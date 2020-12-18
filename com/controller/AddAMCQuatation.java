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
import com.pojo.Customer;
import com.pojo.Manageproduct;
import com.pojo.Quatation;

@WebServlet("/AddAMCQuatation")
public class AddAMCQuatation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BLManager bl = new BLManager();
	Customer c = new Customer();
	Manageproduct m = new Manageproduct();

	Quatation q = new Quatation();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		String flag = request.getParameter("flag");

		if (flag.equals("Add Quatation")) 
		{

			String pname = request.getParameter("pname");
			String cname = request.getParameter("cname");
			String taxtype = request.getParameter("taxtype");

			String qdate1 = request.getParameter("qdate");
			String validdate = request.getParameter("validdate");
			String taxpec = request.getParameter("taxpec");
			double taxpec1=Double.parseDouble(taxpec);
			
			String price1 = request.getParameter("price");
			double price=Double.parseDouble(price1);
			
			Date qdate=Date.valueOf(qdate1);
			Date vdate=Date.valueOf(validdate);
			
			c=bl.serachbycname(cname);
			m=bl.searchbypdoctname(pname);
			
			
			
			double pec=(taxpec1/100)*price;
			
			int quatationNo=(int)(Math.random()*9000)+1000;
			
			double netamt=price+pec;
			
			q.setQuatationNo(quatationNo);
			q.setTaxtype(taxtype);
			q.setTaxvalue(taxpec1);
			q.setQdate(qdate);
			q.setValidTo(vdate);
			q.setUnitprice(price);
			q.setCustomer(c);
			q.setManageproduct(m);
			q.setTotaltax(pec);
			q.setNetamount(netamt);
			
			bl.savequatation(q);
			
			String m = "Quatation Added successfully";
			HttpSession session = request.getSession();
			session.setAttribute("empadd", m);

			response.sendRedirect("addamcquatation.jsp");
			
			

		} else if (flag.equals("View Quatation")) 
		{
			
			HttpSession session=request.getSession();
			
			List<Quatation> qa=bl.serachquatationlist();
			session.setAttribute("que",qa);
			
			response.sendRedirect("viewQuestation.jsp");

			
		}

	}

}
