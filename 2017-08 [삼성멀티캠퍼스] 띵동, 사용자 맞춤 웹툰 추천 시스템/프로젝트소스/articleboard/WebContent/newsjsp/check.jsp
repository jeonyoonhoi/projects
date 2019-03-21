<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, model.TextVO"%>
<!DOCTYPE html>
<html>


<body>
	<h1 align="center">네이버 웹툰</h1>
	<hr>
	<br>

	<!-- 게시판에 글이 없을 때  -->
	<%
		ArrayList<TextVO> list = (ArrayList<TextVO>) request.getAttribute("webtoon_list");
		if (list == null) {
	%>
	<h3 align="center">"아무것도 없당ㅇㅇㅇㅇ"</h3>
	<%
		} else {
	%>
	<div id='main_table' style="display: block">
		<table align='center' style="text-align: center">
			<tr id="headline">
				<th width=100px>썸네일</th>
				<th width=200px>제 목</th>
				<th width=100px>작가</th>
				<th width=200px>설명</th>
				<th width=50px>좋아요</th>				
			</tr>

			<%
				for (TextVO vo : list) {
			%>
			<tr>
				<td><img src = '<%=vo.getImg_url()%>'></img></td>
				<td><a 
					href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>&weekday=<%=vo.getDay()%>'
					style='text-decoration: none'><%=vo.getTitle()%></a></td>
				<td><%=vo.getAuthor()%></td>
				<td><%=vo.getText()%></td>
				<td><form>
				<input type="checkbox" name="like" value="<%=vo.getId()%>">

				</form></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		</div>
		<%
			}
		%>
	
</body>
</html>