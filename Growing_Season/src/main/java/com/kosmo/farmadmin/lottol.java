package com.kosmo.farmadmin;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

public class lottol {

	public static void main(String[] args) {
		
		
		HashSet<Integer> mmap = new HashSet<Integer>();
		
		for(; mmap.size()<500; ) {
			int rNum = (int)((Math.random() *1000)+1);
			mmap.add(rNum);
		}
		Iterator it = mmap.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println("사이즈"+ mmap.size());
	
	}


}
