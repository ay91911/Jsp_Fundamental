<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num=Integer.parseInt(request.getParameter("num"));
	int cPage=Integer.parseInt(request.getParameter("page"));
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = new NoticeDto(num, writer, title, content,null/*now()가 알아서 값을 집어넣기 때문에 null로*/);

	int resultCount = dao.update(dto);
	if(resultCount ==1){
		%>
		<script>
			alert('글이 수정되었습니다.');
			location.href="view.jsp?num=<%=num%>&page=<%=cPage%>";
		</script>
		
		<%
	}else{
		%>
		<script>
			alert('에러..');
			history.back(-1);
		</script>
		<%
	}
%>
