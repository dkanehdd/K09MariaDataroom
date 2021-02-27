package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class MemberEdit extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("user_id");
		MemberDAO dao = new MemberDAO();
		Map<String, String> map = dao.getMember(id);
		
		try {
			String phone = map.get("phone");
			String[] tel = phone.split("-");
			map.put("tel1", tel[1]);
			map.put("tel2", tel[2]);
			
			String[] email = map.get("email").split("@");
			map.put("email1", email[0]);
			map.put("email2", email[1]);
		}
		catch (NullPointerException e) {
		}
		req.setAttribute("maps", map);
		req.getRequestDispatcher("../common/MemberEdit.jsp").forward(req, resp);
	}
}
