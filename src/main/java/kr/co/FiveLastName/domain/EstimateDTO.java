package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class EstimateDTO {
	
	int es_id;
	int pa_id; 
	int pr_id; 
	Timestamp es_publicationDate;
	int es_supplyPrice; 
	Timestamp es_requiredDays;
	
	public EstimateDTO() {
		super();
	}
	
	public EstimateDTO(int es_id, int pa_id, int pr_id, Timestamp es_publicationDate, int es_supplyPrice,
			Timestamp es_requiredDays) {
		super();
		this.es_id = es_id;
		this.pa_id = pa_id;
		this.pr_id = pr_id;
		this.es_publicationDate = es_publicationDate;
		this.es_supplyPrice = es_supplyPrice;
		this.es_requiredDays = es_requiredDays;
	}

	public int getEs_id() {
		return es_id;
	}
	public void setEs_id(int es_id) {
		this.es_id = es_id;
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
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public Timestamp getEs_publicationDate() {
		return es_publicationDate;
	}
	public void setEs_publicationDate(Timestamp es_publicationDate) {
		this.es_publicationDate = es_publicationDate;
	}
	public int getEs_supplyPrice() {
		return es_supplyPrice;
	}
	public void setEs_supplyPrice(int es_supplyPrice) {
		this.es_supplyPrice = es_supplyPrice;
	}
	public Timestamp getEs_requiredDays() {
		return es_requiredDays;
	}
	public void setEs_requiredDays(Timestamp es_requiredDays) {
		this.es_requiredDays = es_requiredDays;
	}
	
	@Override
	public String toString() {
		return "EstimateDTO [es_id=" + es_id + ", pa_id=" + pa_id + ", pr_id=" + pr_id + ", es_publicationDate="
				+ es_publicationDate + ", es_supplyPrice=" + es_supplyPrice + ", es_requiredDays=" + es_requiredDays
				+ "]";
	}
	
	
	
}
