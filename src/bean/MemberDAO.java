package bean;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.Dictionary;

public class MemberDAO {

    // 각각의 처리를 메서드(함수)로 만들기
    // 가입처리
    public int insert(MemberDTO dto) {
        int result = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/school?useUnicode=true&serverTimezone=Asia/Seoul";
            String user = "root";
            String password = "1234";

            Connection con = DriverManager.getConnection(url, user, password);

            String sql = "insert into member values (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, dto.getId());
            ps.setString(2, dto.getPw());
            ps.setString(3, dto.getName());
            ps.setString(4, dto.getTel());

            result = ps.executeUpdate(); //result 반환값 1

        } catch(Exception e){
            System.out.println("Occur Error");
        }
        return result;
    }

    //로그인 처리
    public boolean login(MemberDTO dto) throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/school?useUnicode=true&serverTimezone=Asia/Seoul";
        String user = "root";
        String password = "1234";

        Connection con = DriverManager.getConnection(url, user,password);

        String sql = "select * from member where id = ? and pw = ?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, dto.getId());
        ps.setString(2, dto.getPw());

        ResultSet rs = ps.executeQuery();
        boolean result = false;
        if(rs.next()) {
            result = true;
        }
        return result;
    }

}
