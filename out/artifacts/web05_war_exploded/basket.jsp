<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ProductDTO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/18
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 가방을 만들어서, ajax(브라우저)로 넘어온 값 받아서 가방에 넣기--%>
<jsp:useBean id="dto" class="bean.ProductDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty>
<%-- 위는 jsp 액션 태그 임--%>
<%
    //기존의 장바구니 리스트가 있었는지 없었는지 체크해보기
    ArrayList<ProductDTO> list = null;
    // 기존의 장바구니 세션이 있었느냐 없었느냐
    // 처음이면 if문
    // 장바구니에 두번째 이후 삽입부터는 else문 실행
    if(session.getAttribute("basket") == null) {
        //장바구니에 넣은 적이 없다. (0개)
        list = new ArrayList<ProductDTO>();
    } else {
        // 장바구니에 넣은 적이 있다. (1개)
        // 들어가있는 것(Object)을 꺼낼때는 다시 원래의 것으로 바꾸어서 꺼내기
        // 다운 캐스팅
        list = (ArrayList<ProductDTO>) session.getAttribute("basket");
    }
    list.add(dto); // 0->1, 1->2, 2->3
    //setattribute는 어떤 것도 다 들어감. 즉, Object로 들어감.
    session.setAttribute("basket", list); // { dto }
    //session은 서버의 램에 저장해두는 방식
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
