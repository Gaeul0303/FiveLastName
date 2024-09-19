package kr.co.FiveLastName.domain;

public class TransactionStatementDTO {
	private String ts_num;
	private String id_code;
	private String ts_checkIn;
	private String pr_name;
	private int id_genuineNum;
	private int co_supplyPrice;
	private int id_totalPrice;
	private String st_name;
	private String pr_size;
	
	public TransactionStatementDTO() {
		super();
	}

	public String getTs_num() {
		return ts_num;
	}

	public void setTs_num(String ts_num) {
		this.ts_num = ts_num;
	}

	public String getId_code() {
		return id_code;
	}

	public void setId_code(String id_code) {
		this.id_code = id_code;
	}

	public String getTs_checkIn() {
		return ts_checkIn;
	}

	public void setTs_checkIn(String ts_checkIn) {
		this.ts_checkIn = ts_checkIn;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getId_genuineNum() {
		return id_genuineNum;
	}

	public void setId_genuineNum(int id_genuineNum) {
		this.id_genuineNum = id_genuineNum;
	}

	public int getCo_supplyPrice() {
		return co_supplyPrice;
	}

	public void setCo_supplyPrice(int co_supplyPrice) {
		this.co_supplyPrice = co_supplyPrice;
	}

	public int getId_totalPrice() {
		return id_totalPrice;
	}

	public void setId_totalPrice(int id_totalPrice) {
		this.id_totalPrice = id_totalPrice;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getPr_size() {
		return pr_size;
	}

	public void setPr_size(String pr_size) {
		this.pr_size = pr_size;
	}

	@Override
	public String toString() {
		return "TransactionStatementDTO [ts_num=" + ts_num + ", id_code=" + id_code + ", ts_checkIn=" + ts_checkIn
				+ ", pr_name=" + pr_name + ", id_genuineNum=" + id_genuineNum + ", co_supplyPrice=" + co_supplyPrice
				+ ", id_totalPrice=" + id_totalPrice + ", st_name=" + st_name + ", pr_size=" + pr_size + "]";
	}

	
}
