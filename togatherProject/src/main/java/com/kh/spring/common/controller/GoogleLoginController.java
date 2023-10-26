package com.kh.spring.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.jam.JamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.common.model.vo.GoogleInfResponse;
import com.kh.spring.common.model.vo.GoogleRequest;
import com.kh.spring.common.model.vo.GoogleResponse;
import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;

@Controller
public class GoogleLoginController {
    @Value("43410666342-s8gt5o9p3qm69cb2h4ms0m5pqqhh2re5.apps.googleusercontent.com")
    private String googleClientId;
    @Value("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")
    private String googleClientPw;
    @Autowired
    private MemberServiceImpl mService ;

//    @RequestMapping(value="/api/v1/oauth2/google", method = RequestMethod.POST)
//    public String loginUrlGoogle(){
//    	System.out.println("어서오고");
//        String reqUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + googleClientId
//                + "&redirect_uri=http://localhost:8012/api/v1/oauth2/google&response_type=code&scope=email%20profile%20openid&access_type=offline";
//        return reqUrl;
//    }
    
    
    @RequestMapping("/google")
    public String loginGoogle(@RequestParam(value = "code") String authCode, HttpSession session , HttpServletRequest request){
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
        
    
        //먼저 DB에 등록이 되어있나 체크를 해보자
        int result = mService.idCheck(email);
        
        //등록이 안되어 있으면 회원가입
        if (result == 0) {
        	//이미지를 DB에 넣을필요가 없겠는데 이거자체가 파일패스가 되는거잖아
        	Member m = new Member();
        	m.setMemId(email);//아이디에 이메일 넣고
        	m.setImg(img); // 이미지는 여기서 주는 주소값을 넣고
        	m.setMemName(name);
        	m.setMemPwd("googlePwd");
        	m.setNickName(email);
        	int result2 = mService.insertMember(m);//db에 넣어보자 어케되나
        	//넣었으면 이거 가지고 chooseInterest로 가보자 chooseInterest 는 memNo 가 필요하니까
        	String memNo = mService.bringMemNo(m);
        	request.setAttribute("memNo", memNo);//chooseInterest 에 있는 form 은 memNo 가 필요해용 줍시다
        	session.setAttribute("alertMsg", "처음오셨네요? 취향을 알려주세요");
        	return "member/chooseInterest";
        }else {//여긴 이미가입되어있는거니까 바로 id값으로 맴버 찾고 세션에 넣어줍시다
        	Member m = new Member();
        	m.setMemId(email);
        	m.setMemPwd("googlePwd");
        	Member loginMember = mService.loginMember(m); //아디 비번주면 로그인이 되겠지?

            ArrayList<Member> clType = mService.selectClType(m);
            System.out.println("쏄탑 : " + clType);
            session.setAttribute("clType", clType);
            session.setAttribute("pImg", loginMember.getImg());
            session.setAttribute("loginMember", loginMember);
            session.setAttribute("alertMsg", name+ " 님 얼굴보니 반갑네요");
            return "redirect:/";

        }

    }
    
}
    

