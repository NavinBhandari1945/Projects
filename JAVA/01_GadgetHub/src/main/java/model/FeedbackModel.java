package model;

public class FeedbackModel {
	
	private String Name;
	private String Email;
	private String Message;
	public FeedbackModel(String name, String email, String message) {
		super();
		Name = name;
		Email = email;
		Message = message;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
}
