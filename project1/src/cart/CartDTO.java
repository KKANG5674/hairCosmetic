package cart;

import java.sql.Date;

public class CartDTO {
	private int no;
	private Date orderDate;
	private String id;
	private String hairType;
	private String hairBold;
	private String hairDamage;
	private String headType;
	private String productFuntion;
	private String shampooColor;
	private String conditionColor;
	private String smell;
	private String smellPower;
	private String codeName;
	private String hashTagOne;
	private String hashTagTwo;
	private String hashTagThree;
	private String proSelect;
	private String price;
	

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getHairType() {
		return hairType;
	}
	public void setHairType(String hairType) {
		this.hairType = hairType;
	}
	public String getHairBold() {
		return hairBold;
	}
	public void setHairBold(String hairBold) {
		this.hairBold = hairBold;
	}
	public String getHairDamage() {
		return hairDamage;
	}
	public void setHairDamage(String hairDamage) {
		this.hairDamage = hairDamage;
	}
	public String getHeadType() {
		return headType;
	}
	public void setHeadType(String headType) {
		this.headType = headType;
	}

	public String getProductFuntion() {
		return productFuntion;
	}
	public void setProductFuntion(String productFuntion) {
		this.productFuntion = productFuntion;
	}
	public String getShampooColor() {
		return shampooColor;
	}
	public void setShampooColor(String shampooColor) {
		this.shampooColor = shampooColor;
	}
	public String getConditionColor() {
		return conditionColor;
	}
	public void setConditionColor(String conditionColor) {
		this.conditionColor = conditionColor;
	}
	public String getSmell() {
		return smell;
	}
	public void setSmell(String smell) {
		this.smell = smell;
	}
	public String getSmellPower() {
		return smellPower;
	}
	public void setSmellPower(String smellPower) {
		this.smellPower = smellPower;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getHashTagOne() {
		return hashTagOne;
	}
	public void setHashTagOne(String hashTagOne) {
		this.hashTagOne = hashTagOne;
	}
	public String getHashTagTwo() {
		return hashTagTwo;
	}
	public void setHashTagTwo(String hashTagTwo) {
		this.hashTagTwo = hashTagTwo;
	}
	public String getHashTagThree() {
		return hashTagThree;
	}
	public void setHashTagThree(String hashTagThree) {
		this.hashTagThree = hashTagThree;
	}
	public String getProSelect() {
		return proSelect;
	}
	public void setProSelect(String proSelect) {
		this.proSelect = proSelect;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "OrderDTO [no=" + no + ", orderDate=" + orderDate + ", hairType=" + hairType + ", hairBold=" + hairBold
				+ ", hairDamage=" + hairDamage + ", headType=" + headType + ", productFuntion=" + productFuntion
				+ ", shampooColor=" + shampooColor + ", conditionColor=" + conditionColor + ", smell=" + smell
				+ ", smellPower=" + smellPower + ", codeName=" + codeName + ", hashTagOne=" + hashTagOne
				+ ", hashTagTwo=" + hashTagTwo + ", hashTagThree=" + hashTagThree + ", proSelect=" + proSelect + "]";
	}

	
}
