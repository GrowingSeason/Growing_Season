package com.kosmo.sns;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class SnsFeedVO {

	private int mseq;
	private int fmseq;
	private String fmid;
	
	
	private int feseq;
	private String fecon;
	private String feregdate;
	private String ferange;
	private String fedelete;
	private int htseq;
	private String htcon;
	private String searchStr;
	private int sseq;
	private int eseq;
	private String feimgname;
	private ArrayList<SnsImgVO> iList;
	
	
	public int getFmseq() {
		return fmseq;
	}
	public void setFmseq(int fmseq) {
		this.fmseq = fmseq;
	}
	public String getFmid() {
		return fmid;
	}
	public void setFmid(String fmid) {
		this.fmid = fmid;
	}
	public String getFeimgname() {
		return feimgname;
	}
	public void setFeimgname(String feimgname) {
		this.feimgname = feimgname;
	}
	
	
	public String getFeimgname() {
		return feimgname;
	}
	public void setFeimgname(String feimgname) {
		this.feimgname = feimgname;
	}
	public ArrayList<SnsImgVO> getiList() {
		return iList;
	}
	public void setiList(ArrayList<SnsImgVO> iList) {
		this.iList = iList;
	}
	public int getSseq() {
		return sseq;
	}
	public void setSseq(int sseq) {
		this.sseq = sseq;
	}
	public int getEseq() {
		return eseq;
	}
	public void setEseq(int eseq) {
		this.eseq = eseq;
	}
	public String getSearchStr() {
		return searchStr;
	}
	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}
	public int getFeseq() {
		return feseq;
	}
	public void setFeseq(int feseq) {
		this.feseq = feseq;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public String getFecon() {
		return fecon;
	}
	public void setFecon(String fecon) {
		this.fecon = fecon;
	}
	public String getFeregdate() {
		return feregdate;
	}
	public void setFeregdate(String feregdate) {
		this.feregdate = feregdate;
	}
	public String getFerange() {
		return ferange;
	}
	public void setFerange(String ferange) {
		this.ferange = ferange;
	}
	public String getFedelete() {
		return fedelete;
	}
	public void setFedelete(String fedelete) {
		this.fedelete = fedelete;
	}
	
	public int getHtseq() {
		return htseq;
	}
	public void setHtseq(int htseq) {
		this.htseq = htseq;
	}
	public String getHtcon() {
		return htcon;
	}
	public void setHtcon(String htcon) {
		this.htcon = htcon;
	}

	
}
