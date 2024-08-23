package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ProgressInspectionDTO {
	
	int pi_id;
	int ss_id; 
	String st_id; 
	int pi_order; 
	Timestamp pi_date; 
	Timestamp pi_inspectedDate;
	String pi_status;
	String pi_content; 
	int pi_uninspectedQuantity; 
	int pi_inspectedQuantity; 
	Timestamp pi_registrationDate;
	Timestamp pi_modificationDate;
	
	public ProgressInspectionDTO() {
		super();
	}
	
	public ProgressInspectionDTO(int pi_id, int ss_id, String st_id, int pi_order, Timestamp pi_date,
			Timestamp pi_inspectedDate, String pi_status, String pi_content, int pi_uninspectedQuantity,
			int pi_inspectedQuantity, Timestamp pi_registrationDate, Timestamp pi_modificationDate) {
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
		this.pi_registrationDate = pi_registrationDate;
		this.pi_modificationDate = pi_modificationDate;
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
	public Timestamp getPi_date() {
		return pi_date;
	}
	public void setPi_date(Timestamp pi_date) {
		this.pi_date = pi_date;
	}
	public Timestamp getPi_inspectedDate() {
		return pi_inspectedDate;
	}
	public void setPi_inspectedDate(Timestamp pi_inspectedDate) {
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
	public Timestamp getPi_registrationDate() {
		return pi_registrationDate;
	}
	public void setPi_registrationDate(Timestamp pi_registrationDate) {
		this.pi_registrationDate = pi_registrationDate;
	}
	public Timestamp getPi_modificationDate() {
		return pi_modificationDate;
	}
	public void setPi_modificationDate(Timestamp pi_modificationDate) {
		this.pi_modificationDate = pi_modificationDate;
	}
	
	@Override
	public String toString() {
		return "ProgressInspectionDTO [pi_id=" + pi_id + ", ss_id=" + ss_id + ", st_id=" + st_id + ", pi_order="
				+ pi_order + ", pi_date=" + pi_date + ", pi_inspectedDate=" + pi_inspectedDate + ", pi_status="
				+ pi_status + ", pi_content=" + pi_content + ", pi_uninspectedQuantity=" + pi_uninspectedQuantity
				+ ", pi_inspectedQuantity=" + pi_inspectedQuantity + ", pi_registrationDate=" + pi_registrationDate
				+ ", pi_modificationDate=" + pi_modificationDate + "]";
	}
	
}
