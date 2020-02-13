package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import semiProject.JdbcDAO;


public class QuestionDAO extends JdbcDAO {
	private static QuestionDAO _dao;

	public QuestionDAO() {
		// TODO Auto-generated constructor stub
	}

	public static QuestionDAO getDAO() {
		if (_dao == null) {
			_dao = new QuestionDAO();
		}
		return _dao;
	}

	// ����¡ó��
	public List<QuestionDTO> getpageList(int startRow, int endRow, String search, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QuestionDTO> questionList = new ArrayList<QuestionDTO>();
		try {
			con = getConnection();

			if (keyword.equals("")) {
				String sql = "select * from (select rownum rn, temp.* from (select * from questiontable order by num desc) temp) where rn between ? and ? and title!='������' order by num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql = "select * from (select rownum rn, temp.* from (select * from questiontable where " + search
						+ " like '%'||?||'%' order by num desc) temp) where rn between ? and ? and title!='������' order by num desc ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				QuestionDTO question = new QuestionDTO();
				question.setNum(rs.getInt("num"));
				question.setTitle(rs.getString("title"));
				question.setContent(rs.getString("content"));
				question.setId(rs.getString("id"));
				question.setDateCreated(rs.getString("DateCreated"));
				questionList.add(question);
			}
		} catch (SQLException e) {
			System.out.println("[����]getBoardList() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return questionList;
	}

	// ������ �ڵ� ������ �˻�?
	public int getBoardNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con = getConnection();

			String sql = "select questiontable_seq.nextval from dual";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]getBoardNum() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return num;
	}

	
//	// �Խñ� ��ȣ�� ���޹޾� BOARD ���̺��� ����� �Խñ��� ��ȸ���� 1 ���� �ǵ��� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
//	public int modifyReadCount(int num) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		int rows = 0;
//		try {
//			con = getConnection();
//
//			String sql = "update questiontable set readcount=readcount+1 where num=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, num);
//
//			rows = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("[����]modifyReadCount() �޼ҵ��� SQL ���� = " + e.getMessage());
//		} finally {
//			close(con, pstmt);
//		}
//		return rows;
//	}
//	

	// ���� �Է¹޾� ����
	public void insertQuestion(QuestionDTO question) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = getConnection();

			con.setAutoCommit(false);

			String query = "insert into questiontable values(?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, question.getNum());
			pstmt.setString(2, question.getTitle());
			pstmt.setString(3, question.getContent());
			pstmt.setString(4, question.getId());

			pstmt.executeUpdate();
			con.commit();

		} catch (SQLException e) {
			System.out.println("[����]qryInsert() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
	}

	// ��������
	public int deleteQuestion(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String query = "update questiontable set title='������' where num=?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rows = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("[����]qrydelete() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// �˻�
	// 1) ���̵�˻�
	public List<QuestionDTO> selectId(String Id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QuestionDTO> questionList = new ArrayList<QuestionDTO>();
		try {
			con = getConnection();

			String query = "select * from questiontable where id=? and title!='������' order by num desc ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				QuestionDTO question = new QuestionDTO();
				question.setNum(rs.getInt("num"));
				question.setTitle(rs.getString("Title"));
				question.setContent(rs.getString("Content"));
				question.setId(rs.getString("Id"));
				question.setDateCreated(rs.getString("DateCreated"));
				questionList.add(question);

			}
		} catch (Exception e) {
			System.out.println("[����]selectId() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return questionList;
	}

	// 2) Ű����˻�
	
	
	
	
	
	
	
	
	
	//�˻����� �˻�Ű���带 ���޹޾� BOARD ���̺��� ����� �˻�Ű���� �Խñ��� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	// => �˻������ ���� ��� BOARD ���̺��� ����� ��ü �Խñ��� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public int getQuestionTotal(String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int rows=0;
			try {
				con=getConnection();
				
				//�޼ҵ��� �Ķ���Ϳ� ���޵� ���� ���� �ٸ� SQL   
				//������ �����Ͽ� ���޵ǵ��� ���� - ���� SQL
				if(keyword.equals("")) {//�˻� ��� �̻��
					String sql="select count(*) from questiontable where title!='������' order by num desc";
					pstmt=con.prepareStatement(sql);
				} else {//�˻� ��� ���
					//�÷����� ������ Java ������ InParameter�� ��� �Ұ���
					String sql="select count(*) from questiontable where "+search+" like '%'||?||'%' and title!='������' order by num desc";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					rows=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[����]getBoardTotal() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return rows;
		}
		
	//�Խñ� ��ȣ�� ���޹޾� BOARD ���̺��� ����� �Խñ��� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public QuestionDTO getBoard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		QuestionDTO question=null;
		try {
			con=getConnection();
			
			String sql="select * from questiontable where num=? and title!='������' order by num desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				question = new QuestionDTO();
				question.setNum(rs.getInt("num"));
				question.setTitle(rs.getString("title"));
				question.setContent(rs.getString("content"));
				question.setId(rs.getString("id"));
				question.setDateCreated(rs.getString("dateCreated"));
				

			}
		} catch (SQLException e) {
			System.out.println("[����]getBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return question;
	}
		
		

}