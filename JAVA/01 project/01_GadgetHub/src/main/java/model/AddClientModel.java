package model;

import java.io.File;
import java.time.LocalDate;

import javax.servlet.http.Part;

import util.StringUtils;

public class AddClientModel {
	
	private String first_name;
	private String last_name;
	private String email;
	private String phone_number;
	private LocalDate dob;
	private String gender;
	private String username;
	private String password;
	private String retypePassword;
	private String address;
	private String profile_image;
	
	
	public AddClientModel() {
		super();
	}

	public AddClientModel(String first_name, String last_name, String email, String phone_number, LocalDate dob,
			String gender, String username, String password, String retypePassword, String address,Part profile_image) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.phone_number = phone_number;
		this.dob = dob;
		this.gender = gender;
		this.username = username;
		this.password = password;
		this.retypePassword = retypePassword;
		this.address = address;
		this.profile_image=getImageUrl(profile_image);
	}
	
	



	public String getProfile_image() {
		return profile_image;
	}



	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}



	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRetypePassword() {
		return retypePassword;
	}

	public void setRetypePassword(String retypePassword) {
		this.retypePassword = retypePassword;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
	
}
