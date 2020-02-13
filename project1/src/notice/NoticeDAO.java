package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import semiProject.JdbcDAO;

//DAO Ŭ���� : ����Ÿ ����Ҹ� �̿��Ͽ� ����Ÿ ����,����,����,�˻� ����� �����ϴ� Ŭ����

public class NoticeDAO extends JdbcDAO {
    private static NoticeDAO _dao;

    private NoticeDAO() {
        // TODO Auto-generated constructor stub
    }

    public static NoticeDAO getDAO() {
        if (_dao == null) {
            _dao = new NoticeDAO();
        }
        return _dao;
    }

    // NOTICE ���̺� ����� ��ü �Խñ��� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
    public int getNoticeTotal(String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();

            if (keyword.equals("")) {// �˻� ��� �̻��
                String sql = "select count(*) from noticetable where title!='������'";
                pstmt = con.prepareStatement(sql);
            } else {// �˻� ��� ���
                // �÷����� ������ Java ������ InParameter�� ��� �Ұ���
                
                String sql="select count(*) from noticetable where "+search+" like '%'||?||'%' and title!='������'";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getNoticeTotal() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }

    // ����¡ ó��
    public List<NoticeDTO> getNoticeList(int startRow, int endRow, String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
        try {
            con = getConnection();

            if (keyword.equals("")) {
                String sql = "select * from (select rownum rn, temp.* from (select * from noticetable where title!='������' order by num desc) temp) where rn between ? and ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, endRow);
            } else {
                String sql = "select * from (select rownum rn, temp.* from (select * from noticetable where " + search
                        + " like '%'||?||'%' and title!='������'order by num desc) temp) where rn between ? and ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                NoticeDTO notice = new NoticeDTO();

                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setCount(rs.getInt("count"));
                notice.setId(rs.getString("id"));
                notice.setDateCreated(rs.getString("datecreated"));
                noticeList.add(notice);
            }
        } catch (SQLException e) {
            System.out.println("[����]getNoticeList() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return noticeList;
    }

    // �������� �ڵ� �������� �˻�
    public int getNoticeNum() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num = 0;
        try {
            con = getConnection();

            String sql = "select notice_seq.nextval from dual";
            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����]getNoticeNum() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return num;
    }

    // ����
    public int addNotice(NoticeDTO notice) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            /* String sql = "insert into noticetable values(?,?,?,0,?,sysdate)"; */
            String sql = "insert into noticetable values(?,?,?,0,'������',sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, notice.getNum());
            pstmt.setString(2, notice.getTitle());
            pstmt.setString(3, notice.getContent());
            /* pstmt.setString(4, notice.getId()); */

            rows = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("[����] addNotice() �޼ҵ��� SQL ����" + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    /*
     * // ���� public int modifyNotice(NoticeDTO notice) { Connection con=null;
     * PreparedStatement pstmt=null; int rows=0; try { con=getConnection();
     * 
     * String
     * query="update noticetable set title=?,content=?,count=?,id=?, dateCreated=sysdate where num=?"
     * ; pstmt=con.prepareStatement(query); //pstmt.setString(1, student.getName());
     * pstmt.setString(1, notice.getTitle()); pstmt.setString(2,
     * notice.getContent()); pstmt.setInt(3, notice.getCount()); pstmt.setString(4,
     * notice.getId()); pstmt.setInt(5, notice.getNum());
     * 
     * rows=pstmt.executeUpdate(); } catch (SQLException e) {
     * System.out.println("[����]updateStudent() �޼ҵ��� SQL ���� = "+e.getMessage()); }
     * finally { close(con, pstmt); } return rows; }
     */

    // ����� �Խñ��� �˻��Ͽ� ��ȯ
    public NoticeDTO getNotice(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        NoticeDTO notice = null;
        try {
            con = getConnection();

            String sql = "select * from noticetable where num=? and title!='������'";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                notice = new NoticeDTO();
                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setCount(rs.getInt("count"));
                notice.setId(rs.getString("id"));
                notice.setDateCreated(rs.getString("dateCreated"));
            }

        } catch (SQLException e) {
            System.out.println("[����]getNotice() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return notice;
    }

    // ����
    public int removeNotice(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            String sql = "update noticetable set title='������' where num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[����]removeNotice() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // ��ȸ���� 1 ����
    public int modifyReadCount(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            String sql = "update noticetable set count=count+1 where num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[����]modifyReadCount() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // ���� ���ȣ�� ���� ���ȣ�� ���޹޾� NOTICE ���̺� ����� �Խñ� ����� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
    // => ���̺� ����� �࿡ ���� ����¡ ó��
    public List<NoticeDTO> getNoticeList(int startRow, int endRow) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
        try {
            con = getConnection();

            // sql�� ����
            String sql = "select * from (select rownum rn, temp.* from (select * from noticetable where title!='������') where rn between ? and ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                NoticeDTO notice = new NoticeDTO();
                // student.setNo(rs.getInt("no"));
                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setCount(rs.getInt("count"));
                notice.setDateCreated(rs.getString("dateCreated"));
                noticeList.add(notice);
            }

        } catch (SQLException e) {
            System.out.println("[����]getNoticeList() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return noticeList;
    }

}
