package abc;

public class ABCDTO {
	private String userid;
	private String userpw;
	private String username;
	private String age;
	private String gender;
	private String email;
	
	
	
	
	
	public ABCDTO(String userid, String userpw, String username, String age, String gender, String email,
			String address) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.address = address;
	}



	private String address;
	
	
	public ABCDTO() {
		// TODO Auto-generated constructor stub
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getUserpw() {
		return userpw;
	}



	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
