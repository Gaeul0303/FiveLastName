package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ProcurmentPlanDTO {

	int pp_id;
	int pr_id;
	String pp_materialRequiredProcessStage;
	int pp_makeTime;
	int pp_spendAmount;
	Timestamp pp_regDate;
	Timestamp pp_deliveryDate;
	
	public ProcurmentPlanDTO() {}
	
	public ProcurmentPlanDTO(int pr_id, String pp_materialRequiredProcessStage, int pp_makeTime,
			int pp_spendAmount, Timestamp pp_regDate, Timestamp pp_deliveryDate) {
		super();
		
		this.pr_id = pr_id;
		this.pp_materialRequiredProcessStage = pp_materialRequiredProcessStage;
		this.pp_makeTime = pp_makeTime;
		this.pp_spendAmount = pp_spendAmount;
		this.pp_regDate = pp_regDate;
		this.pp_deliveryDate = pp_deliveryDate;
	}
	
	public ProcurmentPlanDTO(int pp_id, int pr_id, String pp_materialRequiredProcessStage, int pp_makeTime,
			int pp_spendAmount, Timestamp pp_regDate, Timestamp pp_deliveryDate) {
		super();
		this.pp_id = pp_id;
		this.pr_id = pr_id;
		this.pp_materialRequiredProcessStage = pp_materialRequiredProcessStage;
		this.pp_makeTime = pp_makeTime;
		this.pp_spendAmount = pp_spendAmount;
		this.pp_regDate = pp_regDate;
		this.pp_deliveryDate = pp_deliveryDate;
	}

	public int getPp_id() {
		return pp_id;
	}

	public void setPp_id(int pp_id) {
		this.pp_id = pp_id;
	}

	public int getPr_id() {
		return pr_id;
	}

	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}

	public String getPp_materialRequiredProcessStage() {
		return pp_materialRequiredProcessStage;
	}

	public void setPp_materialRequiredProcessStage(String pp_materialRequiredProcessStage) {
		this.pp_materialRequiredProcessStage = pp_materialRequiredProcessStage;
	}

	public int getPp_makeTime() {
		return pp_makeTime;
	}

	public void setPp_makeTime(int pp_makeTime) {
		this.pp_makeTime = pp_makeTime;
	}

	public int getPp_spendAmount() {
		return pp_spendAmount;
	}

	public void setPp_spendAmount(int pp_spendAmount) {
		this.pp_spendAmount = pp_spendAmount;
	}

	public Timestamp getPp_regDate() {
		return pp_regDate;
	}

	public void setPp_regDate(Timestamp pp_regDate) {
		this.pp_regDate = pp_regDate;
	}

	public Timestamp getPp_deliveryDate() {
		return pp_deliveryDate;
	}

	public void setPp_deliveryDate(Timestamp pp_deliveryDate) {
		this.pp_deliveryDate = pp_deliveryDate;
	}
	
	@Override
	public String toString() {
		return "ProcurmentPlanDTO [pp_id=" + pp_id + ", pr_id=" + pr_id + ", pp_materialRequiredProcessStage="
				+ pp_materialRequiredProcessStage + ", pp_makeTime=" + pp_makeTime + ", pp_spendAmount="
				+ pp_spendAmount + ", pp_regDate=" + pp_regDate + ", pp_deliveryDate=" + pp_deliveryDate + "]";
	}

}
