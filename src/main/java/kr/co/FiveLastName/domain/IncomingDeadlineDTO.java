package kr.co.FiveLastName.domain;

public class IncomingDeadlineDTO {
	
	String id_code;
	int ri_id;
	int id_genuineNum;
	int id_totalPirce;
	
	public IncomingDeadlineDTO() {
		super();
	}

	public IncomingDeadlineDTO(String id_code, int ri_id, int id_genuineNum, int id_totalPirce) {
		super();
		this.id_code = id_code;
		this.ri_id = ri_id;
		this.id_genuineNum = id_genuineNum;
		this.id_totalPirce = id_totalPirce;
	}

	public String getId_code() {
		return id_code;
	}

	public void setId_code(String id_code) {
		this.id_code = id_code;
	}

	public int getRi_id() {
		return ri_id;
	}

	public void setRi_id(int ri_id) {
		this.ri_id = ri_id;
	}

	public int getId_genuineNum() {
		return id_genuineNum;
	}

	public void setId_genuineNum(int id_genuineNum) {
		this.id_genuineNum = id_genuineNum;
	}

	public int getId_totalPirce() {
		return id_totalPirce;
	}

	public void setId_totalPirce(int id_totalPirce) {
		this.id_totalPirce = id_totalPirce;
	}

	@Override
	public String toString() {
		return "IncomingDeadlineDTO [id_code=" + id_code + ", ri_id=" + ri_id + ", id_genuineNum=" + id_genuineNum
				+ ", id_totalPirce=" + id_totalPirce + "]";
	}
	
	
	
}
