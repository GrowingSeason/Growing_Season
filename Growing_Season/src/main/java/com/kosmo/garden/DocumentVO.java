package com.kosmo.garden;

import org.springframework.web.multipart.MultipartFile;

public class DocumentVO {
	
	private int dseq; 
	private int apseq; 
	private int mseq;
	private String dname;
	private String dregdate;
	private String docuReturn;
	private String dreturnCause;
	private String dreturnDate;
	private MultipartFile ufile;
	private String dfileName;
	private String dfilePath;
	private long dfileSize;
	
	
	public String getDfileName() {
		return dfileName;
	}
	public void setDfileName(String dfileName) {
		this.dfileName = dfileName;
	}
	public String getDfilePath() {
		return dfilePath;
	}
	public void setDfilePath(String dfilePath) {
		this.dfilePath = dfilePath;
	}
	public long getDfileSize() {
		return dfileSize;
	}
	public void setDfileSize(long dfileSize) {
		this.dfileSize = dfileSize;
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
	public String getDocuReturn() {
		return docuReturn;
	}
	public void setDocuReturn(String docuReturn) {
		this.docuReturn = docuReturn;
	}
	public String getDreturnCause() {
		return dreturnCause;
	}
	public void setDreturnCause(String dreturnCause) {
		this.dreturnCause = dreturnCause;
	}
	public String getDreturnDate() {
		return dreturnDate;
	}
	public void setDreturnDate(String dreturnDate) {
		this.dreturnDate = dreturnDate;
	}
	public MultipartFile getUfile() {
		return ufile;
	}
	public void setUfile(MultipartFile ufile) {
		this.ufile = ufile;
	}
	
	
	
}
