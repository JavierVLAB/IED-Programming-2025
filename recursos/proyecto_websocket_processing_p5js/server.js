const WebSocket = require('ws');
const os = require('os');

const wss = new WebSocket.Server({ port: 8080 });

let clients = new Map();

// Obtener la IP local del servidor
function getLocalIP() {
  const interfaces = os.networkInterfaces();
  for (const name of Object.keys(interfaces)) {
    for (const iface of interfaces[name]) {
      if (iface.family === 'IPv4' && !iface.internal) {
        return iface.address;
      }
    }
  }
  return 'localhost';
}

wss.on('connection', (ws) => {
  const id = Date.now().toString() + Math.random().toString().slice(2, 6);
  //clients.set(ws, { id, text: ''});

  ws.on('message', (msg) => {
    try {
      console.log('Mensaje recibido:', msg);
      const str = msg.toString();
      const data = JSON.parse(msg);
      clients.set(ws, { id, text: data.text});
      console.log('Mensaje recibido:', data);
      const payload = JSON.stringify([...clients.values()]);
      // Broadcast a todos
      for (const client of wss.clients) {
        if (client.readyState === WebSocket.OPEN) {
          client.send(payload);
        }
      }
    } catch (e) {
      console.log('Error en mensaje:', e);
    }
  });

  ws.on('close', () => {
    clients.delete(ws);
  });
});

console.log(`Servidor WebSocket activo en ws://${getLocalIP()}:8080`);
