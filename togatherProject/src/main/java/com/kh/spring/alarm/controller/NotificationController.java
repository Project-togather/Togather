package com.kh.spring.alarm.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.spring.alarm.model.service.NotificationServiceImpl;

@RestController
@RequiredArgsConstructor
public class NotificationController {
    private final NotificationServiceImpl notificationServiceImpl;

    @RequestMapping(value = "sse.do", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter subscribe(String id) {
    	
    	SseEmitter emitter = new SseEmitter();
    	
    	try {
    	    emitter.send(SseEmitter.event()
    	            .name("login-event")
    	            .data("User logged in"));
    	    emitter.complete();
    	} catch (Exception e) {
    	    emitter.completeWithError(e);
    	}
    	
    	System.out.println(emitter);
    	
    	return emitter;

    }

    @PostMapping("/send-data/{id}")
    public void sendDataTEst(@PathVariable Long id) {
        notificationServiceImpl.notify(id, "data");
    }
}