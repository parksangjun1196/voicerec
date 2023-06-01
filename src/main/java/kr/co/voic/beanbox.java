package kr.co.voic;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartResolver;

@Component
public class beanbox {
	
	
	@Bean
	public MultipartResolver multipartResolver(){
	    org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new 
	    org.springframework.web.multipart.commons.CommonsMultipartResolver();
	    
	    multipartResolver.setMaxUploadSize(10485760); //1024 * 1024 * 10 (최대 10MB)
	    return multipartResolver;
	}
	

}
