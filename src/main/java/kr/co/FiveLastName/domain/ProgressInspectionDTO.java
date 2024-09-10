package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ProgressInspectionDTO {
	
	private int pi_id;
	private int ss_id; 
	private String st_id; 
	private int pi_order; 
	private String pi_date; 
	private String pi_inspectedDate;
	private String pi_status;
	private String pi_content; 
	private int pi_uninspectedQuantity; 
	private int pi_inspectedQuantity; 
	private String pr_name;
	private int pr_id;
	private int pa_id;
	private String pa_name;
	private String st_name;
	private int ss_quantity;
	
	public ProgressInspectionDTO() {
		super();
	}

	public ProgressInspectionDTO(int pi_id, int ss_id, String st_id, int pi_order, String pi_date,
			String pi_inspectedDate, String pi_status, String pi_content, int pi_uninspectedQuantity,
			int pi_inspectedQuantity, String pr_name, int pr_id, int pa_id, String pa_name, String st_name,
			int ss_quantity) {
		super();
		this.pi_id = pi_id;
		this.ss_id = ss_id;
		this.st_id = st_id;
		this.pi_order = pi_order;
		this.pi_date = pi_date;
		this.pi_inspectedDate = pi_inspectedDate;
		this.pi_status = pi_status;
		this.pi_content = pi_content;
		this.pi_uninspectedQuantity = pi_uninspectedQuantity;
		this.pi_inspectedQuantity = pi_inspectedQuantity;
		this.pr_name = pr_name;
		this.pr_id = pr_id;
		this.pa_id = pa_id;
		this.pa_name = pa_name;
		this.st_name = st_name;
		this.ss_quantity = ss_quantity;
	}

	public int getPi_id() {
		return pi_id;
	}

	public void setPi_id(int pi_id) {
		this.pi_id = pi_id;
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

	public int getPi_order() {
		return pi_order;
	}

	public void setPi_order(int pi_order) {
		this.pi_order = pi_order;
	}

	public String getPi_date() {
		return pi_date;
	}

	public void setPi_date(String pi_date) {
		this.pi_date = pi_date;
	}

	public String getPi_inspectedDate() {
		return pi_inspectedDate;
	}

	public void setPi_inspectedDate(String pi_inspectedDate) {
		this.pi_inspectedDate = pi_inspectedDate;
	}

	public String getPi_status() {
		return pi_status;
	}

	public void setPi_status(String pi_status) {
		this.pi_status = pi_status;
	}

	public String getPi_content() {
		return pi_content;
	}

	public void setPi_content(String pi_content) {
		this.pi_content = pi_content;
	}

	public int getPi_uninspectedQuantity() {
		return pi_uninspectedQuantity;
	}

	public void setPi_uninspectedQuantity(int pi_uninspectedQuantity) {
		this.pi_uninspectedQuantity = pi_uninspectedQuantity;
	}

	public int getPi_inspectedQuantity() {
		return pi_inspectedQuantity;
	}

	public void setPi_inspectedQuantity(int pi_inspectedQuantity) {
		this.pi_inspectedQuantity = pi_inspectedQuantity;
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
		return "ProgressInspectionDTO [pi_id=" + pi_id + ", ss_id=" + ss_id + ", st_id=" + st_id + ", pi_order="
				+ pi_order + ", pi_date=" + pi_date + ", pi_inspectedDate=" + pi_inspectedDate + ", pi_status="
				+ pi_status + ", pi_content=" + pi_content + ", pi_uninspectedQuantity=" + pi_uninspectedQuantity
				+ ", pi_inspectedQuantity=" + pi_inspectedQuantity + ", pr_name=" + pr_name + ", pr_id=" + pr_id
				+ ", pa_id=" + pa_id + ", pa_name=" + pa_name + ", st_name=" + st_name + ", ss_quantity=" + ss_quantity
				+ "]";
	}

	
	
}
