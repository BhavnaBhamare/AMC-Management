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
import com.pojo.Register;
import com.pojo.Role;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BLManager bl=new BLManager();
	Role role=new Role();
	Register r=new Register();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		boolean val = bl.validemailpass(email,pass);
		
		System.out.println("----------"+val);
		
		if (val == true) 
		{
			
			r=bl.serachbyemail(email);
			
			if(r.getRole().getRolename().equals("Admin"))
			{
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Admin Management');");
				out.println("location='AdminHeader.jsp';");
				out.println("</script>");
				
			}else if(r.getRole().getRolename().equals("Stock Management"))
			{
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Stock Management');");
				out.println("location='StockHeader.jsp';");
				out.println("</script>");
				
			}else if(r.getRole().getRolename().equals("Billing"))
			{
				
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Billing Management');");
				out.println("location='BillingHeader.jsp';");
				out.println("</script>");
				
			}else if(r.getRole().getRolename().equals("Quatation"))
			{
				
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Quatation Management');");
				out.println("location='QuatationHeader.jsp';");
				out.println("</script>");
				
			}else if(r.getRole().getRolename().equals("Call Management"))
			{
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Call Management');");
				out.println("location='CallHeader.jsp';");
				out.println("</script>");
				
			}else if(r.getRole().getRolename().equals("AMC"))
			{
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome AMC Management');");
				out.println("location='AMCHeader.jsp';");
				out.println("</script>");
				
			}else if(r.getRole().getRolename().equals("Payroll"))
			{
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Payroll Management');");
				out.println("location='PayRollHeader.jsp';");
				out.println("</script>");
			}else if(r.getRole().getRolename().equals("Customer"))
			{
				String name=r.getName();
				String email1=r.getEmail();
				session.setAttribute("name",name);
				session.setAttribute("email",email1);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome Customer Management');");
				out.println("location='CustomerHeader.jsp';");
				out.println("</script>");
			}
			
		}else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('sorry user name password is incorrect');");
			out.println("location='loginadmin.jsp';");
			out.println("</script>");
		}

	}

}
