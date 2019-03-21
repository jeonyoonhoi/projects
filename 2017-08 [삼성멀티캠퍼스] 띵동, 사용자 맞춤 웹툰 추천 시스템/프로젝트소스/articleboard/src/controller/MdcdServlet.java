package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MdcdDAO;
import model.TextVO;


@WebServlet("/mdcd")
public class MdcdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		MdcdDAO dao = new MdcdDAO();
		TextVO vo =null;
		ArrayList<TextVO> list = dao.listUp();
		
		/* 전체  리스트 보여주기 */
		if(list != null && list.size()>0)
			request.setAttribute("webtoon_list", list);	
			
		else
			request.setAttribute("msg","저장된 웹툰이 없음1");
		
		/* like  내 목록 보여주기 */
		String action = request.getParameter("name");
		
		try{
			if(action.equals("readLike")){
				int id = Integer.parseInt(request.getParameter("id"));
				String userId = request.getParameter("userId");
				request.getRequestDispatcher("/mdcd/check.jsp").forward(request, response);		
				
				
			}
		}catch(NullPointerException e){
			System.out.println(e.getMessage());
		}
	
		request.getRequestDispatcher("/mdcd/mdcd.jsp").forward(request, response);		
		
	
	}
	
	
	
	/* 목록 전체 보기 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MdcdDAO dao = new MdcdDAO();
		TextVO vo =null;
		ArrayList<TextVO> list = dao.listUp();
		
/*		String mCheck = "manager";
		String pCheck = "password"; 
		String manager = request.getParameter("manager");
		String password = request.getParameter("password");

		if(mCheck.equals(manager)&&pCheck.equals(password))
		{*/
	
			if(list != null && list.size()>0)
				request.setAttribute("webtoon_list", list);	
				
			else
				request.setAttribute("msg","저장된 웹툰이 없음1");
	
			request.getRequestDispatcher("/newsjsp/news.jsp").forward(request, response);		
		
		
		//	request.getRequestDispatcher("/mdcd/mdcd.jsp").forward(request, response);
		
	}
}


