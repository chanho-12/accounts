package com.test.Accounts.processBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

public class testProcessBuilder {

	public static void tpb() {
		
		String value = null;
			
		
		String command = "C:/ProgramData/Anaconda3/envs/TF-inter/python.exe";
		
		String arg = "C:/Users/User/Desktop/project3_workspace/ocr_project3/ocr_project3/tesseract_ocr.py";
		
		
			try {
				
				ProcessBuilder builder = new ProcessBuilder(command, arg);
				builder.redirectErrorStream(true);
				Process process = builder.start();
				int exitVal = process.waitFor();
				BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "euc-kr"));
				String line;
				
				//System.out.println(">>>  2" + br.readLine());
				while ((line = br.readLine()) != null) {
					System.out.println(">>>  " + line);
					value = line;
				}
				
				if(exitVal != 0) {
//					System.out.println("error on process");
					System.out.println(exitVal);
				}

				System.out.println("print");
				
				
			} catch(Exception e) {
				System.out.println(e);
			}
		
	}
}