<%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/19
  Time: 1:37
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
        게시판 글쓰기 화면
        <hr color="red">
        <%
            if (session.getAttribute("id") != null) {
        %>
        <span>
      <%=session.getAttribute("id")%>님 환영합니다.
    </span>
        <%
            }
        %>
        <hr color="blue">
        <form action="insert2.jsp">
            <table>
                <tr>
                    <td width="200">제목</td>
                    <td width="300"><input name="title"></td>
                </tr>
                <tr>
                    <td width="200">내용</td>
                    <td width="300"><input name="content"></td>
                </tr>
                <tr>
                    <td width="200">작성자</td>
                    <td width="300">
                        <input name="writer" value="<%=session.getAttribute("id")%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">글쓰기 완료</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
