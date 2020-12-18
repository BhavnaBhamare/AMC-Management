package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Productgroup;

/**
 * Servlet implementation class UpdateProductGroup
 */
@WebServlet("/UpdateProductGroup")
public class UpdateProductGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   BLManager bl=new BLManager();
   Productgroup pg=new Productgroup();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productGroupId=Integer.parseInt(request.getParameter("productGroupId"));
		pg=bl.searchbyProductGroupId(productGroupId);
		HttpSession session=request.getSession();
		session.setAttribute("pgid", pg);
		response.sendRedirect("UpdtateProductGroup.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int productGroupId=Integer.parseInt(request.getParameter("productGroupId"));
		String productGroupName = request.getParameter("productGroupName");
		pg.setProductGroupId(productGroupId);
		pg.setProductGroupName(productGroupName);
		
		bl.updateProductGroup(pg);
		

		

	//	bl.updatePoduct(pg);
		
	out.print("<script type=\"text/javascript\">");
		out.print("alert('Record Updated');");
		out.print("location='ViewProductGroup.jsp';");
		out.print("</script>");
	}

}
