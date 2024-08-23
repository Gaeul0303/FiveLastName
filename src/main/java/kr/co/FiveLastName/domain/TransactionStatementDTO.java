package kr.co.FiveLastName.domain;

public class TransactionStatementDTO {
	String ts_num;
	String id_code;
	String ts_checkIn;
	
	public TransactionStatementDTO() {
		super();
	}
	
	public TransactionStatementDTO(String ts_num, String id_code, String ts_checkIn) {
		super();
		this.ts_num = ts_num;
		this.id_code = id_code;
		this.ts_checkIn = ts_checkIn;
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
	
	@Override
	public String toString() {
		return "TransactionStatementDTO [ts_num=" + ts_num + ", id_code=" + id_code + ", ts_checkIn=" + ts_checkIn
				+ "]";
	}
	
	
	
}
