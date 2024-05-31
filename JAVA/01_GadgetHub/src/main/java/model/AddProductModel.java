package model;

import java.io.File; 

import javax.servlet.http.Part;

import util.StringUtils;

public class AddProductModel {
	private int id;
	private String p_name;
	private int p_unit_price;
	private int p_quantity;
	private String p_brand;
	private String p_image;
	private String p_description;
	
	public AddProductModel(){
		
	};
	
	public AddProductModel(int id, String p_name, int p_unit_price, int p_quantity, String p_brand, Part p_image,String description) {
		super();
		this.id = id;
		this.p_name = p_name;
		this.p_unit_price = p_unit_price;
		this.p_quantity = p_quantity;
		this.p_brand = p_brand;
		this.p_image =getImageUrl(p_image);
		this.p_description=description;
	}
	

	
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_unit_price() {
		return p_unit_price;
	}
	public void setP_unit_price(int p_unit_price) {
		this.p_unit_price = p_unit_price;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	
	
	
	public String getP_description() {
		return p_description;
	}

	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	private String getImageUrl(Part imagePart) {
		String savePath = StringUtils.images_dir_path;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = imagePart.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart = "default.jpg";
		}
		return imageUrlFromPart;
	}
	
	

//	public String getImageUrlFromPart() {
//		return ImageUrlFromPart;
//	}
//
//	public void setImageUrlFromPart(Part part) {
//		this.ImageUrlFromPart = getImageUrl(part);
//	}
	
	

}

	
	

