const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 });

let clients = new Map();

wss.on('connection', (ws) => {
  const id = Date.now().toString() + Math.random().toString().slice(2, 6);
  clients.set(ws, { id, x: 0, y: 0, r: 0, g: 0, b: 0, text: ''});

  ws.on('message', (msg) => {
    try {
      const data = JSON.parse(msg);
      clients.set(ws, { id, x: data.x, y: data.y, r: data.r, g: data.g, b: data.b, text: data.text, read: data.read });

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

console.log('Servidor WebSocket activo en ws://0.0.0.0:8080');
