package com.morackmorack.mvc.common;

public class Search {
	private int searchType;
	private int searchCondition;
	private String searchKeyword;
	private int searchWay;
	private int currentPage;
	private int pageSize;
	private int startRowNum;
	private int endRowNum;
	
	public int getSearchType() {
		return searchType;
	}
	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}
	public int getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(int searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getSearchWay() {
		return searchWay;
	}
	public void setSearchWay(int searchWay) {
		this.searchWay = searchWay;
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
}
