import websockets.*;

WebsocketClient wsc;

void websocket_setup(){
 wsc= new WebsocketClient(this, "ws://localhost:8787"); 
}
