<%@ page import="bean.BbsDAO" %>
<%@ page import="bean.BbsDTO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/19
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BbsDAO dao = new BbsDAO();
    BbsDTO dto = new BbsDTO();

    dto.setId(request.getParameter("id"));

    BbsDTO bag = dao.one(dto);
%>

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
        <table>
            <thead>
            <tr>
                <th colspan="2"><%= bag.getWriter()%>님이 작성함</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>제목</td>
                <td><%= bag.getTitle()%></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><%= bag.getContent()%></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%= bag.getWriter()%></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="bbs.jsp">
                        <button>리스트로</button>
                    </a>
                    <%
                        if(session.getAttribute("id") != null) {
                            if(session.getAttribute("id").equals(bag.getWriter())) {
                    %>
                    <a href="update.jsp?id=<%= bag.getId() %>">
                        <button>수정</button>
                    </a>
                    <a href="delete.jsp?id=<%= bag.getId()%>">
                        <button>삭제</button>
                    </a>
                    <%}}%>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
