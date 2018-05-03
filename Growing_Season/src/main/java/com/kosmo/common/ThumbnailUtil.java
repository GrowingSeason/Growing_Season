package com.kosmo.common;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

public class ThumbnailUtil {


	public String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

		System.out.println("ddd:" + uploadPath + File.separator  + fileName);
		File f = new File(uploadPath + File.separator  + fileName);
		if(f.exists() == true) {
			if(f.canRead() == true) {
				System.out.println("읽음");
			}
			System.out.println("존재");
		} else {
			System.out.println("음다.");
		}
		
			
		// 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(f);
		// 100픽셀 단위의 썸네일 생성 
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// 썸네일의 이름을 생성(원본파일명에 'th_'를 붙임)
		String thumbnailName = uploadPath + path + File.separator + "th_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '\\');
	}

	// 아이콘 생성
	public String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		// 아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴
		// File.separatorChar : 디렉토리 구분자
		// 윈도우 \ , 유닉스(리눅스) /         
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '\\');
	}

}
