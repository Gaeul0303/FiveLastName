package kr.co.FiveLastName.domain;

public class PartnerDTO {
	int pa_id;
	int pr_id; 
	String pa_name;
	String pa_manager;
	String pa_tel;
	String pa_email;
	String pa_address;
	
	public PartnerDTO() {
		super();
	}
	public PartnerDTO(int pa_id, int pr_id, String pa_name, String pa_manager, String pa_tel, String pa_email,
			String pa_address) {
		super();
		this.pa_id = pa_id;
		this.pr_id = pr_id;
		this.pa_name = pa_name;
		this.pa_manager = pa_manager;
		this.pa_tel = pa_tel;
		this.pa_email = pa_email;
		this.pa_address = pa_address;
	}
	public int getPa_id() {
		return pa_id;
	}
	public void setPa_id(int pa_id) {
		this.pa_id = pa_id;
	}
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id)   {
		this.pr_id = pr_id;
	}
	public String getPa_name() {
		return pa_name;
	}
	public void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}
	public String getPa_manager() {
		return pa_manager;
	}
	public void setPa_manager(String pa_manager) {
		this.pa_manager = pa_manager;
	}
	public String getPa_tel() {
		return pa_tel;
	}
	public void setPa_tel(String pa_tel) {
		this.pa_tel = pa_tel;
	}
	public String getPa_email() {
		return pa_email;
	}
	public void setPa_email(String pa_email) {
		this.pa_email = pa_email;
	}
	public String getPa_address() {
		return pa_address;
	}
	public void setPa_address(String pa_address) {
		this.pa_address = pa_address;
	}
	@Override
	public String toString() {
		return "PartnerDTO [pa_id=" + pa_id + ", pr_id=" + pr_id + ", pa_name=" + pa_name + ", pa_manager=" + pa_manager
				+ ", pa_tel=" + pa_tel + ", pa_email=" + pa_email + ", pa_address=" + pa_address + "]";
	}
	
	
	
}
