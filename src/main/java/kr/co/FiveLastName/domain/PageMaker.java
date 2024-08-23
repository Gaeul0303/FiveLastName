package kr.co.FiveLastName.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	

	private int totalCount;	// 총 페이지수
	private int startPage; // 시작페이지
	private int endPage; // 끝 페이지
	private boolean prev; // 이전
	private boolean next; // 다음
	
	// 화면에 보여지는 페이지 번호의 숫자를 의미.
	private int displayPageNum = 10;
	
	
	private Criteria cri; // page와 perPageNum 구하는 클래스
	
	public PageMaker() {
		super();
	}

	public PageMaker(int totalCount, int startPage, int endPage, boolean prev, boolean next, int displayPageNum,
			Criteria cri) {
		super();
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.displayPageNum = displayPageNum;
		this.cri = cri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
		
	}
	
	private void calcData() {
		
		// 끝페이지 구하기
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum)*displayPageNum);
		
		// 시작페이지 구하기
		startPage = (endPage - displayPageNum) + 1;
		
		// 전체데이터의 개수/한번에 보여지는 데이터의 수
		int tempEndPage = (int)(Math.ceil(totalCount) / (double)cri.getPerPageNum());
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage*cri.getPerPageNum()>=totalCount? false : true;
		
	}
	
	public String makeQuery(int page) {
		
		UriComponents uriComponents = 
					UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.build();
		return uriComponents.toUriString();
		
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	public String makeSearch(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).
				queryParam("perPageNum", cri.getPerPageNum()).queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword())).build();
		
		return uriComponents.toUriString();
	}
	
	public String encoding(String keyword) {
		
		if(keyword==null || keyword.trim().length()==0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
		
	}
	
}
