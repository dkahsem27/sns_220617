package com.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	//public static final String FILE_UPLOAD_PATH = "D:\\kwonyeji\\spring_project\\sns\\workspace\\images/";
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\dkahs\\OneDrive\\_MEGA\\work_ee\\spring_project\\sns\\workspace\\images/";
	
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
	
	public void deleteFile(String imagePath) {
		// /images/ 구문 제거
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
		if (Files.exists(path)) {
			try {
				Files.delete(path); // 이미지 삭제
			} catch (IOException e) {
				log.error("[이미지 삭제] 이미지 삭제 실패  imagePath:{}", imagePath);
			}
		}
		
		// 디렉토리(폴더) 삭제
		path = path.getParent();
		if (Files.exists(path)) {
			try {
				Files.delete(path); // 디렉토리 삭제
			} catch (IOException e) {
				log.error("[이미지 삭제] 디렉토리 삭제 실패  imagePath:{}", imagePath);
			}
		}
	}
}
