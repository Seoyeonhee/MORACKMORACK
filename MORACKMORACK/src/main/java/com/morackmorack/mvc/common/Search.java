package com.morackmorack.mvc.common;

public class Search {
	private String searchType;
	private String searchCondition;
	private String searchKeyword;
	private int currentPage;
	private int pageSize;
	private int startRowNum;
	private int endRowNum;
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", currentPage=" + currentPage + ", pageSize=" + pageSize + ", startRowNum="
				+ startRowNum + ", endRowNum=" + endRowNum + "]";
	}
	
}
