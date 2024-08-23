package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ReturnDTO {
	
	String re_code; 
	int ri_id;
	Timestamp re_returnApplicationDate; 
	String re_status;
	Timestamp re_returnCompletionDate; 
	int re_errorNum; 
	String re_notes;
	
	public ReturnDTO() {
		super();
	}

	public ReturnDTO(String re_code, int ri_id, Timestamp re_returnApplicationDate, String re_status,
			Timestamp re_returnCompletionDate, int re_errorNum, String re_notes) {
		super();
		this.re_code = re_code;
		this.ri_id = ri_id;
		this.re_returnApplicationDate = re_returnApplicationDate;
		this.re_status = re_status;
		this.re_returnCompletionDate = re_returnCompletionDate;
		this.re_errorNum = re_errorNum;
		this.re_notes = re_notes;
	}

	public String getRe_code() {
		return re_code;
	}

	public void setRe_code(String re_code) {
		this.re_code = re_code;
	}

	public int getRi_id() {
		return ri_id;
	}

	public void setRi_id(int ri_id) {
		this.ri_id = ri_id;
	}

	public Timestamp getRe_returnApplicationDate() {
		return re_returnApplicationDate;
	}

	public void setRe_returnApplicationDate(Timestamp re_returnApplicationDate) {
		this.re_returnApplicationDate = re_returnApplicationDate;
	}

	public String getRe_status() {
		return re_status;
	}

	public void setRe_status(String re_status) {
		this.re_status = re_status;
	}

	public Timestamp getRe_returnCompletionDate() {
		return re_returnCompletionDate;
	}

	public void setRe_returnCompletionDate(Timestamp re_returnCompletionDate) {
		this.re_returnCompletionDate = re_returnCompletionDate;
	}

	public int getRe_errorNum() {
		return re_errorNum;
	}

	public void setRe_errorNum(int re_errorNum) {
		this.re_errorNum = re_errorNum;
	}

	public String getRe_notes() {
		return re_notes;
	}

	public void setRe_notes(String re_notes) {
		this.re_notes = re_notes;
	}

	@Override
	public String toString() {
		return "ReturnDTO [re_code=" + re_code + ", ri_id=" + ri_id + ", re_returnApplicationDate="
				+ re_returnApplicationDate + ", re_status=" + re_status + ", re_returnCompletionDate="
				+ re_returnCompletionDate + ", re_errorNum=" + re_errorNum + ", re_notes=" + re_notes + "]";
	}
	
	
	
}
