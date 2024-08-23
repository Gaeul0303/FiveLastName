package kr.co.FiveLastName.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		
		if(page<=0) {
			this.page = 1;
			System.out.println("====== setPage 입니다 ======");
			System.out.println("page : " + page);
			System.out.println("==========================");
			return;
		}
		this.page = page;
		System.out.println("====== setPerPage 입니다 ======");
		System.out.println("page : " + page);
		System.out.println("==============================");
	}
	
	// method for myBatis SQL Mapper -
	public int getPerPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum<=0 || perPageNum >100) {
			this.perPageNum = 10;
			System.out.println("====== setPerPageNum 입니다 ======");
			System.out.println("perPageNum : " + perPageNum);
			System.out.println("================================");
			return;
		}
		System.out.println("====== setPerPageNum 입니다 ======");
		System.out.println("perPageNum : " + perPageNum);
		System.out.println("================================");
		this.perPageNum = perPageNum;
	}
	
	// method for myBatis SQL Mapper -
	public int getPerPageNum() {
		return this.perPageNum;
	}
	

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
}
