package com.kdt.finalproject.util;

import java.io.File;

public class FileRenameUtil {

	public static String checkFileName(String fileName, String path) {
		// 인자인 fileName에서 확장자를 뺀 파일명 얻어내자
		// 우선 "."의 위치를 알아내자
		int period = fileName.lastIndexOf("."); // test123.txt ---> 7

		String f_name = fileName.substring(0, period); // 0번지부터 7번지 앞까지 잘라낸다. (test123)
		String suffix = fileName.substring(period); // 7번지부터 끝까지 (.txt)

		// 전체 경로
		String saveFileName = path + System.getProperty("file.separator") + fileName; // path + "/" + fileName;

		File f = new File(saveFileName);

		// 같은 이름이 있을 경우 파일명 뒤에 숫자를 붙여준다.
		int su = 1;
		while (f != null && f.exists()) {
			// 파일이 이미 존재하므로 이름을 변경하자
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);
			sb.append(su++); // 변경된 이름 또한 존재할 수 있기 때문에 su의 값을 1 증가
			sb.append(suffix);

			fileName = sb.toString(); // test1231.txt

			saveFileName = path + System.getProperty("file.separator") + fileName;

			f = new File(saveFileName);
		} // while문의 끝
		return fileName;
	}
}
