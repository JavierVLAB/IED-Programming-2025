let socket;
let puntos = [];

let r, g, b;

params = new URLSearchParams(window.location.search);
text1 = params.get("text"); 

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(255);

  socket = new WebSocket("ws://192.168.8.141:8080"); // Reemplazá con IP local

  socket.onmessage = (event) => {
    puntos = JSON.parse(event.data);
  };
  r = random(255);
  g = random(255);
  b = random(255); 

  //params = new URLSearchParams(window.location.search);
  //text1 = params.get("text"); 

}

function draw() {
  background(255);
  noStroke();

  for (let p of puntos) {
    fill(p.r,p.g,p.b);
    ellipse(p.x*width, p.y*height, 20, 20);
    //textSize(24);
    //text(p.text, p.x*width, p.y*height);
  }

  if (socket.readyState === WebSocket.OPEN) {
    socket.send(JSON.stringify({ x: mouseX/width, y: mouseY/height, r: r, g: g, b: b, text: text1 }));
  }
}
