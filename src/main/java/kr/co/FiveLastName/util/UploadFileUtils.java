package kr.co.FiveLastName.util;

import java.awt.image.BufferedImage;
import java.io.File;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import kr.co.FiveLastName.controller.ProductController;


public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	public static String uploadFile(String uploadPath,String originName,byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originName;
		
		String savadPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savadPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originName.substring(originName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savadPath, savedName);
			
		}else {
			uploadedFileName = makeIcon(uploadPath, savadPath, savedName);
			
		}
		
		
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath,String path, String fileName) {
		String iconName = uploadPath+ path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath,monthPath,datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		if (new File(uploadPath + paths[paths.length - 1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirpath = new File(uploadPath+path);
			
			if (!dirpath.exists()) {
				dirpath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath,String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath + path + File.separator+"s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile );
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
