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
import com.pojo.Managesupplier;
import com.pojo.Productgroup;
@WebServlet("/UpdateSupplier")
public class UpdateSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Managesupplier ms=new Managesupplier();
	Productgroup pg=new Productgroup();
	BLManager bl=new BLManager();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String suplierId = request.getParameter("suplierId");
		int suplierId1 = Integer.parseInt(suplierId);

		ms = bl.ProductSearchBypId(suplierId1);

		HttpSession ss = request.getSession();
		ss.setAttribute("list", ms);

		response.sendRedirect("UpdateSupplier.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		PrintWriter out = response.getWriter();

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

		
		bl.updateSuplier(ms);
		response.sendRedirect("ViewSupplier.jsp");
		
	
	}

}
