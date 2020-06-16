<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.MemberDao"%>
<%@page import="kr.or.kpc.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Script Element</title>
</head>
<body>
	<%!
		private String name;
		public int plus(int a, int b){
			return a+b;
		}
	%>
	<%
		int result = plus(10,20);	
		out.println(result);
	%>
	
	<%= result %>
	<%
		MemberDto dto = new MemberDto(1,"유아영","서울");
	%>
	<%=dto.getName() %>,<%=dto.getNum() %>, <%=dto.getAddr() %>
	
	<%
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto>list = dao.select();
	%>
	
	<table>
		<tr> 
			<th>번호</th><th>이름</th><th>주소</th>
		</tr>
		<%for(MemberDto memberDto : list){ %>
		<tr> 
			<td><%=memberDto.getNum() %></td>
			<td><%=memberDto.getName() %></td>
			<td><%=memberDto.getAddr() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>