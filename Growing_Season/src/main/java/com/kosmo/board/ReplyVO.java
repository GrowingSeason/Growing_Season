package com.kosmo.board;

import java.util.ArrayList;

public class ReplyVO {
	private String mid;
	private int rseq;
	private int bseq;
	private int mseq;
	private String rcon;
	private String rregdate;
	private String rdelete;
	private int sseq;
	private int eseq;
	
	
	private int rdmseq;
	private String rdreason;
	private String rdregdate;
	private ArrayList<RDeclarationVO> rDeclarationList;
	
	
	
	public int getRdmseq() {
		return rdmseq;
	}
	public void setRdmseq(int rdmseq) {
		this.rdmseq = rdmseq;
	}
	public String getRdreason() {
		return rdreason;
	}
	public void setRdreason(String rdreason) {
		this.rdreason = rdreason;
	}
	public String getRdregdate() {
		return rdregdate;
	}
	public void setRdregdate(String rdregdate) {
		this.rdregdate = rdregdate;
	}
	public ArrayList<RDeclarationVO> getrDeclarationList() {
		return rDeclarationList;
	}
	public void setrDeclarationList(ArrayList<RDeclarationVO> rDeclarationList) {
		this.rDeclarationList = rDeclarationList;
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
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
	public String getRcon() {
		return rcon;
	}
	public void setRcon(String rcon) {
		this.rcon = rcon;
	}
	public String getRregdate() {
		return rregdate;
	}
	public void setRregdate(String rregdate) {
		this.rregdate = rregdate;
	}
	public String getRdelete() {
		return rdelete;
	}
	public void setRdelete(String rdelete) {
		this.rdelete = rdelete;
	}
	
}
