
let sentimentModel;

async function loadTransformers() {
  try {
    const module = await import(
      "https://cdn.jsdelivr.net/npm/@huggingface/transformers"
      );
    const {
      pipeline
    }
    = module;
    return pipeline;
  }
  catch (error) {
    console.error("Failed to load transformers.js", error);
  }
}

async function sentiment_setup() {
  let pipeline = await loadTransformers();
  sentimentModel = await pipeline("sentiment-analysis",
    "Xenova/distilbert-base-uncased-finetuned-sst-2-english", {
  quantized:
    false
  }
  );
}


async function enviarTexto2() {

  let results = await sentimentModel(texto);
  let sentimiento = results[0].label;
  let confianza = results[0].score;

  console.log(sentimiento);

  if (socket.readyState === WebSocket.OPEN) {
    socket.send(JSON.stringify( {
    sentimiento:
    sentimiento, confianza:
      confianza
    }
    ));
  }


  input.value('');
  texto = '';
}

async function enviarTexto() {
  if (socket.readyState === WebSocket.OPEN) {
    if (random(1) > 0.5) {
      socket.send(JSON.stringify( {
      sentimiento:
        "POSITIVE"
      }
      ));
      
    } else {
      socket.send(JSON.stringify( {
      sentimiento:
        "NEGATIVE"
      }));
    }
  }
  
  
  input.value('');
  texto = '';
}
