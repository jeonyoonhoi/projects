<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, model.TextVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>네이버웹툰 목록</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
    font-size: 12px;
}

tr:nth-child(even) {
    background-color: #fffae6;
}

th {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ffcc00;
    background-color: #ffffff;
    color: #4d3d00;
}

td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ffcc00;
    color: #4d3d00;
}

tr:hover{
	background-color:#ffe680;
}

/* unvisited, selected, visited link */
a:link, a:active, a:visited {
    color: #b38f00;
}

/* mouse over link */
a:hover {
    color: #1a1400;
}
</style>
</head>

<body>
	<!-- <h2 align="center">네이버 웹툰</h2><br> -->

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
				<th width=40px>id</th>
				<th width=200px>제 목</th>
				<th width=150px>요일</th>
				<th width=100px>작가</th>
				<th width=60px>최신화</th>
				<th width=100px>썸네일</th>
				<th width=200px>설명</th>
				
			</tr>

			<%
				for (TextVO vo : list) {
			%>
			<tr>
				<td><%=vo.getId()%></td>

				<td><a 
					href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>&weekday=<%=vo.getDay()%>'
					style='text-decoration: none' target="_blank"><%=vo.getTitle()%></a></td>
				<td><%=vo.getDay()%></td>
				<td><%=vo.getAuthor()%></td>

				<td><a
					href='http://comic.naver.com/webtoon/detail.nhn?titleId=<%=vo.getId()%>&no=<%=vo.getCount()%>&weekday=<%=vo.getDay()%>'
					style='text-decoration: none' target="_blank"><%=vo.getCount()%></a></td>
				<td><img src = '<%=vo.getImg_url()%>'></img></td>
				<td><%=vo.getText()%></td>
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