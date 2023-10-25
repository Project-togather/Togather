package com.kh.spring.common.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kh.spring.common.model.vo.GoogleInfResponse;
import com.kh.spring.common.model.vo.GoogleRequest;
import com.kh.spring.common.model.vo.GoogleResponse;

@Controller
public class GoogleLoginController {
    @Value("43410666342-s8gt5o9p3qm69cb2h4ms0m5pqqhh2re5.apps.googleusercontent.com")
    private String googleClientId;
    @Value("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")
    private String googleClientPw;

//    @RequestMapping(value="/api/v1/oauth2/google", method = RequestMethod.POST)
//    public String loginUrlGoogle(){
//    	System.out.println("어서오고");
//        String reqUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + googleClientId
//                + "&redirect_uri=http://localhost:8012/api/v1/oauth2/google&response_type=code&scope=email%20profile%20openid&access_type=offline";
//        return reqUrl;
//    }
    
    
    @RequestMapping("/google")
    public String loginGoogle(@RequestParam(value = "code") String authCode){
    	System.out.println("되나?");
        RestTemplate restTemplate = new RestTemplate();
        GoogleRequest googleOAuthRequestParam = GoogleRequest
                .builder()
                .clientId(googleClientId)
                .clientSecret(googleClientPw)
                .code(authCode)
                .redirectUri("http://localhost:8012/spring/google")
                .grantType("authorization_code").build();
        ResponseEntity<GoogleResponse> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token",
                googleOAuthRequestParam, GoogleResponse.class);
        String jwtToken=resultEntity.getBody().getId_token();
        Map<String, String> map=new HashMap();
        map.put("id_token",jwtToken);
        ResponseEntity<GoogleInfResponse> resultEntity2 = restTemplate.postForEntity("https://oauth2.googleapis.com/tokeninfo",
                map, GoogleInfResponse.class);
        String email=resultEntity2.getBody().getEmail();
        String name=resultEntity2.getBody().getName();  
        String img=resultEntity2.getBody().getPicture();
        
        System.out.println(name);
        System.out.println(img);
        System.out.println("google로그인" + email);
        return "redirect:/";
    }
    
    
}
    

