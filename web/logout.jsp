<%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/18
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("member.jsp");
%>