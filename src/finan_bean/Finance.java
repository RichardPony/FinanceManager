package finan_bean;

import java.sql.Date;

public class Finance {
	String username;
	String type;
	String number;
	java.sql.Date time = new java.sql.Date((new java.util.Date()).getTime());
	String comments;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(java.sql.Date time) {
		this.time = time;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
}
