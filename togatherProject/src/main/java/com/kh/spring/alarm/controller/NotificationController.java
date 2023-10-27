package com.kh.spring.alarm.controller;

import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.spring.alarm.model.service.NotificationServiceImpl;

@RestController
@RequiredArgsConstructor
public class NotificationController {
	/*
	private final NotificationServiceImpl notificationservieImpl;
	
	@GetMapping(value = "/subscribe", produces = "text/event-stream")
	@ResponseStatus(HttpStatus.OK)
	public SseEmitter subscribe(@AuthenticationPrincipal MemberDetails memberDetails,
								@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {
		
	}
	*/
	
	
	
	
	/*
    private final NotificationServiceImpl notificationServiceImpl;
    
    public NotificationController(NotificationServiceImpl notificationServiceImpl) {
    	this.notificationServiceImpl = notificationServiceImpl;
	}

    @GetMapping(value = "sse/{id}", produces = "text/event-stream")
    public SseEmitter subscribe(@PathVariable String id) {
    	
    	return notificationServiceImpl.subscribe(id);

    }
    
    

    @PostMapping("send-data/{id}")
    public void sendDataTEst(@PathVariable String id) {
        notificationServiceImpl.notify(id, "data");
    }
    */
}