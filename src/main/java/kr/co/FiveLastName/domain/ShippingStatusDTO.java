package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ShippingStatusDTO {
	private int ss_id;
	private int po_id;
	private int ss_quantity;
	private String ss_status;
	private String ss_deliverySchedule;
	private Timestamp ss_shippingDate;
	private String ss_shippingStatus;
	private int pr_id;
	private String pr_name;
	private int pa_id;
	private String pa_name;
	private String pa_manager;
	private String pa_tel;
	private String pa_email;
	private String ss_piStatus;
	
	public ShippingStatusDTO() {
		super();
	}

	public ShippingStatusDTO(int ss_id, int po_id, int ss_quantity, String ss_status, String ss_deliverySchedule,
			Timestamp ss_shippingDate, String ss_shippingStatus, int pr_id, String pr_name, int pa_id, String pa_name,
			String pa_manager, String pa_tel, String pa_email, String ss_piStatus) {
		super();
		this.ss_id = ss_id;
		this.po_id = po_id;
		this.ss_quantity = ss_quantity;
		this.ss_status = ss_status;
		this.ss_deliverySchedule = ss_deliverySchedule;
		this.ss_shippingDate = ss_shippingDate;
		this.ss_shippingStatus = ss_shippingStatus;
		this.pr_id = pr_id;
		this.pr_name = pr_name;
		this.pa_id = pa_id;
		this.pa_name = pa_name;
		this.pa_manager = pa_manager;
		this.pa_tel = pa_tel;
		this.pa_email = pa_email;
		this.ss_piStatus = ss_piStatus;
	}

	public int getSs_id() {
		return ss_id;
	}

	public void setSs_id(int ss_id) {
		this.ss_id = ss_id;
	}

	public int getPo_id() {
		return po_id;
	}

	public void setPo_id(int po_id) {
		this.po_id = po_id;
	}

	public int getSs_quantity() {
		return ss_quantity;
	}

	public void setSs_quantity(int ss_quantity) {
		this.ss_quantity = ss_quantity;
	}

	public String getSs_status() {
		return ss_status;
	}

	public void setSs_status(String ss_status) {
		this.ss_status = ss_status;
	}

	public String getSs_deliverySchedule() {
		return ss_deliverySchedule;
	}

	public void setSs_deliverySchedule(String ss_deliverySchedule) {
		this.ss_deliverySchedule = ss_deliverySchedule;
	}

	public Timestamp getSs_shippingDate() {
		return ss_shippingDate;
	}

	public void setSs_shippingDate(Timestamp ss_shippingDate) {
		this.ss_shippingDate = ss_shippingDate;
	}

	public String getSs_shippingStatus() {
		return ss_shippingStatus;
	}

	public void setSs_shippingStatus(String ss_shippingStatus) {
		this.ss_shippingStatus = ss_shippingStatus;
	}

	public int getPr_id() {
		return pr_id;
	}

	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getPa_id() {
		return pa_id;
	}

	public void setPa_id(int pa_id) {
		this.pa_id = pa_id;
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

	public String getSs_piStatus() {
		return ss_piStatus;
	}

	public void setSs_piStatus(String ss_piStatus) {
		this.ss_piStatus = ss_piStatus;
	}

	@Override
	public String toString() {
		return "ShippingStatusDTO [ss_id=" + ss_id + ", po_id=" + po_id + ", ss_quantity=" + ss_quantity
				+ ", ss_status=" + ss_status + ", ss_deliverySchedule=" + ss_deliverySchedule + ", ss_shippingDate="
				+ ss_shippingDate + ", ss_shippingStatus=" + ss_shippingStatus + ", pr_id=" + pr_id + ", pr_name="
				+ pr_name + ", pa_id=" + pa_id + ", pa_name=" + pa_name + ", pa_manager=" + pa_manager + ", pa_tel="
				+ pa_tel + ", pa_email=" + pa_email + ", ss_piStatus=" + ss_piStatus + "]";
	}

	

	

	
	
}
