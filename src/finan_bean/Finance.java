package finan_bean;
import java.util.Date;
public class Finance {
	String username;
	String type;
	String number;
	Date time;
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
//		java.sql.Date timePara = new java.sql.Date(time.getTime());
		
		return null;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
}
