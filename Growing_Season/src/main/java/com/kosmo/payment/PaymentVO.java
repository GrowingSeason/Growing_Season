package com.kosmo.payment;

public class PaymentVO {
	private int pseq;
	private int mseq;
	private int apseq;
	private String pregdate;
	private int pprice;
	private String ppermit;
	
	
	private String pcode;
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public int getApseq() {
		return apseq;
	}
	public void setApseq(int apseq) {
		this.apseq = apseq;
	}
	public String getPregdate() {
		return pregdate;
	}
	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPpermit() {
		return ppermit;
	}
	public void setPpermit(String ppermit) {
		this.ppermit = ppermit;
	}
}
