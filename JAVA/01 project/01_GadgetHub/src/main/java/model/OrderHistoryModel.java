package model;

import java.sql.Date;

public class OrderHistoryModel {
    public OrderHistoryModel() {
		super();
	}
	private int oId;
    private int pId;
    private int cId;
    private int cart_id;
    private Date orderDate;
    private int totalQuantity;
    private int totalPrice;
    private String deliveryStatus;
    private String p_brand;
    private String p_description;
    private String p_image;
    private int p_unit_price;
	public OrderHistoryModel(int oId, int pId, int cId, Date orderDate, int totalQuantity, int totalPrice,
			String deliveryStatus,String p_brand,String p_description,String p_image,int cart_id,int p_unit_price) {
		super();
		this.oId = oId;
		this.pId = pId;
		this.cId = cId;
		this.orderDate = orderDate;
		this.totalQuantity = totalQuantity;
		this.totalPrice = totalPrice;
		this.deliveryStatus = deliveryStatus;
		this.p_brand=p_brand;
		this.p_description=p_description;
		this.p_image=p_image;
		this.cart_id=cart_id;
		this.p_unit_price=p_unit_price;
	}
	
	
	
	
public int getP_unit_price() {
		return p_unit_price;
	}




	public void setP_unit_price(int p_unit_price) {
		this.p_unit_price = p_unit_price;
	}




public int getCart_id() {
		return cart_id;
	}




	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}




public String getP_image() {
		return p_image;
	}


	public void setP_image(String p_image) {
		this.p_image = p_image;
	}


public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	//	public OrderHistoryModel() {
//		super();
//	}
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
    
    

}
