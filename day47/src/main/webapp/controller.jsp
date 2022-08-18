<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="b1" class="vo.Bank1" />
<jsp:useBean id="b2" class="vo.Bank2" />
<jsp:useBean id="dao1" class="dao.Bank1DAO" />
<jsp:useBean id="dao2" class="dao.Bank2DAO" />
<%

String action=request.getParameter("action");
System.out.println("로그: "+action); 

	if(action.equals("transfer")){
		if(dao1.transfer(Integer.parseInt(request.getParameter("balance")))){
			out.print("<script>alert('성공!'); location='controller.jsp?action=main';</script>");
			
		}
		else{
			out.print("<script>alert('실패...'); location='controller.jsp?action=main';</script>");	
		}
	}
	
	else if(action.equals("main")){
	b1=dao1.selectOne(b1);
	b2=dao2.selectOne(b2);
	
	session.setAttribute("b1", b1);
	session.setAttribute("b2", b2);
	// v에서 EL식으로 출력하기위해, JSP scope 내장객체에 setAttribute() 수행함
	response.sendRedirect("NewFile.jsp");
	}
%>