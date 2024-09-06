package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ProgressInspectionRecordDTO {
	
	private int pir_id;
	private int ss_id; 
	private String st_id; 
	private int pir_order; 
	private Timestamp pir_date; 
	private Timestamp pir_inspectedDate;
	private String pir_status;
	private String pir_content; 
	private int pir_uninspectedQuantity; 
	private int pir_inspectedQuantity; 
	private String pr_name;
	private int pr_id;
	private int pa_id;
	private String pa_name;
	private String st_name;
	private int ss_quantity;
	
	public ProgressInspectionRecordDTO() {
		super();
	}

	

	public ProgressInspectionRecordDTO(int pir_id, int ss_id, String st_id, int pir_order, Timestamp pir_date,
			Timestamp pir_inspectedDate, String pir_status, String pir_content, int pir_uninspectedQuantity,
			int pir_inspectedQuantity, Timestamp pir_registrationDate, Timestamp pir_modificationDate, String pr_name,
			int pr_id, int pa_id, String pa_name, String st_name, int ss_quantity) {
		super();
		this.pir_id = pir_id;
		this.ss_id = ss_id;
		this.st_id = st_id;
		this.pir_order = pir_order;
		this.pir_date = pir_date;
		this.pir_inspectedDate = pir_inspectedDate;
		this.pir_status = pir_status;
		this.pir_content = pir_content;
		this.pir_uninspectedQuantity = pir_uninspectedQuantity;
		this.pir_inspectedQuantity = pir_inspectedQuantity;
		this.pr_name = pr_name;
		this.pr_id = pr_id;
		this.pa_id = pa_id;
		this.pa_name = pa_name;
		this.st_name = st_name;
		this.ss_quantity = ss_quantity;
	}



	public int getpir_id() {
		return pir_id;
	}

	public void setpir_id(int pir_id) {
		this.pir_id = pir_id;
	}

	public int getSs_id() {
		return ss_id;
	}

	public void setSs_id(int ss_id) {
		this.ss_id = ss_id;
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public int getpir_order() {
		return pir_order;
	}

	public void setpir_order(int pir_order) {
		this.pir_order = pir_order;
	}

	public Timestamp getpir_date() {
		return pir_date;
	}

	public void setpir_date(Timestamp pir_date) {
		this.pir_date = pir_date;
	}

	public Timestamp getpir_inspectedDate() {
		return pir_inspectedDate;
	}

	public void setpir_inspectedDate(Timestamp pir_inspectedDate) {
		this.pir_inspectedDate = pir_inspectedDate;
	}

	public String getpir_status() {
		return pir_status;
	}

	public void setpir_status(String pir_status) {
		this.pir_status = pir_status;
	}

	public String getpir_content() {
		return pir_content;
	}

	public void setpir_content(String pir_content) {
		this.pir_content = pir_content;
	}

	public int getpir_uninspectedQuantity() {
		return pir_uninspectedQuantity;
	}

	public void setpir_uninspectedQuantity(int pir_uninspectedQuantity) {
		this.pir_uninspectedQuantity = pir_uninspectedQuantity;
	}

	public int getpir_inspectedQuantity() {
		return pir_inspectedQuantity;
	}

	public void setpir_inspectedQuantity(int pir_inspectedQuantity) {
		this.pir_inspectedQuantity = pir_inspectedQuantity;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getPr_id() {
		return pr_id;
	}

	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
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

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	
	public int getSs_quantity() {
		return ss_quantity;
	}



	public void setSs_quantity(int ss_quantity) {
		this.ss_quantity = ss_quantity;
	}



	@Override
	public String toString() {
		return "ProgressInspectionDTO [pir_id=" + pir_id + ", ss_id=" + ss_id + ", st_id=" + st_id + ", pir_order="
				+ pir_order + ", pir_date=" + pir_date + ", pir_inspectedDate=" + pir_inspectedDate + ", pir_status="
				+ pir_status + ", pir_content=" + pir_content + ", pir_uninspectedQuantity=" + pir_uninspectedQuantity
				+ ", pir_inspectedQuantity=" + pir_inspectedQuantity + ", pr_name=" + pr_name + ", pr_id=" + pr_id
				+ ", pa_id=" + pa_id + ", pa_name=" + pa_name + ", st_name=" + st_name + ", ss_quantity=" + ss_quantity
				+ "]";
	}


	
	
	
}
