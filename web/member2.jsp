<%@ page import="bean.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/19
  Time: 1:54
  To change this template us
%>e File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>
<%
  MemberDAO dao = new MemberDAO();
  int result = dao.insert(dto);
  if(result == 1 ) {
    %>
<script type="text/javascript">
  alert("회원가입 완료!");
  location.href="member.jsp";
</script>
<%
  }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
회원가입시 에러가 발생했습니다.
</body>
</html>
