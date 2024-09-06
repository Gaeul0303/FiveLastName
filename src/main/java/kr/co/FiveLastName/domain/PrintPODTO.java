package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class PrintPODTO {
	private int po_id;
	private String pr_name;
	private int co_supplyPrice;
	private int es_requiredDays;
	private String co_tradeTerms;
	private String pa_name;
	private Timestamp ppr_dueDate;
	private Timestamp po_regDate;
	private String pr_size;
	private Timestamp co_contractDate;
	private int ppr_quantity;
	private String po_status;
	private String pa_manager;
	private String pa_tel;
	private String pa_email;
	private int ppr_id;
	
	public PrintPODTO() {
		super();
	}

	public PrintPODTO(int po_id, String pr_name, int co_supplyPrice, int es_requiredDays, String co_tradeTerms,
			String pa_name, Timestamp ppr_dueDate, Timestamp po_regDate, String pr_size, Timestamp co_contractDate,
			int ppr_quantity, String po_status, String pa_manager, String pa_tel, String pa_email, int ppr_id) {
		super();
		this.po_id = po_id;
		this.pr_name = pr_name;
		this.co_supplyPrice = co_supplyPrice;
		this.es_requiredDays = es_requiredDays;
		this.co_tradeTerms = co_tradeTerms;
		this.pa_name = pa_name;
		this.ppr_dueDate = ppr_dueDate;
		this.po_regDate = po_regDate;
		this.pr_size = pr_size;
		this.co_contractDate = co_contractDate;
		this.ppr_quantity = ppr_quantity;
		this.po_status = po_status;
		this.pa_manager = pa_manager;
		this.pa_tel = pa_tel;
		this.pa_email = pa_email;
		this.ppr_id = ppr_id;
	}

	public int getPo_id() {
		return po_id;
	}

	public void setPo_id(int po_id) {
		this.po_id = po_id;
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

	public int getEs_requiredDays() {
		return es_requiredDays;
	}

	public void setEs_requiredDays(int es_requiredDays) {
		this.es_requiredDays = es_requiredDays;
	}

	public String getCo_tradeTerms() {
		return co_tradeTerms;
	}

	public void setCo_tradeTerms(String co_tradeTerms) {
		this.co_tradeTerms = co_tradeTerms;
	}

	public String getPa_name() {
		return pa_name;
	}

	public void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}

	public Timestamp getPpr_dueDate() {
		return ppr_dueDate;
	}

	public void setPpr_dueDate(Timestamp ppr_dueDate) {
		this.ppr_dueDate = ppr_dueDate;
	}

	public Timestamp getPo_regDate() {
		return po_regDate;
	}

	public void setPo_regDate(Timestamp po_regDate) {
		this.po_regDate = po_regDate;
	}

	public String getPr_size() {
		return pr_size;
	}

	public void setPr_size(String pr_size) {
		this.pr_size = pr_size;
	}

	public Timestamp getCo_contractDate() {
		return co_contractDate;
	}

	public void setCo_contractDate(Timestamp co_contractDate) {
		this.co_contractDate = co_contractDate;
	}

	public int getPpr_quantity() {
		return ppr_quantity;
	}

	public void setPpr_quantity(int ppr_quantity) {
		this.ppr_quantity = ppr_quantity;
	}

	public String getPo_status() {
		return po_status;
	}

	public void setPo_status(String po_status) {
		this.po_status = po_status;
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

	

	public int getPpr_id() {
		return ppr_id;
	}

	public void setPpr_id(int ppr_id) {
		this.ppr_id = ppr_id;
	}

	@Override
	public String toString() {
		return "PrintPODTO [po_id=" + po_id + ", pr_name=" + pr_name + ", co_supplyPrice=" + co_supplyPrice
				+ ", es_requiredDays=" + es_requiredDays + ", co_tradeTerms=" + co_tradeTerms + ", pa_name=" + pa_name
				+ ", ppr_dueDate=" + ppr_dueDate + ", po_regDate=" + po_regDate + ", pr_size=" + pr_size
				+ ", co_contractDate=" + co_contractDate + ", ppr_quantity=" + ppr_quantity + ", po_status=" + po_status
				+ ", pa_manager=" + pa_manager + ", pa_tel=" + pa_tel + ", pa_email=" + pa_email + ", ppr_id=" + ppr_id
				+ "]";
	}

}
