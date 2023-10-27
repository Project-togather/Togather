package com.kh.spring.common.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SubWayAPIController {
	
	
	@ResponseBody
	@RequestMapping(value = "subway.op" , produces = "application/json ; charset=UTF-8")
	public String subway(String station) throws IOException {
		String url ="http://swopenAPI.seoul.go.kr/api/subway/7a494d456d7768773637464b506e49/";
		url += "json";
		url += "/realtimeStationArrival/0/5/";
		url += URLEncoder.encode(station , "UTF-8"); 
		System.out.println(url);
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader( new InputStreamReader(urlConnection.getInputStream()));
		String responseText = "";
		String line ; 
		while ((line = br.readLine()) != null ) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
}
