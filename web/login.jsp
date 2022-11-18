<%@ page import="bean.MemberDTO" %>
<%@ page import="bean.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/18
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="id" />
<jsp:setProperty name="dto" property="pw"/>
<%--   변수지정(*, 모든 파라메터)    가방의 이름(빈, 객체 이름)--%>
<%
    // DB 처리(DAO, DTO)
    MemberDAO dao = new MemberDAO();
    boolean result = dao.login(dto);

    //로그인 성공시 반드시 해주어야 하는 세션 처리!!
    String result2 = "로그인 실패";
    if(result) {
        session.setAttribute("id", dto.getId());
        result2 = "로그인 성공";
    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/project.css">
</head>
<body>
<div id="total">
   <div id="top">
       <jsp:include page="top.jsp"></jsp:include>
   </div>
    <div id="top2">
        <jsp:include page="top2.jsp"></jsp:include>
    </div>
    <div id="center">
        <span>로그인 결과 <%= result2 %></span>
        <a href="logout.jsp">
            <button>로그아웃</button>
        </a>
    </div>

</div>

</body>
</html>
