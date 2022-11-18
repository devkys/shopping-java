<%@ page import="bean.BbsDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.BbsDTO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/18
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BbsDAO dao = new BbsDAO();
    ArrayList<BbsDTO> bag = dao.list();
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
        <br>
        <%
            if (session.getAttribute("id") != null) {
        %>
        <span> <%=session.getAttribute("id")%>님 환영합니다.</span>
        <a href="insert.jsp">
            <button>글쓰기</button>
        </a>
        <a href="logout.jsp">
            <button>로그아웃</button>
        </a>
        <%
            }
        %>
        <br><br>
        <table>
            <thead>
            <tr>
                <td>게시글</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            </thead>
            <tbody>
            <%
                for (BbsDTO dto : bag){
            %>
            <tr>
                <td><%=dto.getTitle()%></td>
                <td> <a href="bbs2.jsp?id=<%=dto.getId()%>"> <%=dto.getContent()%></a></td>
                <td><%=dto.getWriter()%></td>
            </tr>
            <%
                }
            %>

            </tbody>
        </table>
    </div>
</div>


</body>
</html>
