package com.kh.spring.alarm.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.kh.spring.alarm.model.dao.NotificationDao;
import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.myClass.model.vo.MyClass;
import com.kh.spring.reply.model.vo.Reply;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@Service
public class NotificationServiceImpl {
	
	@Autowired
	private NotificationDao nDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
    // 기본 타임아웃 설정
    private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;

    private final EmitterRepository emitterRepository;
    
    public NotificationServiceImpl(EmitterRepository emitterRepository) {
        this.emitterRepository = emitterRepository;
    }

    public SseEmitter subscribe(String id, String lastEventId) {
    	
    	//String id = userId + "_" + System.currentTimeMillis();
    	
    	SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
        emitterRepository.save(id, emitter);
    	
        // Emitter가 완료될 때(모든 데이터가 성공적으로 전송된 상태) Emitter를 삭제한다.
        emitter.onCompletion(() -> emitterRepository.deleteById(id));
        // Emitter가 타임아웃 되었을 때(지정된 시간동안 어떠한 이벤트도 전송되지 않았을 때) Emitter를 삭제한다.
        emitter.onTimeout(() -> emitterRepository.deleteById(id));
    	
        System.out.println("구독에미터 : " + emitter);
        
        // 503 에러 방지를 위한 더미 이벤트 전송
        sendToClient(emitter, id, "EventStream Created. [userId=" + id + "]");
        
        /*
        if (!lastEventId.isEmpty()) {
            Map<String, Object> events = emitterRepository.findAllEventCacheStartById(String.valueOf(userId));
            events.entrySet().stream()
                  .filter(entry -> lastEventId.compareTo(entry.getKey()) < 0)
                  .forEach(entry -> sendToClient(emitter, entry.getKey(), entry.getValue()));
        }
        */
        
        return emitter;
    }

   /*
    public void notify(String userId, Object event) {
        sendToClient(userId, event);
    }
    */
    
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

    
    public void send(Member receiver, Reply reply, String content) {
    	
    	Notification notification = createNotification(receiver, reply, content);
    	String id = receiver.getMemId();
    	
    	//로그인 한 유저의 SseEmitter 모두 가져오기
    	Map<String, SseEmitter> sseEmitters = emitterRepository.findAllEmitterStartWithById(id);
    	System.out.println("findAll");
    	System.out.println(sseEmitters);
    	sseEmitters.forEach(
    			(key, emitter) -> {
    				sendToClient(emitter, key, notification);
    				System.out.println("센드 완료");
    				// 데이터 캐시 저장
    				emitterRepository.saveEventCache(key, notification);
    				// 데이터 전송
    			}
		);
    	
    	nDao.insertAlarm(receiver, reply, content, sqlSession);
    	
    }
    
    private Notification createNotification(Member receiver, Reply reply, String content) {
        return Notification.builder()
                           .receiver(receiver)
                           .content(content)
                           .reply(reply)
                           .url("http://localhost:8012/togather/detail.cl?classNo=" + reply.getRefFno())
                           .isRead("N")
                           .build();
        
    }
    
    public void sendToClient(SseEmitter emitter, String id, Object data) {
        
    	try {
    		emitter.send(SseEmitter.event()
                                   .id(id)
                                   .name("sse")
                                   .data(data));
        } catch (IOException exception) {
            emitterRepository.deleteById(id);
            throw new RuntimeException("연결 오류!");
        }
    	
    }

	public ArrayList<Notification> selectAlarmList(String receiveNo) {
		return nDao.selectAlarmList(receiveNo, sqlSession);
	}
    
	public int deleteAlarm(String aNo) {
		return nDao.deleteAlarm(aNo, sqlSession);
	}
	
}
