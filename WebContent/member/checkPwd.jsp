<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%

	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	CustomerDao dao= CustomerDao.getInstance();
	CustomerDto dto = dao.getLogin(email, pwd);
	
	if(dto!=null){
		response.sendRedirect("/member/mypage.jsp");
	}else{
		//email, pwd가 일치하지 않는 경우
		%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.back(-1);
		</script>
		<%		
	}
%>