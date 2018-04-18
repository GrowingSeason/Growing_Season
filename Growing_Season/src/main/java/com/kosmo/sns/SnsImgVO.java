package com.kosmo.sns;

import org.springframework.web.multipart.MultipartFile;

public class SnsImgVO {

	private int feseq;
	private String feimgname;
	private String feimgpath;
	private long feimgsize;
	private MultipartFile ufile;
	
	public int getFeseq() {
		return feseq;
	}
	public void setFeseq(int feseq) {
		this.feseq = feseq;
	}
	public String getFeimgname() {
		return feimgname;
	}
	public void setFeimgname(String feimgname) {
		this.feimgname = feimgname;
	}
	public String getFeimgpath() {
		return feimgpath;
	}
	public void setFeimgpath(String feimgpath) {
		this.feimgpath = feimgpath;
	}
	public long getFeimgsize() {
		return feimgsize;
	}
	public void setFeimgsize(long feimgsize) {
		this.feimgsize = feimgsize;
	}
	public MultipartFile getUfile() {
		return ufile;
	}
	public void setUfile(MultipartFile ufile) {
		this.ufile = ufile;
	}
	
	
	
	
	
}
