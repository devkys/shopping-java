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
        <%
            if(session.getAttribute("id") == null) {
        %>
        <form action="login.jsp">
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>패스워드</td>
                    <td><input type="password" name="pw"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" style="width: 250px;">로그인 처리</button>
                    </td>
                </tr>
            </table>
        </form>
        <hr color="blue">
        <%
            } else {
        %>
        <a href="logout.jsp">
            <button>로그아웃</button>
        </a>
        <%
            }
        %>
        <span>중요!!!</span>
        <span>회원 가입 정보 입력</span>



    </div>
</div>

</body>
</html>
