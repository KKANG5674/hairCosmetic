package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semiProject.JdbcDAO;

public class CartDAO extends JdbcDAO {
	private static CartDAO _dao;
	
	private CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CartDAO();
	}
	
	public static CartDAO getDAO() {
		return _dao;
	}
	
	//�ֹ��ϱ� (insert) �޼ҵ�
	public void insertcart(CartDTO cart) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con =getConnection();
			
			con.setAutoCommit(false);
			String query = "insert into carttable values(carttable_seq.nextval,sysdate,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, cart.getId());
			pstmt.setString(1, cart.getId());
			pstmt.setString(2, cart.getHairType());
			pstmt.setString(3, cart.getHairBold());
			pstmt.setString(4, cart.getHairDamage());
			pstmt.setString(5, cart.getHeadType());
			pstmt.setString(6, cart.getProductFuntion());
			pstmt.setString(7, cart.getShampooColor());
			pstmt.setString(8, cart.getConditionColor());
			pstmt.setString(9, cart.getSmell());
			pstmt.setString(10, cart.getSmellPower());
			pstmt.setString(11, cart.getCodeName());
			pstmt.setString(12, cart.getHashTagOne());
			pstmt.setString(13, cart.getHashTagTwo());
			pstmt.setString(14, cart.getHashTagThree());
			pstmt.setString(15, cart.getProSelect());
			pstmt.setString(16, cart.getPrice());
			pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			con.rollback();
			System.out.println("[����] qryInsert() �޼ҵ��� SQL ����" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
	}
	
	//���� ���̵� īƮ ���� Ȯ�� �޼ҵ�
	public Boolean cartCheck(String id) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Boolean a = false;
 
        try {
            // ���� - ���� �Էµ� ���̵�� DB���� īƮ������ �ִ��� ��ȸ�Ѵ�.
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM carttable WHERE ID='"+id+"'");
			con =getConnection();
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) // �ش� ���̵� īƮ������ �������
            {
            	a=true;
                return a;
                
            } else {// �ش� ���̵��� īƮ������ �������
            	return a;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
    }
	
	//cart�� ��� ������ DTO ����Ʈ�� ��Ƽ� �����´�.
	public ArrayList<CartDTO> getCartInfo(String id) 
	{
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<CartDTO> list = new ArrayList();

	    try {
	        // ����
	        StringBuffer query = new StringBuffer();
	        query.append("SELECT * FROM carttable WHERE id=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	
	        while(rs.next()){			//���⼭ �ٷ� ����� ���� ����. �׷��� DTO�� ����� �Ŵ�
	        	CartDTO cartDTO = new CartDTO();	//while�� �ȿ� �־��, �ٸ� �� ���� DTO���� 0��� ���� ��. �� �׷��� ������ ���� ����.
	        	cartDTO.setNo(rs.getInt("no"));	
	        	cartDTO.setOrderDate(rs.getDate("cartDate"));
	        	cartDTO.setId(rs.getString("id"));
	        	cartDTO.setHairType(rs.getString("hairType"));
	        	cartDTO.setHairBold(rs.getString("hairBold"));
	        	cartDTO.setHairDamage(rs.getString("hairDamage"));
	        	cartDTO.setHeadType(rs.getString("headType"));
	        	cartDTO.setProductFuntion(rs.getString("productFuntion"));
	        	cartDTO.setShampooColor(rs.getString("shampooColor"));
	        	cartDTO.setConditionColor(rs.getString("conditionColor"));
	        	cartDTO.setSmell(rs.getString("smell"));
	        	cartDTO.setSmellPower(rs.getString("smellPower"));
	        	cartDTO.setCodeName(rs.getString("codeName"));
	        	cartDTO.setHashTagOne(rs.getString("hashTagOne"));
	        	cartDTO.setHashTagTwo(rs.getString("hashTagTwo"));
	        	cartDTO.setHashTagThree(rs.getString("hashTagThree"));
	        	cartDTO.setProSelect(rs.getString("proSelect"));
	        	cartDTO.setPrice(rs.getString("price"));
				list.add(cartDTO);

	          }
	
	        return list;
	
	    } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
	}
	//īƮ �ѹ��� �����޾� īƮ���� ���� �޼ҵ�
	public void deleteCart(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
	    ResultSet rs = null;
		try {
	        // ����
	        StringBuffer query = new StringBuffer();
	        query.append("DELETE FROM carttable WHERE no=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setInt(1,no);
	        rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("[����]deleteCart() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
	}
	
	public void deleteCartId(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
	    ResultSet rs = null;
		try {
	        // ����
	        StringBuffer query = new StringBuffer();
	        query.append("DELETE FROM carttable WHERE id=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setString(1,id);
	        rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("[����]deleteCart() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
	}
}
