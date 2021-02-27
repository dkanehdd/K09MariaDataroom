package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;
public class MEditCtrl extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("user_id");
		String pw = req.getParameter("pw1");
		String email = req.getParameter("email1")
				+"@"+req.getParameter("email2");
		String phone = req.getParameter("tel")+"-"
				+req.getParameter("tel1")+"-"
				+req.getParameter("tel2");
		String address = req.getParameter("zipcode")+req.getParameter("address1")+ req.getParameter("address2");
		
//		System.out.println(email + phone + address);
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPass(pw);
		dto.setAddress(address);
		dto.setEmail(email);
		dto.setPhone(phone);
		MemberDAO dao = new MemberDAO(); 
		
		int affected = dao.updateMember(dto);
		boolean sucOrFail = true;
		System.out.println(affected);
		if(affected==1) {
			sucOrFail = true;
		}
		else {
			sucOrFail = false;
		}
		
		req.setAttribute("SUC", sucOrFail);
		req.getRequestDispatcher("../08Board1/MEditMessage.jsp").forward(req, resp);
		
	}
}
