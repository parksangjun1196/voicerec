package kr.co.voic;


import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.cloud.language.v1.AnalyzeEntitiesRequest;
import com.google.cloud.language.v1.AnalyzeEntitiesResponse;
import com.google.cloud.language.v1.AnalyzeSentimentResponse;
import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.EncodingType;
import com.google.cloud.language.v1.Entity;
import com.google.cloud.language.v1.EntityMention;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.Sentiment;


@Controller
public class HomeController {

	@GetMapping("/voicepage.do") 
	public String voicepage2(HttpSession sess) {
		System.out.println("voiepagecall");
		

		String address = "";
		sess.setAttribute("address", address);
		return "voice2";
	
	}
	@ResponseBody
	@RequestMapping(value = "/api/v1/*", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String handleApiRequests(HttpServletRequest req) throws IOException {
	    String path = req.getRequestURI(); // 요청 경로를 가져옴

	    if (path.equals("/voice/api/v1/voiceinsert")) {
	        String texts = req.getParameter("texts");
	        System.out.println("transscript" + texts);

	        String rsttext = "";

	        try (LanguageServiceClient language = LanguageServiceClient.create()) {
	            Document doc = Document.newBuilder().setContent(texts).setType(Type.PLAIN_TEXT).build();
	            AnalyzeEntitiesRequest request =
	                    AnalyzeEntitiesRequest.newBuilder()
	                            .setDocument(doc)
	                            .setEncodingType(EncodingType.UTF16)
	                            .build();

	            AnalyzeEntitiesResponse response = language.analyzeEntities(request);

	            // Print the response
	            for (Entity entity : response.getEntitiesList()) {
	                System.out.printf("Entity: %s", entity.getName());
	                System.out.printf("Salience: %.3f\n", entity.getSalience());
	                System.out.println("Metadata: ");

	                System.out.println("value test :: " + entity.getTypeValue());
	                System.out.println("type test :: " + entity.getType());

	                if (entity.getType() == Entity.Type.LOCATION || entity.getType() == Entity.Type.ADDRESS ||entity.getType() == Entity.Type.ORGANIZATION) {
	                    rsttext += entity.getName() + " ";
	                }

	                for (Map.Entry<String, String> entry : entity.getMetadataMap().entrySet()) {
	                    System.out.printf("%s : %s", entry.getKey(), entry.getValue());
	                }
	                for (EntityMention mention : entity.getMentionsList()) {
	                    System.out.printf("Begin offset: %d\n", mention.getText().getBeginOffset());
	                    System.out.printf("Content: %s\n", mention.getText().getContent());
	                    System.out.printf("Type: %s\n\n", mention.getType());
	                }
	            }
	        }

	        System.out.println("final ans : " + rsttext);
			return rsttext;
	    } else if (path.equals("/voice/api/v1/voiceYN")) {
	    	
	    	System.out.println("thisis 예아니오 콜");
	        String texts = req.getParameter("texts");
	        System.out.println("transscript" + texts);
	        String rsttext = "false";

	        // Instantiate the Language client com.google.cloud.language.v1.LanguageServiceClient
	        try (LanguageServiceClient language = LanguageServiceClient.create()) {
	            Document doc = Document.newBuilder().setContent(texts).setType(Type.PLAIN_TEXT).build();
	            AnalyzeSentimentResponse response = language.analyzeSentiment(doc);
	            Sentiment sentiment = response.getDocumentSentiment();
	            if (sentiment == null) {
	                System.out.println("No sentiment found");
	            } else {
	                System.out.printf("Sentiment magnitude: %.3f\n", sentiment.getMagnitude());
	                System.out.printf("Sentiment score: %.3f\n", sentiment.getScore());
	                if (sentiment.getScore() >= 0.4) {
	                	rsttext = "true";
	                	return rsttext;
	                }
	                else {
	                	rsttext = "false"; 
						/*
						 * rsttext = "true"; // test용임시
						 */						 	                	
	                	return rsttext;
	                }
	            }
	        }

	       
	    }

	    return "";
	}



	
}
