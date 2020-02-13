package semiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import member.MemberDTO;
import semiProject.OrderDTO;


//DAO Ŭ���� : ����Ÿ ����Ҹ� �̿��Ͽ� ����Ÿ ����,����,����,�˻� ����� �����ϴ� Ŭ����

//PHONEBOOK ���̺��� �� ����,����,����,�˻� ����� �޼ҵ带 �����ϴ� Ŭ����
// => �̱��� Ŭ������ �ۼ��ϴ� ���� ����
public class OrderDAO extends JdbcDAO {
    private static OrderDAO _dao;
    
    private OrderDAO() {
        // TODO Auto-generated constructor stub
    }
    
    static {
        _dao=new OrderDAO();
    }
    
    public static OrderDAO getDAO() {
        return _dao;
    }
    
    //�ֹ��ϱ� (insert) �޼ҵ�
    public void insertorder(OrderDTO order) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con =getConnection();
            
            con.setAutoCommit(false);
            String query = "insert into ordertable values(ordertable_seq.nextval,sysdate,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'�������','����غ�')";
            pstmt = con.prepareStatement(query);
            //pstmt.setString(1, order.getId());
            pstmt.setString(1, order.getId());
            pstmt.setString(2, order.getHairType());
            pstmt.setString(3, order.getHairBold());
            pstmt.setString(4, order.getHairDamage());
            pstmt.setString(5, order.getHeadType());
            pstmt.setString(6, order.getProductFuntion());
            pstmt.setString(7, order.getShampooColor());
            pstmt.setString(8, order.getConditionColor());
            pstmt.setString(9, order.getSmell());
            pstmt.setString(10, order.getSmellPower());
            pstmt.setString(11, order.getCodeName());
            pstmt.setString(12, order.getHashTagOne());
            pstmt.setString(13, order.getHashTagTwo());
            pstmt.setString(14, order.getHashTagThree());
            pstmt.setString(15, order.getProSelect());
            pstmt.setString(16, order.getName());
            pstmt.setString(17, order.getPhone());
            pstmt.setString(18, order.getPostalCode());
            pstmt.setString(19, order.getAddress());
            pstmt.setString(20, order.getDetailAddress());
            pstmt.setString(21, order.getMessage());
            pstmt.setString(22, order.getDepositBank());
            pstmt.setString(23, order.getDepositName());
            pstmt.setString(24, order.getTotalCash());
            pstmt.executeUpdate();
            con.commit();
        } catch (Exception e) {
            con.rollback();
            System.out.println("[����] qryInsert() �޼ҵ��� SQL ����" + e.getMessage());
        } finally {
            close(con, pstmt);
        }
    }

    /* ������ main ���������� �� �޼ҵ� */
    /* �ֹ� */
    public int getOrderCount() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where payment='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderCount() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    public int getOrderTotal() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select sum(totalcash) from ordertable where payment='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderTotal() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* ���� */
    public int getSaleCount() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where payment!='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderCount() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    public int getSaleTotal() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select sum(totalcash) from ordertable where payment!='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getSaleTotal() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* �Ա� �� */
    public int getOrderBefore() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where payment='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderBefore() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }

    /* ����غ� */
    public int getOrderReady() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where delivery='����غ�' and payment!='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderReady() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* �����/ ��ۿϷ� */
    public int getOrderDo() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where delivery='�����' and payment!='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderDo() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* ��ۿϷ� */
    public int getOrderDone() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where delivery='��ۿϷ�' and payment!='�������'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderDone() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
  //��� ���� �����ִ� �޼ҵ�
  	public List<OrderDTO> getOrderList() {
  		Connection con =null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
  		try {
  			con=getConnection();
  			
  			String sql="select * from ordertable order by no";
  			pstmt=con.prepareStatement(sql);
  			
  			rs=pstmt.executeQuery();

              while(rs.next()) { OrderDTO order = new OrderDTO();
              order.setOrderDate(rs.getDate("orderDate"));
              order.setNo(rs.getInt("NO"));
              order.setId(rs.getString("ID"));
              order.setName(rs.getString("NAME"));
              order.setProSelect(rs.getString("PROSELECT"));
              order.setPayment(rs.getString("PAYMENT"));
              order.setDelivery(rs.getString("DELIVERY"));
              order.setDepositBank(rs.getString("DEPOSITBANK"));
              order.setDepositName(rs.getString("DEPOSITNAME"));
              order.setTotalCash(rs.getString("TOTALCASH"));
              orderList.add(order);
              }
  		} catch (SQLException e) {
  			System.out.println("[����]getOrderList() �޼ҵ��� SQL ���� = "+e.getMessage());
  		}finally {
  			close(con, pstmt, rs);
  		}
  		return orderList;
  	}
	//�ֹ������� ��� ������ DTO ����Ʈ�� ��Ƽ� �����´�.
	public ArrayList<OrderDTO> getOrderInfo(String id) 
	{
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<OrderDTO> list = new ArrayList();

	    try {
	        // ����
	        StringBuffer query = new StringBuffer();
	        query.append("SELECT * FROM ordertable WHERE id=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	
	        while(rs.next()){			//���⼭ �ٷ� ����� ���� ����. �׷��� DTO�� ����� �Ŵ�
	        	OrderDTO orderDTO = new OrderDTO();	//while�� �ȿ� �־��, �ٸ� �� ���� DTO���� 0��� ���� ��. �� �׷��� ������ ���� ����.
	        	orderDTO.setNo(rs.getInt("no"));	
	        	orderDTO.setOrderDate(rs.getDate("cartDate"));
	        	orderDTO.setId(rs.getString("id"));
	        	orderDTO.setHairType(rs.getString("hairType"));
	        	orderDTO.setHairBold(rs.getString("hairBold"));
	        	orderDTO.setHairDamage(rs.getString("hairDamage"));
	        	orderDTO.setHeadType(rs.getString("headType"));
	        	orderDTO.setProductFuntion(rs.getString("productFuntion"));
	        	orderDTO.setShampooColor(rs.getString("shampooColor"));
	        	orderDTO.setConditionColor(rs.getString("conditionColor"));
	        	orderDTO.setSmell(rs.getString("smell"));
	        	orderDTO.setSmellPower(rs.getString("smellPower"));
	        	orderDTO.setCodeName(rs.getString("codeName"));
	        	orderDTO.setHashTagOne(rs.getString("hashTagOne"));
	        	orderDTO.setHashTagTwo(rs.getString("hashTagTwo"));
	        	orderDTO.setHashTagThree(rs.getString("hashTagThree"));
	        	orderDTO.setProSelect(rs.getString("proSelect"));
	        	orderDTO.setName(rs.getString("orderName"));
	        	orderDTO.setPhone(rs.getString("orderPhone"));
	        	orderDTO.setPostalCode(rs.getString("postalcode"));
	        	orderDTO.setAddress(rs.getString("orderAddress"));
	        	orderDTO.setDetailAddress(rs.getString("detailAddress"));
	        	orderDTO.setMessage(rs.getString("message"));
	        	orderDTO.setDepositBank(rs.getString("depositBank"));
	        	orderDTO.setDepositName(rs.getString("depositName"));
	        	orderDTO.setTotalCash(rs.getString("totalCash"));
	        	orderDTO.setPayment(rs.getString("payment"));
	        	orderDTO.setDelivery(rs.getString("delivery"));
				list.add(orderDTO);

	          }
	
	        return list;
	
	    } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
	}
	
	//���� ���̵� īƮ ���� Ȯ�� �޼ҵ�
	public Boolean orderCheck(String id) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Boolean a = false;
 
        try {
            // ���� - ���� �Էµ� ���̵�� DB���� īƮ������ �ִ��� ��ȸ�Ѵ�.
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM ordertable WHERE ID='"+id+"'");
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
	// ����
    public int removeOrder(int no) {
        Connection con=null;
        PreparedStatement pstmt=null;
        int rows=0;
        try {
            con=getConnection();
            
            String sql="delete from ordertable where no=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, no);
            
            rows=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[����]removeMember() �޼ҵ��� SQL ���� = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;        
    }   
    // ���� �˻� 
    /*
    public List<OrderDTO> getorderSearchList( String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderSearchList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
		
			if(keyword.equals("")) {	
				String sql="select * from ordertable order by no";
				pstmt=con.prepareStatement(sql);
				
			} else {
				String sql="select * from ordertable where "
					+search+" like '%'||?||'%' order by no";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				order.setOrderDate(rs.getDate("cartDate"));
	              order.setNo(rs.getInt("NO"));
	              order.setId(rs.getString("ID"));
	              order.setName(rs.getString("ordername"));
	              order.setProSelect(rs.getString("PROSELECT"));
	              order.setPayment(rs.getString("PAYMENT"));
	              order.setDelivery(rs.getString("DELIVERY"));
	              order.setDepositBank(rs.getString("DEPOSITBANK"));
	              order.setDepositName(rs.getString("DEPOSITNAME"));
	              order.setTotalCash(rs.getString("TOTALCASH"));
	              orderSearchList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[����]getMemberSearchList() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderSearchList;
	}
	*/
    
	// ORDER ���̺��� ����� ��ü �ֹ��� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
    public int getOrderTotal(String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();

            if (keyword.equals("")) {// �˻� ��� �̻��
                String sql = "select count(*) from ordertable";
                pstmt = con.prepareStatement(sql);
            } else {// �˻� ��� ���
                // �÷����� ������ Java ������ InParameter�� ��� �Ұ���
                
                String sql="select count(*) from ordertable where "+search+" like '%'||?||'%'";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getOrderTotal() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    
    // ����¡ ó��
    public List<OrderDTO> getorderSearchList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderSearchList=new ArrayList<OrderDTO>();
           try {
               con = getConnection();

               if (keyword.equals("")) {
                   String sql = "select * from (select rownum rn, temp.* from (select * from ordertable order by no) temp) where rn between ? and ?";
                   pstmt = con.prepareStatement(sql);
                   pstmt.setInt(1, startRow);
                   pstmt.setInt(2, endRow);
               } else {
                   String sql = "select * from (select rownum rn, temp.* from (select * from ordertable where "
       					+search+" like '%'||?||'%' order by no) temp) where rn between ? and ?";
                   pstmt = con.prepareStatement(sql);
                   pstmt.setString(1, keyword);
                   pstmt.setInt(2, startRow);
                   pstmt.setInt(3, endRow);
               }

               rs = pstmt.executeQuery();

               while (rs.next()) {
            	  OrderDTO order=new OrderDTO();
   				  order.setOrderDate(rs.getDate("cartDate"));
   	              order.setNo(rs.getInt("NO"));
   	              order.setId(rs.getString("ID"));
   	              order.setName(rs.getString("ordername"));
   	              order.setProSelect(rs.getString("PROSELECT"));
   	              order.setPayment(rs.getString("PAYMENT"));
   	              order.setDelivery(rs.getString("DELIVERY"));
   	              order.setDepositBank(rs.getString("DEPOSITBANK"));
   	              order.setDepositName(rs.getString("DEPOSITNAME"));
   	              order.setTotalCash(rs.getString("TOTALCASH"));
   	              orderSearchList.add(order); 
               }
           } catch (SQLException e) {
               System.out.println("[����]getorderSearchList() �޼ҵ��� SQL ���� = " + e.getMessage());
           } finally {
               close(con, pstmt, rs);
           }
           return orderSearchList;
       }
    
    // �ֹ��ϱ� ��� �� ���� ����
    public void updateOrder(int no, String payment, String delivery) {
        Connection con=null;
        PreparedStatement pstmt=null;
       
        try {
            con=getConnection();
			con.setAutoCommit(false);
            String sql="update ordertable set payment=?,delivery=? where no=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, payment);
            pstmt.setString(2, delivery);
            pstmt.setInt(3, no);
            pstmt.executeUpdate();
            
            con.commit();
        } catch (SQLException e) {
            System.out.println("[����]modifyMember() �޼ҵ��� SQL ���� = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
    }
    
	//�ֹ���ȣ�� ���� �ֹ����� ����Ʈ
	public ArrayList<OrderDTO> getOrderDetail(String no) 
	{
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<OrderDTO> list = new ArrayList();

	    try {
	        // ����
	        StringBuffer query = new StringBuffer();
	        query.append("SELECT * FROM ordertable WHERE no=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setString(1, no);
	        rs = pstmt.executeQuery();
	
	        while(rs.next()){			//���⼭ �ٷ� ����� ���� ����. �׷��� DTO�� ����� �Ŵ�
	        	OrderDTO orderDTO = new OrderDTO();	//while�� �ȿ� �־��, �ٸ� �� ���� DTO���� 0��� ���� ��. �� �׷��� ������ ���� ����.
	        	orderDTO.setNo(rs.getInt("no"));	
	        	orderDTO.setOrderDate(rs.getDate("cartDate"));
	        	orderDTO.setId(rs.getString("id"));
	        	orderDTO.setHairType(rs.getString("hairType"));
	        	orderDTO.setHairBold(rs.getString("hairBold"));
	        	orderDTO.setHairDamage(rs.getString("hairDamage"));
	        	orderDTO.setHeadType(rs.getString("headType"));
	        	orderDTO.setProductFuntion(rs.getString("productFuntion"));
	        	orderDTO.setShampooColor(rs.getString("shampooColor"));
	        	orderDTO.setConditionColor(rs.getString("conditionColor"));
	        	orderDTO.setSmell(rs.getString("smell"));
	        	orderDTO.setSmellPower(rs.getString("smellPower"));
	        	orderDTO.setCodeName(rs.getString("codeName"));
	        	orderDTO.setHashTagOne(rs.getString("hashTagOne"));
	        	orderDTO.setHashTagTwo(rs.getString("hashTagTwo"));
	        	orderDTO.setHashTagThree(rs.getString("hashTagThree"));
	        	orderDTO.setProSelect(rs.getString("proSelect"));
	        	orderDTO.setName(rs.getString("orderName"));
	        	orderDTO.setPhone(rs.getString("orderPhone"));
	        	orderDTO.setPostalCode(rs.getString("postalcode"));
	        	orderDTO.setAddress(rs.getString("orderAddress"));
	        	orderDTO.setDetailAddress(rs.getString("detailAddress"));
	        	orderDTO.setMessage(rs.getString("message"));
	        	orderDTO.setDepositBank(rs.getString("depositBank"));
	        	orderDTO.setDepositName(rs.getString("depositName"));
	        	orderDTO.setTotalCash(rs.getString("totalCash"));
	        	orderDTO.setPayment(rs.getString("payment"));
	        	orderDTO.setDelivery(rs.getString("delivery"));
				list.add(orderDTO);

	          }
	
	        return list;
	
	    } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
	}
}   

