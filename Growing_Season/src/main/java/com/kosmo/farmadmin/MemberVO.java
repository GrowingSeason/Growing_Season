package com.kosmo.farmadmin;

import java.util.ArrayList;

public class MemberVO {
	private int mseq;
	private String mid;
	private String mphone;
	private String mpw;
	private String mname;
	private String mbirth;
	private String memail;
	private String maddress;
	private String mgender;
	private String mmailreceive;
	private String mgubun;
	private String mwithdraw;
	private String mauth;
	private String mauthtoken;
	private String mregdate;
	private String profilname;
	private String profilpath;
	private String profilsize;
	
	private ApplyVO avo;
	private DocumentVO dvo;
	private FarmGardenVO fgvo;
	
	private int sseq;
	private int eseq;
	
	
	public FarmGardenVO getFgvo() {
		return fgvo;
	}
	public void setFgvo(FarmGardenVO fgvo) {
		this.fgvo = fgvo;
	}
	private ArrayList<DocumentVO> dvoList;
	
	public ArrayList<DocumentVO> getDvoList() {
		return dvoList;
	}
	public void setDvoList(ArrayList<DocumentVO> dvoList) {
		this.dvoList = dvoList;
	}
	public ApplyVO getAvo() {
		return avo;
	}
	public void setAvo(ApplyVO avo) {
		this.avo = avo;
	}
	public DocumentVO getDvo() {
		return dvo;
	}
	public void setDvo(DocumentVO dvo) {
		this.dvo = dvo;
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
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMmailreceive() {
		return mmailreceive;
	}
	public void setMmailreceive(String mmailreceive) {
		this.mmailreceive = mmailreceive;
	}
	public String getMgubun() {
		return mgubun;
	}
	public void setMgubun(String mgubun) {
		this.mgubun = mgubun;
	}
	public String getMwithdraw() {
		return mwithdraw;
	}
	public void setMwithdraw(String mwithdraw) {
		this.mwithdraw = mwithdraw;
	}
	public String getMauth() {
		return mauth;
	}
	public void setMauth(String mauth) {
		this.mauth = mauth;
	}
	public String getMauthtoken() {
		return mauthtoken;
	}
	public void setMauthtoken(String mauthtoken) {
		this.mauthtoken = mauthtoken;
	}
	public String getMregdate() {
		return mregdate;
	}
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}
	public String getProfilname() {
		return profilname;
	}
	public void setProfilname(String profilname) {
		this.profilname = profilname;
	}
	public String getProfilpath() {
		return profilpath;
	}
	public void setProfilpath(String profilpath) {
		this.profilpath = profilpath;
	}
	public String getProfilsize() {
		return profilsize;
	}
	public void setProfilsize(String profilsize) {
		this.profilsize = profilsize;
	}
	
	
}
