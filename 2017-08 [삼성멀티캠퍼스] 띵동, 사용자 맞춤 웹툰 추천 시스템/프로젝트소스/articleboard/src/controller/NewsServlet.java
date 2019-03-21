
package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NewsDAO;
import model.NewsVO;

@WebServlet("/news.do")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NewsDAO dao = new NewsDAO();
		NewsVO vo = null;
		ArrayList<NewsVO> list = dao.listAll();

		/* 전체 리스트 보여주기 */		
		if (list != null && list.size() > 0)
			request.setAttribute("article_list", list);
		else
			request.setAttribute("msg", "저장된 게시물이 없습니다1.");

		/* 클릭한 게시물 보여주기 */
		String action = request.getParameter("action");

		try {
			if (action.equals("read")) {
				int id = Integer.parseInt(request.getParameter("id"));
				vo = dao.listOne(id);
				request.setAttribute("clicked_article", vo);
			} else {
				System.out.println("게시글 없음");
			}
		} catch (NullPointerException e) {
			System.out.println(e.getMessage());
		}

		request.getRequestDispatcher("/newsjsp/news.jsp").forward(request, response);
	
		NewsDAO dao2 = new NewsDAO();
		NewsVO vo2 = null;
		ArrayList<NewsVO> myList = dao2.listAll();
	
	
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		NewsVO vo = null;
		NewsDAO dao = null;
		ArrayList<NewsVO> list = null;
		boolean result = true;

		String action = request.getParameter("action");

		try {
			System.out.println(action);

			/* 새 글 작성 */
			if (action.equals("save")) {
				vo = new NewsVO();
				dao = new NewsDAO();

				vo.setAuthor(request.getParameter("writer"));
				vo.setTitle(request.getParameter("title"));

				result = dao.insert(vo);

				if (result)
					System.out.println("글쓰기 완료");
				else
					System.out.println("글쓰기 실패");
			}
			/* 업데이트 */
			else if (action.equals("update")) {
				vo = new NewsVO();
				dao = new NewsDAO();

				vo.setTitle(request.getParameter("clicked_title"));
				vo.setAuthor(request.getParameter("clicked_writer"));
				vo.setId(Integer.parseInt(request.getParameter("id")));

				result = dao.update(vo);

				if (result)
					System.out.println("업데이트 완료");
				else
					System.out.println("업데이트 실패");
			}
			/* 삭제 */
			else if (action.equals("delete")) {
				dao = new NewsDAO();
				int id = Integer.parseInt(request.getParameter("id"));
				result = dao.delete(id);
			}
		} catch (NullPointerException e) {
			System.out.println(e.getMessage());
			result = false;
		}

		// 게시판 리스트 다시 띄우기
		list = dao.listAll();
		if (list != null && list.size() > 0)
			request.setAttribute("article_list", list);
		/*jsp에서 받아온다*/
		
	
		else
			request.setAttribute("msg", "저장된 게시물이 없습니다2.");

		request.getRequestDispatcher("/newsjsp/news.jsp").forward(request, response);
	}
}
