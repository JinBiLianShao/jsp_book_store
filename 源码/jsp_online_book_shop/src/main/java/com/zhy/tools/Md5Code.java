package com.zhy.tools;

import java.security.MessageDigest;
import java.util.Base64;
public class Md5Code {

	public static String createMd5Code(String code) throws Exception {
		MessageDigest digest = MessageDigest.getInstance("MD5");
		byte[] b=digest.digest(code.getBytes());

		Base64.Encoder encoder = Base64.getEncoder();
		String result = encoder.encodeToString(b);
		return result;
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println(createMd5Code("admin"));
	}

}
