package com.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "D:\\kwonyeji\\spring_project\\sns\\workspace\\images/";
	//public static final String FILE_UPLOAD_PATH = "C:\\Users\\dkahs\\OneDrive\\_MEGA\\work_ee\\spring_project\\sns\\workspace\\images/";
	
	public String saveFile(String userLoginId, MultipartFile file) {
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null;
		}
		
		// 파일 업로드
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		// 성공시 이미지 url path 리턴 (WebMvcConfig 에서 매핑한 이미지 path)
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
