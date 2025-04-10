import websockets.*;

WebsocketClient wsc;

void websocket_setup(){
 wsc= new WebsocketClient(this, "ws://localhost:8080"); 
}

void webSocketEvent(String msg){
 println(msg);
 newEllipse=true;
}
