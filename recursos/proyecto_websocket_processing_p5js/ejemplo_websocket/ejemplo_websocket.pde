import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;
import java.net.URI;
import java.util.ArrayList;
import processing.data.JSONArray;
import processing.data.JSONObject;

WebSocketClient socket;
ArrayList<Circles> puntos = new ArrayList<Circles>();

void setup() {
  size(600, 600);

  try {
    socket = new WebSocketClient(new URI("ws://192.168.8.141:8080")) {
      public void onOpen(ServerHandshake handshakedata) {
        println("Conectado al servidor");
      }

      public void onMessage(String message) {
        println("Mensaje recibido: " + message); // Verificamos que llegue
        puntos.clear();
        try {
          JSONArray arr = JSONArray.parse(message);
          for (int i = 0; i < arr.size(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            float x = obj.getFloat("x");
            float y = obj.getFloat("y");
            puntos.add(new Circles(x, y));
          }
        } catch (Exception e) {
          println("Error parseando JSON: " + e.getMessage());
        }
      }

      public void onClose(int code, String reason, boolean remote) {
        println("Desconectado: " + reason);
      }

      public void onError(Exception ex) {
        ex.printStackTrace();
      }
    };
    socket.connect();
  } catch (Exception e) {
    e.printStackTrace();
  }
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  
  for (Circles c: puntos) {
    //println(c.y);
    ellipse(c.x,c.y,10,10);
  }
  
  if (socket != null && socket.isOpen()) {
    JSONObject msg = new JSONObject();
    msg.setFloat("x", mouseX);
    msg.setFloat("y", mouseY);
    socket.send(msg.toString());
  }
}
