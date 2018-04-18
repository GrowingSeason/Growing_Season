package com.kosmo.garden;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class ApplyGardenVO {
	private int apseq; // applyseq
	private int mseq; // memberseq
	private int fgseq; // farmgardenseq
	private int aseq; // areaseq
	private String awinner;//당첨여부
	private String year; // 연도
	private String pdivision; // 결제구분 
	private String pcode; // 입금대기 // 입금완료 
	private String apname; // 이름
	private String apphone; // 전화번호
	private String apemail; // 이메일
	private String apbirth; // 생일
	private String apcancel; // 취소여부('N','Y')
	private String apdivision; // 텃밭 상세구분
	
	private ArrayList<DocumentVO> dlist; // 서류리스트
	
	
	public int getApseq() {
		return apseq;
	}
	public void setApseq(int apseq) {
		this.apseq = apseq;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public int getFgseq() {
		return fgseq;
	}
	public void setFgseq(int fgseq) {
		this.fgseq = fgseq;
	}
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getPdivision() {
		return pdivision;
	}
	public void setPdivision(String pdivision) {
		this.pdivision = pdivision;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getApname() {
		return apname;
	}
	public void setApname(String apname) {
		this.apname = apname;
	}
	public String getApphone() {
		return apphone;
	}
	public void setApphone(String apphone) {
		this.apphone = apphone;
	}
	public String getApemail() {
		return apemail;
	}
	public void setApemail(String apemail) {
		this.apemail = apemail;
	}
	public String getApbirth() {
		return apbirth;
	}
	public void setApbirth(String apbirth) {
		this.apbirth = apbirth;
	}
	public String getApcancel() {
		return apcancel;
	}
	public void setApcancel(String apcancel) {
		this.apcancel = apcancel;
	}
	public ArrayList<DocumentVO> getDlist() {
		return dlist;
	}
	public void setDlist(ArrayList<DocumentVO> dlist) {
		this.dlist = dlist;
	}
	public String getApdivision() {
		return apdivision;
	}
	public void setApdivision(String apdivision) {
		this.apdivision = apdivision;
	}
	public String getAwinner() {
		return awinner;
	}
	public void setAwinner(String awinner) {
		this.awinner = awinner;
	}
	
}
