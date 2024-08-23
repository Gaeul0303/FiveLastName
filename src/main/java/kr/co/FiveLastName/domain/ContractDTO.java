package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ContractDTO {
	int co_id;
	int es_id;
	Timestamp co_contractDate;
	String co_tradeTerms;
	String co_contractStatus;
	int co_supplyPrice;
	
	public ContractDTO() {
		super();
	}
	
	public ContractDTO(int co_id, int es_id, Timestamp co_contractDate, String co_tradeTerms, String co_contractStatus,
			int co_supplyPrice) {
		super();
		this.co_id = co_id;
		this.es_id = es_id;
		this.co_contractDate = co_contractDate;
		this.co_tradeTerms = co_tradeTerms;
		this.co_contractStatus = co_contractStatus;
		this.co_supplyPrice = co_supplyPrice;
	}

	public int getCo_id() {
		return co_id;
	}

	public void setCo_id(int co_id) {
		this.co_id = co_id;
	}

	public int getEs_id() {
		return es_id;
	}

	public void setEs_id(int es_id) {
		this.es_id = es_id;
	}

	public Timestamp getCo_contractDate() {
		return co_contractDate;
	}

	public void setCo_contractDate(Timestamp co_contractDate) {
		this.co_contractDate = co_contractDate;
	}

	public String getCo_tradeTerms() {
		return co_tradeTerms;
	}

	public void setCo_tradeTerms(String co_tradeTerms) {
		this.co_tradeTerms = co_tradeTerms;
	}

	public String getCo_contractStatus() {
		return co_contractStatus;
	}

	public void setCo_contractStatus(String co_contractStatus) {
		this.co_contractStatus = co_contractStatus;
	}

	public int getCo_supplyPrice() {
		return co_supplyPrice;
	}

	public void setCo_supplyPrice(int co_supplyPrice) {
		this.co_supplyPrice = co_supplyPrice;
	}

	@Override
	public String toString() {
		return "ContractDTO [co_id=" + co_id + ", es_id=" + es_id + ", co_contractDate=" + co_contractDate
				+ ", co_tradeTerms=" + co_tradeTerms + ", co_contractStatus=" + co_contractStatus + ", co_supplyPrice="
				+ co_supplyPrice + "]";
	}
	
}
