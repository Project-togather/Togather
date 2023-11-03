package com.kh.spring.alarm.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.spring.alarm.model.service.NotificationServiceImpl;
import com.kh.spring.alarm.model.vo.Notification;

@RestController
@Controller
public class NotificationController {
	
	private final NotificationServiceImpl notificationserviceImpl;
	
	public NotificationController(NotificationServiceImpl notificationservieImpl) {
		this.notificationserviceImpl = notificationservieImpl;
	}
	
	/*
	@GetMapping(value = "/subscribe", produces = "text/event-stream")
	@ResponseStatus(HttpStatus.OK)
	public SseEmitter subscribe(@AuthenticationPrincipal MemberDetails memberDetails,
								@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {
		
	}
	*/
	
    @GetMapping(value = "sse/{id}", produces = "text/event-stream")
    public SseEmitter subscribe(@PathVariable String id,
    							@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {
    	
    	return notificationserviceImpl.subscribe(id, lastEventId);

    }

    /*
    @PostMapping("send-data/{id}")
    public void sendDataTEst(@PathVariable String id) {
    	notificationserviceImpl.notify(id, "data");
    }
    */
 
    @ResponseBody
	@RequestMapping("alarm.al")
	public ArrayList<Notification> selectAlarm(String receiveNo, Model model) {
    	
		ArrayList<Notification> aList = notificationserviceImpl.selectAlarmList(receiveNo);
		
		return aList;
	}
    
    @ResponseBody
    @RequestMapping("delete.al")
    public int deleteAlarm(String aNo) {
    	int result = notificationserviceImpl.deleteAlarm(aNo);
    	return result;
    }
    
}