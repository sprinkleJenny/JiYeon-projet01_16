package websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class BroadSocket {
	public static Set<Session> clients 
		= Collections.synchronizedSet(new HashSet<Session>()); //HashSet객체를 만들음
	
	
	@OnMessage	//클라이언트로부터 메시지가 도착 했을 때 / 밑에 있는 하나만 적용됨
	public void onMessage(String message, Session session)throws Exception{
		System.out.println("클라이언트의 새로운 메시지 : " + message);
		//동기화처리 부분
		synchronized (clients) {
			for(Session client : clients) {
				//작성자 제외
				if(!client.equals(session)) {
					//메시지 뿌리기
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnOpen	//새로운 클라이언트가 서버로 접속했을 때
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("참여: " + clients.size() + "명.");
	}
	
	@OnClose	// 클라이언트의 접속이 끊어졌을 때
	public void onClose(Session session) {
		clients.remove(session);
		
	}
	
}
