<%@ page import="bean.ProductDTO" %>
<%@ page import="bean.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: kyeongseo
  Date: 2022/11/18
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        <% if (session.getAttribute("id") != null) { %>
        <%= session.getAttribute("id")%>님 환영합니다.
        <a href="logout.jsp">
            <button>로그아웃</button>
        </a>
        <%}%>
        <hr color="blue">
        <jsp:useBean id="dto" class="bean.ProductDTO"></jsp:useBean>
        <jsp:setProperty name="dto" property="id"/>
        <%
            // 전달된 id를 받아서 dto를 만들어서 넣기!!
            ProductDAO dao = new ProductDAO();
            ProductDTO dto2 = dao.one(dto);
        %>
        <script type="text/javascript">
            $(function () {
                $('#basket').click(function () {
                    $.ajax({
                        url: "basket.jsp",
                        data : {
                            id: ' <%=dto2.getId()%>',
                            price: '<%=dto2.getPrice()%> ',
                            title: '<%=dto2.getTitle()%> '
                        },
                        success: function () {
                            alert(<%=dto2.getId()%> + "번 제품이 장바구니에 추가됨");
                            choice = confirm('장바구니 페이지로 이동하시겠습니까');
                            if(choice) {
                                location.href = 'basket.jsp';
                            }
                        }
                    })
                })
            })

        </script>
        <span>상품 상세정보</span>
        <hr>
        <table>
            <tr>
                <td>
                    <img alt="상품이미지" src="img/<%= dto2.getImg()%>" height="400" width="500">
                </td>
                <td>
                    <span>상품아이디: <%= dto2.getId()%></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>상품 제목: <%=dto2.getTitle()%></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>상품 설명: <%=dto2.getContent()%></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>상품 가격: <%=dto2.getPrice()%> 원</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>상품회사: <%=dto2.getCompany()%></span>
                </td>
            </tr>
            <%--            dto2의 내용을 테이블 모양으로 보여주기--%>
            <tr>
                <td colspan="2">
                    <button id="basket">장바구니</button>
                    <button>주문하기</button>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
