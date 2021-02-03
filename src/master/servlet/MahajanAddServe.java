package master.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.DAO.MahajanDAO;
import master.DTO.MahajanMainDTO;

/**
 * Servlet implementation class MahajanAddServe
 */
public class MahajanAddServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String mid=request.getParameter("mid");
		String mname=request.getParameter("mname");
		String total_bill=request.getParameter("total_bill");
		String total_pay=request.getParameter("total_pay");
		String total_due=request.getParameter("total_due");
		
		MahajanMainDTO mmdto=new MahajanMainDTO();
		mmdto.setMid(mid);
		mmdto.setMname(mname);
		mmdto.setTotal_bill(total_bill);
		mmdto.setTotal_pay(total_pay);
		mmdto.setTotal_due(total_due);
		
		MahajanDAO mmdao=new MahajanDAO();
		mmdao.InsertMahajanMain(mmdto);
		response.sendRedirect("WelcomeMahajan.jsp");
	}

}
