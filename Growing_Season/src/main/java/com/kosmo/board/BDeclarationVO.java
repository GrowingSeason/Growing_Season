package com.kosmo.board;

public class BDeclarationVO {
	private int bseq;
	private String bdreason;
	private String bdregdate;
	private int bdmseq;
	private String bdmid;
	
	public String getBdmid() {
		return bdmid;
	}
	public void setBdmid(String bdmid) {
		this.bdmid = bdmid;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getBdreason() {
		return bdreason;
	}
	public void setBdreason(String bdreason) {
		this.bdreason = bdreason;
	}
	public String getBdregdate() {
		return bdregdate;
	}
	public void setBdregdate(String bdregdate) {
		this.bdregdate = bdregdate;
	}
	public int getBdmseq() {
		return bdmseq;
	}
	public void setBdmseq(int bdmseq) {
		this.bdmseq = bdmseq;
	}
}
