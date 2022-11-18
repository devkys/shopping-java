<%@ page import="bean.BbsDAO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/19
  Time: 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dto" class="bean.BbsDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>

<%
  BbsDAO dao = new BbsDAO();
  int result = dao.insert(dto);
  if (result == 1) {
%>
<script type="text/javascript">
  alert("게시물 작성이 완료되었습니다.")
  location.href="bbs.jsp";
</script>
<%
  }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
게시물 작성에 문제가 생겼습니다.
</body>
</html>
