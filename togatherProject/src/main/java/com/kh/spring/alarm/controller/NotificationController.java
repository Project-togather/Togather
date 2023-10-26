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
@RequestMapping("/togather")
@RequiredArgsConstructor
public class NotificationController {
    private final NotificationServiceImpl notificationServiceImpl;

    @GetMapping(value = "/subscribe/{id}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter subscribe(
            @PathVariable Long id) {
        return notificationServiceImpl.subscribe(id);
    }

    @PostMapping("/send-data/{id}")
    public void sendDataTEst(@PathVariable Long id) {
        notificationServiceImpl.notify(id, "data");
    }
}