<%@ page import="bean.BbsDAO" %>
<%@ page import="bean.BbsDTO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/19
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    BbsDAO dao = new BbsDAO();
    BbsDTO dto = new BbsDTO();

    dto.setId(request.getParameter("id"));

    BbsDTO bag = dao.one(dto);
%>
<body>
<div id="total">
    <div id="top">
        <jsp:include page="top.jsp"></jsp:include>
    </div>
    <div id="top2">
        <jsp:include page="top2.jsp"></jsp:include>
    </div>
    <div id="center">
        게시판 수정 화면
        <hr color="red">
        <%
            if (session.getAttribute("id") != null) {
        %>
        <span>
        <%=session.getAttribute("id")%>님 환영합니다.
      </span>
        <% } %>
        <hr color="blue">
        <form action="update2.jsp">
            <input type="hidden" name="id" value="<%= bag.getId() %>">
            <table>
                <tr>
                    <td width="200">제목</td>
                    <td width="300"><input name="title" value="<%= bag.getTitle() %>"></td>
                </tr>
                <tr>
                    <td width="200">내용</td>
                    <td width="300"><input name="content" value="<%= bag.getContent() %>"></td>
                </tr>
                <tr>
                    <td width="200">작성자</td>
                    <td width="300"><input name="writer" value="<%= session.getAttribute("id") %>"
                                           readonly="readonly" disabled="disabled"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">글수정 완료</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
