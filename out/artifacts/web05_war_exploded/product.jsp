<%@ page import="bean.ProductDTO" %>
<%@ page import="bean.ProductDAO" %>
<%@ page import="java.util.ArrayList" %><%--
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
        <br>
        <%if (session.getAttribute("id") != null) { %>
        <span> <%=session.getAttribute("id")%>님 환영합니다.</span>
        <a href="logout.jsp">
            <button>로그아웃</button>
        </a>
        <%}%>
        <hr color="blue">
        <%--        1) dao 이용해서 상품 목록 다 가지고 오기.--%>
        <%
            ProductDAO dao = new ProductDAO();
            ArrayList<ProductDTO> list = dao.list();
        %>
        <table>
            <tr>
                <td>상품명</td>
                <td>상품각격</td>
                <td>상품이미지</td>
            </tr>
            <% for (ProductDTO dto : list) {%>
            <tr>
                <td>
                    <a href=product2.jsp?id=<%= dto.getId() %>><%= dto.getTitle()%>
                    </a>
                </td>
                <td><%= dto.getPrice()%>
                </td>
                <td>
                    <img src="img/<%= dto.getImg() %>" width="150" height="100">
                </td>
            </tr>
            <%}%>
        </table>
    </div>
</div>

</body>
</html>
