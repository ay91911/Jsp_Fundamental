<%
	NoticeDao dao = NoticeDao.getInstance();
	String json = dao.selectJson(0,20);
	out.print(json);
%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"%>

 

