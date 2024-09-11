package kr.co.FiveLastName.domain;

public class StaffDTO {
	private String st_id;
	private String st_pw;
	private String st_name;
	private String st_department;
	private String st_email;
	public StaffDTO() {
		super();
	}
	
	public StaffDTO(String st_id, String st_pw) {
		super();
		this.st_id = st_id;
		this.st_pw = st_pw;
		
	}
	public StaffDTO(String st_id, String st_pw, String st_name, String st_department, String st_email) {
		super();
		this.st_id = st_id;
		this.st_pw = st_pw;
		this.st_name = st_name;
		this.st_department = st_department;
		this.st_email = st_email;
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getSt_pw() {
		return st_pw;
	}

	public void setSt_pw(String st_pw) {
		this.st_pw = st_pw;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_department() {
		return st_department;
	}

	public void setSt_department(String st_department) {
		this.st_department = st_department;
	}

	public String getSt_email() {
		return st_email;
	}

	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}

	@Override
	public String toString() {
		return "StaffDTO [st_id=" + st_id + ", st_pw=" + st_pw + ", st_name=" + st_name + ", st_department="
				+ st_department + ", st_email=" + st_email + "]";
	}
	
}
