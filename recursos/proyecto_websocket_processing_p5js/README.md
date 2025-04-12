# Proyecto conexión Ipad - Processing - Arduino

## Recursos

- **ipad_p5js_server** : Sketch de P5js para usar en IPad
- **LED_DMX_Websocket_matrix** : Sketch de processing para enviar imagenes al arduino
- **NeoPixel_Arnet_ESP32** : Sketch de Arduino para programar el arduino y controlar los leds
- **Websocket-Server.app** : Aplicación de Mac para generar servidro de conexión

## Previo

- Tener una WiFi
- Tener instalado Node en el ordenador
- Estar seguro que Arduino esta programando a la placa
- Tener en processing instalado el modo de p5js, y las librerias de websocket y artnet

## Pasos

### Programar Placa

- Averiguar el nombre y la clave de la wifi
- En el archivo arduino_secrects.h si la wifi no esta en la lista, cambiar `NUEVA WIFI` por el nombre de la wifi y `NUEVO PASS` por el nombre de la clave
- Subir el programa a la placa
- Ver en el monitor serial el mensaje que indica que esta conectado y ver la IP que muestra. Guardar esta IP
- Desconectar del ordenador
- Conectar a la fuente y a los leds
- El cable de datos de los led debe esar en el pin `IO16`

### Encender Servidor de Conexión

- Hacer click en la aplicacion `Websocket-Server`
- Se deberia abrir una ventana de terminal, no cerrarla
- A veces da error, y es porque esta abierta otra ventana.

### Encender Servidor P5JS

- Abrir Proicessing
- Poner el modo P5js
- Abrir el proyecto
- Dar al play
- En el terminal de processing ver la IP que se muestra. La ip es del tipo `192.168.1.77`
- Escribir la IP dentro del programa en la variable `server_IP`
- Volver a hacer play
- Coger la IP y el puerto y escribirlo en un navegador del ipad. Probar safari y chrome. La ip y el puerto es del tipo `192.168.1.77:8782``

### Encender Processing

- Abrir Processing
- Poner el modo JAVA
- Abrir el programa `LED_DMW_Websocket_matrix`
- Escribir la IP del Arduino en la variable `arduinoIP`
- Escribir el numero del ancho y alto de la matrix de leds en `numLedsX` y `numLedsY`
- Encender el programa
- El programa va a dar error si no esta el servidor de conexion encendido


En principio si todo esta bien, los mensajes positivos hacen que el relleno sea verde en processing y los negativos que sea rojo

