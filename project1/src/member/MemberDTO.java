package member;

import java.sql.Date;

public class MemberDTO {
	
	private int memberNo;
	private String id;
	private String password;
	private String name;
	private String address;
	private String sex;
	private String birthday;
	private String phone;
	private String memberDate;
	private String authority;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "MemberDTO [memberNo=" + memberNo + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", address=" + address + ", sex=" + sex + ", birthday=" + birthday + ", phone=" + phone
				+ ", memberDate=" + memberDate + ", authority=" + authority + "]";
	}
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
