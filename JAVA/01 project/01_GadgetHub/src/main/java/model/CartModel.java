package model;

public class CartModel {
	
	int productId;
	int clientID;
	public CartModel(int productId, int clientID) {
		super();
		this.productId = productId;
		this.clientID = clientID;
	}
	
	
	public CartModel() {
		super();
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getClientID() {
		return clientID;
	}
	public void setClientID(int clientID) {
		this.clientID = clientID;
	}
}
