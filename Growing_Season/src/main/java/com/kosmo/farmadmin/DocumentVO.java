package com.kosmo.farmadmin;

import org.springframework.web.multipart.MultipartFile;

public class DocumentVO {
	
	private int dseq;
	private int apseq;
	private int mseq;
	private String dname;
	private String dregdate;
	private String docureturn;
	private String dreturncause;
	private String dreturndate;
	private MultipartFile ufile;
	private String dfilename;
	private String dfilpath;
	private long dfilesize;
	
	public String getDocureturn() {
		return docureturn;
	}
	public void setDocureturn(String docureturn) {
		this.docureturn = docureturn;
	}
	public String getDreturncause() {
		return dreturncause;
	}
	public void setDreturncause(String dreturncause) {
		this.dreturncause = dreturncause;
	}
	public String getDreturndate() {
		return dreturndate;
	}
	public void setDreturndate(String dreturndate) {
		this.dreturndate = dreturndate;
	}
	public String getDfilename() {
		return dfilename;
	}
	public void setDfilename(String dfilename) {
		this.dfilename = dfilename;
	}
	public String getDfilpath() {
		return dfilpath;
	}
	public void setDfilpath(String dfilpath) {
		this.dfilpath = dfilpath;
	}
	public long getDfilesize() {
		return dfilesize;
	}
	public void setDfilesize(long dfilesize) {
		this.dfilesize = dfilesize;
	}
	public int getDseq() {
		return dseq;
	}
	public void setDseq(int dseq) {
		this.dseq = dseq;
	}
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
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDregdate() {
		return dregdate;
	}
	public void setDregdate(String dregdate) {
		this.dregdate = dregdate;
	}
	public MultipartFile getUfile() {
		return ufile;
	}
	public void setUfile(MultipartFile ufile) {
		this.ufile = ufile;
	}

}
	

