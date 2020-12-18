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
import com.pojo.Billing;
import com.pojo.Customer;
import com.pojo.Manageproduct;
import com.pojo.Quatation;

/**
 * Servlet implementation class GenerateInvoice
 */
@WebServlet("/GenerateInvoice")
public class GenerateInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BLManager bl = new BLManager();
	Customer c = new Customer();
	Manageproduct m = new Manageproduct();

	Billing bill = new Billing();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String flag = request.getParameter("flag");

		if (flag.equals("Add Invoice")) 
		{

			String pname = request.getParameter("pname");
			String cname = request.getParameter("cname");
			
			String taxtype = request.getParameter("taxtype");
			String idate1 = request.getParameter("idate");
			String warranty = request.getParameter("warranty");
			
			
			String price1 = request.getParameter("price");
			double price=Double.parseDouble(price1);
			
			String taxpec = request.getParameter("taxpec");
			int taxpec1=Integer.parseInt(taxpec);
			
			String quantity1 = request.getParameter("quantity");
			int quantity=Integer.parseInt(quantity1);
			
			String discount1 = request.getParameter("discount");
			int discount=Integer.parseInt(discount1);
			
			Date idate=Date.valueOf(idate1);
			
			c=bl.serachbycname(cname);
			m=bl.searchbypdoctname(pname);
			
			double tamt=price*quantity;
	
        	double pec=(taxpec1/100)*tamt;
			
			int invoiceNo=(int)(Math.random()*9000)+1000;
			
			double netamt=tamt+pec;
			
			bill.setCustomer(c);
			bill.setManageproduct(m);
			bill.setInvoiceno(invoiceNo);
			bill.setInvoicedate(idate);
			bill.setTaxtype(taxtype);
			bill.setTaxvalue(taxpec1);
			bill.setQuantity(quantity);
			bill.setTotalamount(tamt);
			bill.setUnitprice(price);
			bill.setWarranty(warranty);
			bill.setTotaltax(pec);
			bill.setNetamount(netamt);
			bill.setDiscount(discount);
			
			bl.savebillingnow(bill);
			
			String m = "Invoice Added successfully";
			HttpSession session = request.getSession();
			session.setAttribute("empadd", m);

			response.sendRedirect("viewInvoice.jsp");
			
			

		} else if (flag.equals("View Invoice")) 
		{
			
			HttpSession session=request.getSession();
			
			List<Quatation> qa=bl.serachquatationlist();
			session.setAttribute("que",qa);
			
			response.sendRedirect("viewInvoice1.jsp");

			
		}
		
	}

}
