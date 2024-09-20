package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class TakeBackDTO {
	
	private String tb_code; 
	private int ri_id;
	private Timestamp tb_returnApplicationDate; 
	private String tb_status;
	private Timestamp tb_returnCompletionDate; 
	private int tb_errorNum; 
	private String tb_notes;
	private String pr_name;
	private int co_supplyPrice;
	private int ri_totalPrice;
	private String st_name;
	private String pa_name;
	private String pa_manager;
	private String pa_address;
	
	public TakeBackDTO() {
		super();
	}

	public TakeBackDTO(String tb_code, int ri_id, Timestamp tb_returnApplicationDate, String tb_status,
			Timestamp tb_returnCompletionDate, int tb_errorNum, String tb_notes, String pr_name, int co_supplyPrice,
			int ri_totalPrice, String st_name, String pa_name, String pa_manager, String pa_address) {
		super();
		this.tb_code = tb_code;
		this.ri_id = ri_id;
		this.tb_returnApplicationDate = tb_returnApplicationDate;
		this.tb_status = tb_status;
		this.tb_returnCompletionDate = tb_returnCompletionDate;
		this.tb_errorNum = tb_errorNum;
		this.tb_notes = tb_notes;
		this.pr_name = pr_name;
		this.co_supplyPrice = co_supplyPrice;
		this.ri_totalPrice = ri_totalPrice;
		this.st_name = st_name;
		this.pa_name = pa_name;
		this.pa_manager = pa_manager;
		this.pa_address = pa_address;
	}

	public String getTb_code() {
		return tb_code;
	}

	public void setTb_code(String tb_code) {
		this.tb_code = tb_code;
	}

	public int getRi_id() {
		return ri_id;
	}

	public void setRi_id(int ri_id) {
		this.ri_id = ri_id;
	}

	public Timestamp getTb_returnApplicationDate() {
		return tb_returnApplicationDate;
	}

	public void setTb_returnApplicationDate(Timestamp tb_returnApplicationDate) {
		this.tb_returnApplicationDate = tb_returnApplicationDate;
	}

	public String getTb_status() {
		return tb_status;
	}

	public void setTb_status(String tb_status) {
		this.tb_status = tb_status;
	}

	public Timestamp getTb_returnCompletionDate() {
		return tb_returnCompletionDate;
	}

	public void setTb_returnCompletionDate(Timestamp tb_returnCompletionDate) {
		this.tb_returnCompletionDate = tb_returnCompletionDate;
	}

	public int getTb_errorNum() {
		return tb_errorNum;
	}

	public void setTb_errorNum(int tb_errorNum) {
		this.tb_errorNum = tb_errorNum;
	}

	public String getTb_notes() {
		return tb_notes;
	}

	public void setTb_notes(String tb_notes) {
		this.tb_notes = tb_notes;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getCo_supplyPrice() {
		return co_supplyPrice;
	}

	public void setCo_supplyPrice(int co_supplyPrice) {
		this.co_supplyPrice = co_supplyPrice;
	}

	public int getRi_totalPrice() {
		return ri_totalPrice;
	}

	public void setRi_totalPrice(int ri_totalPrice) {
		this.ri_totalPrice = ri_totalPrice;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
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

	public String getPa_address() {
		return pa_address;
	}

	public void setPa_address(String pa_address) {
		this.pa_address = pa_address;
	}

	@Override
	public String toString() {
		return "TakeBackDTO [tb_code=" + tb_code + ", ri_id=" + ri_id + ", tb_returnApplicationDate="
				+ tb_returnApplicationDate + ", tb_status=" + tb_status + ", tb_returnCompletionDate="
				+ tb_returnCompletionDate + ", tb_errorNum=" + tb_errorNum + ", tb_notes=" + tb_notes + ", pr_name="
				+ pr_name + ", co_supplyPrice=" + co_supplyPrice + ", ri_totalPrice=" + ri_totalPrice + ", st_name="
				+ st_name + ", pa_name=" + pa_name + ", pa_manager=" + pa_manager + ", pa_address=" + pa_address + "]";
	}

	
}
