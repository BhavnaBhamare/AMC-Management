package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BLManager;
import com.pojo.Productgroup;

/**
 * Servlet implementation class AddProductGroupServlet
 */
@WebServlet("/AddProductGroupServlet")
public class AddProductGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  BLManager bl=new BLManager();
  Productgroup pg=new Productgroup();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String flag=request.getParameter("flag");
		
		if(flag.equals("Add Product Group"))
		{
		String productGroupName=request.getParameter("productGroupName");
		pg.setProductGroupName(productGroupName);
		bl.saveproductGroupName(pg);
		response.sendRedirect("ProductGroup.jsp");
		
		}else if(flag.equals("View Product Group"))
		{
			response.sendRedirect("ViewProductGroup.jsp");
		}
			
	}

}
