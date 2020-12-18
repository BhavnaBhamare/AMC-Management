package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BLManager;
import com.pojo.Managesupplier;
import com.pojo.Productgroup;
@WebServlet("/AddSupplierServlet")
public class AddSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BLManager bl=new BLManager();
	Productgroup pg=new Productgroup();
	Managesupplier ms=new Managesupplier();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
String flag=request.getParameter("flag");
		
		if(flag.equals("Add Suplier"))
		{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String n=request.getParameter("supplierName");
		String a=request.getParameter("supplierAddress");
		String c=request.getParameter("supplierContact");
		String e=request.getParameter("supplierEmail");
		String pname=request.getParameter("productGroupName");
		pg=bl.searchByProdGrpName(pname);
		String ta=request.getParameter("totalAmount");
		Double ta1=Double.parseDouble(ta);
		String pa=request.getParameter("paidAmount");
		Double pa1=Double.parseDouble(pa);
		String pd=request.getParameter("purchaseDate");
		Date pd1=Date.valueOf(pd);
		ms.setSuplierName(n);
		ms.setSuplierAddress(a);
		ms.setSupplierContact(c);
		ms.setSupplierEmail(e);
		ms.setProductgroup(pg);
		ms.setTotalAmount(ta1);
		ms.setPaidAmount(pa1);
		ms.setPurchaseDate(pd1);
		
		bl.saveSupplierDetails(ms);
		
		response.sendRedirect("ManageSuplier.jsp");
		
		}else if(flag.equals("View Suplier"))
		{
			response.sendRedirect("ViewSupplier.jsp");
		}
		
		
		
		
		
		
	}

}
