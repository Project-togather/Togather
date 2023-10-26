package com.kh.spring.alarm.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
public class NotificationController {
 
	@GetMapping(value = "/subscribe/{id}", produces = "text/event-stream")
	public SseEmitter testSse(@PathVariable String id) {
		SseEmitter emitter = new SseEmitter();
		
		emitter.onCompletion(emitter::complete);
		emitter.onTimeout(emitter::complete);
		
		try {
			emitter.send(SseEmitter.event()
				   .name("test")
				   .data("here i am"));
			emitter.complete();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return emitter;
	}
	
}
