package com.kh.spring.alarm.model.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

import java.io.IOException;
import java.util.Map;

@Service
public class NotificationServiceImpl {
    // 기본 타임아웃 설정
    private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;

    private final EmitterRepository emitterRepository;
    
    public NotificationServiceImpl(EmitterRepository emitterRepository) {
        this.emitterRepository = emitterRepository;
    }

    public SseEmitter subscribe(String userId) {
    	
        SseEmitter emitter = createEmitter(userId);
        
        System.out.println("에미터1 : " + emitter);
        
        // 503 에러 방지를 위한 더미 이벤트 전송
        sendToClient(userId, "EventStream Created. [userId=" + userId + "]");
        
        return emitter;
    }

   
    public void notify(String userId, Object event) {
        sendToClient(userId, event);
    }
    /*
    public void notifyComment(Member receiver, Reply reply, String content) {
        Notification notification = createCommentNotification(receiver, reply, content);
        String id = String.valueOf(receiver.getMemId());

        // 로그인 한 유저의 SseEmitter 모두 가져오기
        Map<String, SseEmitter> sseEmitters = emitterRepository.findAllEmitterStartWithById(id);
        sseEmitters.forEach(
            (key, emitter) -> {
                // 데이터 캐시 저장(유실된 데이터 처리하기 위함)
                emitterRepository.saveEventCache(key, notification);
                // 데이터 전송
                sendToClient(emitter, key, NotificationResponse.from(notification));
            }
        );
    }

    private Notification createCommentNotification(Member receiver, Reply reply, String content) {
        return Notification.builder()
                           .receiver(receiver)
                           .content(content)
                           .reply(reply)
                           .url("/reviews/" + reply.getImg())
                           .isRead(false)
                           .build();
    }
    */
    
    
   
   
    public void sendToClient(String id, Object data) {
    	System.out.println("send to client");
        SseEmitter emitter = emitterRepository.get(id);
        System.out.println("에미터2 : " + emitter.toString());
        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event().id(String.valueOf(id)).name("sse").data(data));
                System.out.println("에미터3 : " + emitter);
            } catch (IOException exception) {
                emitterRepository.deleteById(id);
                throw new RuntimeException("연결 오류!");
            }
        }
    }

    /**
     * 사용자 아이디를 기반으로 이벤트 Emitter를 생성
     *
     * @param id - 사용자 아이디.
     * @return SseEmitter - 생성된 이벤트 Emitter.
     */
    
    private SseEmitter createEmitter(String id) {
        SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
        emitterRepository.save(id, emitter);

        // Emitter가 완료될 때(모든 데이터가 성공적으로 전송된 상태) Emitter를 삭제한다.
        emitter.onCompletion(() -> emitterRepository.deleteById(id));
        // Emitter가 타임아웃 되었을 때(지정된 시간동안 어떠한 이벤트도 전송되지 않았을 때) Emitter를 삭제한다.
        emitter.onTimeout(() -> emitterRepository.deleteById(id));

        return emitter;
    }
    
}
