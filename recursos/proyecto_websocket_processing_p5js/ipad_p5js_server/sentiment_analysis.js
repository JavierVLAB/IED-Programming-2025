
let sentimentModel;

async function loadTransformers() {
  try {
    const module = await import(
      "https://cdn.jsdelivr.net/npm/@huggingface/transformers@3.0.0"
    );
    const { pipeline } = module;
    return pipeline;
  } catch (error) {
    console.error("Failed to load transformers.js", error);
  }
}

async function sentiment_setup() {
  let pipeline = await loadTransformers();
  sentimentModel = await pipeline("sentiment-analysis");
}


async function enviarTexto() {

  let results = await sentimentModel(texto);
  let sentimiento = results[0].label;
  let confianza = results[0].score;
  
  console.log(sentimiento);
  
  if (socket.readyState === WebSocket.OPEN) {
    socket.send(JSON.stringify({sentimiento: sentimiento, confianza: confianza}));
  }


  input.value('');
  texto = '';
  
}
