package bean;

import java.sql.*;
import java.util.ArrayList;

public class ProductDAO {
    //물건 리스트 전체 보기
    public ArrayList<ProductDTO> list() throws Exception {
       Class.forName("com.mysql.cj.jdbc.Driver");

       String url = "jdbc:mysql://localhost:3306/school?useUnicode=true&serverTimezone=Asia/Seoul";
       String user = "root";
       String password = "1234";

       Connection con = DriverManager.getConnection(url, user, password);

       String sql = "select * from PRODUCT";
       PreparedStatement ps = con.prepareStatement(sql);

       ArrayList<ProductDTO> list = new ArrayList<>();
       ResultSet rs = ps.executeQuery();
       while (rs.next()) {
           ProductDTO dto = new ProductDTO();

           dto.setId(rs.getString(1));
           dto.setTitle(rs.getString(2));
           dto.setContent(rs.getString(3));
           dto.setPrice(rs.getString(4));
           dto.setImg(rs.getString(6));

           list.add(dto);
       }
       return list;
    }

    // 리스트 중에서 선택한 물건 하나 보기
    public ProductDTO one(ProductDTO dto) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/school?useUnicode=true&serverTimezone=Asia/Seoul";
        String user = "root";
        String password = "1234";

        Connection con = DriverManager.getConnection(url, user, password);

        String sql = "select * from PRODUCT where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, dto.getId());

        ResultSet rs = ps.executeQuery();
        ProductDTO dto2 = new ProductDTO();

        if(rs.next()){
            // rs내의 한 행씩 아래로 내려가면서 그 행에 결과가 들어있는지 체크
            // 내부적으로 한 행씩 가르키게 됨: 커서 역할!
            // 가방을 하나 만들어서
            // 각 컬럼의 인덱스를 가지고 꺼내와서 가방에 넣는다.
            dto2.setId(rs.getString(1));
            dto2.setTitle(rs.getString(2));
            dto2.setContent(rs.getString(3));
            dto2.setPrice(rs.getString(4));
            dto2.setCompany(rs.getString(5));
            dto2.setImg(rs.getString(6));
        }
        return dto2;
    }
}
