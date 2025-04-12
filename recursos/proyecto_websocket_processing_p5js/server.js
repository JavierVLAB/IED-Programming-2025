const WebSocket = require('ws');
const os = require('os');
const puerto = 8787;

const wss = new WebSocket.Server({ port: puerto });

// Obtener la IP local del servidor
function getLocalIP() {
  const interfaces = os.networkInterfaces();
  for (const name in interfaces) {
    for (const iface of interfaces[name]) {
      if (iface.family === 'IPv4' && !iface.internal) {
        return iface.address;
      }
    }
  }
  return 'localhost';
}

wss.on('connection', (ws) => {
  ws.on('message', (msg) => {
    try {
      const { sentimiento, confianza } = JSON.parse(msg);

      for (const client of wss.clients) {
        if (client.readyState === WebSocket.OPEN) {
          client.send(sentimiento);
        }
      }
    } catch (e) {
      console.log('Error en mensaje:', e);
    }
  });
});

console.log(`Servidor WebSocket activo en ws://${getLocalIP()}:${puerto}`);
