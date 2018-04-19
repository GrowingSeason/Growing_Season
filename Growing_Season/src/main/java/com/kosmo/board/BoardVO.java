package com.kosmo.board;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO { //extends BDeclarationVO {
	
	private MultipartFile ufile;
	private String mid;
	private int bseq;
	private int mseq;
	private int btseq;
	private String btitle;
	private String bcon;
	private String bemail;
	private String bfilepath;
	private String bfilename;
	private long bfilesize;
	private String bregdate;
	private String bdelete;
	private String mgubun;
	
	
	
	private int bdmseq;
	private String bdreason;
	private String bdregdate;
	private ArrayList<BDeclarationVO> bDeclarationList;

	
	public int getBdmseq() {
		return bdmseq;
	}
	public void setBdmseq(int bdmseq) {
		this.bdmseq = bdmseq;
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
	public ArrayList<BDeclarationVO> getbDeclarationList() {
		return bDeclarationList;
	}
	public void setbDeclarationList(ArrayList<BDeclarationVO> bDeclarationList) {
		this.bDeclarationList = bDeclarationList;
	}
	public String getMgubun() {
		return mgubun;
	}
	public void setMgubun(String mgubun) {
		this.mgubun = mgubun;
	}
	public MultipartFile getUfile() {
		return ufile;
	}
	public void setUfile(MultipartFile ufile) {
		this.ufile = ufile;
	}
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public int getBtseq() {
		return btseq;
	}
	public void setBtseq(int btseq) {
		this.btseq = btseq;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcon() {
		return bcon;
	}
	public void setBcon(String bcon) {
		this.bcon = bcon;
	}
	public String getBemail() {
		return bemail;
	}
	public void setBemail(String bemail) {
		this.bemail = bemail;
	}
	public String getBfilepath() {
		return bfilepath;
	}
	public void setBfilepath(String bfilepath) {
		this.bfilepath = bfilepath;
	}
	public String getBfilename() {
		return bfilename;
	}
	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}
	public long getBfilesize() {
		return bfilesize;
	}
	public void setBfilesize(long l) {
		this.bfilesize = l;
	}
	public String getBregdate() {
		return bregdate;
	}
	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}
	public String getBdelete() {
		return bdelete;
	}
	public void setBdelete(String bdelete) {
		this.bdelete = bdelete;
	}
}
