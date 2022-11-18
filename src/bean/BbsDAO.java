package bean;

import java.sql.*;
import java.util.ArrayList;

public class BbsDAO {
    Connection con;

    public BbsDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/school?useUnicode=true&serverTimezone=Asia/Seoul";
            String user = "root";
            String password = "1234";
            con = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            System.out.println("Occur Error");

        }
    }

    public int insert(BbsDTO dto) {
        int result = 0;
        try {
            String sql = "insert into bbs values (null, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dto.getTitle());
            ps.setString(2, dto.getContent());
            ps.setString(3, dto.getWriter());

            result = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Occur Error");
        }
        return result;
    }

    public int update(BbsDTO dto) {
        int result = 0;
        try {
            String sql = "update bbs set title = ?, content = ? where no = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dto.getTitle());
            ps.setString(2, dto.getContent());
            ps.setString(3, dto.getId());

            result = ps.executeUpdate();

        } catch (Exception e){
            System.out.println("Occur Error");
        }
        return result;
    }

    public int delete(BbsDTO dto) {
       int result = 0;
       try {
           String sql = "delete from bbs where no = ?";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, dto.getId());

           result = ps.executeUpdate();

       } catch (Exception e){
           System.out.println("Occur Error");
       }
       return result;
    }

    public ArrayList<BbsDTO> list() throws Exception {
        String sql = "select * from bbs order by no desc";
        PreparedStatement ps = con.prepareStatement(sql);

        ArrayList<BbsDTO> list = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            BbsDTO dto = new BbsDTO();

            dto.setId(rs.getString(1));
            dto.setTitle(rs.getString(2));
            dto.setContent(rs.getString(3));
            dto.setWriter(rs.getString(4));

            list.add(dto);
        }
        return list;
    }

    public BbsDTO one(BbsDTO dto) throws Exception {
        String sql = "select * from bbs where no = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, dto.getId());

        ResultSet rs = ps.executeQuery();
        BbsDTO dto2 = new BbsDTO();
        if(rs.next()){
            dto2.setId(rs.getString(1));
            dto2.setTitle(rs.getString(2));
            dto2.setContent(rs.getString(3));
            dto2.setWriter(rs.getString(4));
        }
        return dto2;
    }
}
