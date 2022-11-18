<%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/18
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <% if(session.getAttribute("id") != null) { %>
        <%= session.getAttribute("id")%>님 장바구니 정보입니다.
        <a href="logout.jsp">
            <button>로그아웃</button>
        </a>
            <%}%>
    </div>
</div>

</body>
</html>
