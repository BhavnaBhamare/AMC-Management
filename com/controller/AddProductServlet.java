package com.controller;

import java.io.FilePermission;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.model.BLManager;
import com.pojo.Manageproduct;
import com.pojo.Managesupplier;
import com.pojo.Productgroup;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 70, maxRequestSize = 1024 * 1024 * 100)
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String SAV_DIR = "D://NewProject/MehataProject/WebContent/mehtaimages";
	FilePermission permission = new FilePermission(SAV_DIR, "write");

	BLManager bl = new BLManager();
	Managesupplier ms = new Managesupplier();
	Manageproduct mp = new Manageproduct();
	Productgroup pg = new Productgroup();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		String flag = request.getParameter("flag");

		if (flag.equals("Add Product ")) {
			String productName = request.getParameter("productName");
			String productGroupName = request.getParameter("productGroupName");
			System.out.println(productGroupName);
			pg = bl.searchbyproductGroupName(productGroupName);
			String suplierName = request.getParameter("suplierName");

			ms = bl.searchbysuplierName(suplierName);
			int productCode = Integer.parseInt(request.getParameter("productCode"));
			Part productImage = request.getPart("productImage");
			int productStock = Integer.parseInt(request.getParameter("productStock"));
			double productPrice = Double.parseDouble(request.getParameter("productPrice"));
			String productWarranty = request.getParameter("productWarranty");
			String productDescription = request.getParameter("productDescription");

			mp.setProductName(productName);
			mp.setProductgroup(pg);
			mp.setManagesupplier(ms);
			mp.setProductCode(productCode);
			mp.setQuantity(productStock);
			mp.setProductPrice(productPrice);
			mp.setProductWarranty(productWarranty);
			mp.setProductDescription(productDescription);

			try {
				String img = extractFileName(productImage);

				mp.setProductImage(img);

			} catch (Exception e) {
				e.printStackTrace();
			}
			bl.saveManageProduct(mp);

			String m = "Product Added successfully";
			HttpSession session = request.getSession();
			session.setAttribute("empadd", m);
			response.sendRedirect("ManagerProduct.jsp");
		} else if (flag.equals("View Product ")) 
		{
			response.sendRedirect("ViewManageProduct.jsp");
		}

	}

	private String extractFileName(Part productImage) {
		String contentDisp = productImage.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
