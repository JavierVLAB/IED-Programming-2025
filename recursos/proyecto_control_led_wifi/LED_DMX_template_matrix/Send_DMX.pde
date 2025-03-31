import ch.bildspur.artnet.*;

ArtNetClient artnet;
byte[] dmxData01 = new byte[512];
byte[] dmxData02 = new byte[512];


void clearLeds(String arduinoIP) {

  // fill dmx array
  byte[] dmxData = new byte[512];
  for (int i = 0; i < 512; i++) {
    dmxData[i] = (byte) 0;
  }
  // send dmx to localhost
  artnet.unicastDmx(arduinoIP, 0, 0, dmxData);
  //artnet.unicastDmx(arduinoIP, 0, 1, dmxData);
}


void setupDMX(String arduinoIP)
{

  artnet = new ArtNetClient(null);
  artnet.start();
  clearLeds(arduinoIP);
  for (int i = 0; i < 512; i++) {
    dmxData01[i] = (byte) 0;
    dmxData02[i] = (byte) 0;
  }
}

void sendDMX(int numLedsX, int numLedsY, String arduinoIP)
{
  loadPixels();

  for (int i= 0; i<numLedsX; i++) {
    for (int j=0; j<numLedsY; j++) {
      int l = numLedsX*j + i;
      int pixelPosition = numLedsX*j*60*60 + i*60;
      
      if (j%2==0) {
        l = numLedsX*j + i;
      } else {
        l = numLedsX*j + numLedsX-1-i;
      } 

      dmxData01[l*3 + 0] = (byte) red(pixels[pixelPosition]);
      dmxData01[l*3 + 1] = (byte) green(pixels[pixelPosition]);
      dmxData01[l*3 + 2] = (byte) blue(pixels[pixelPosition]);
    }
  }

  artnet.unicastDmx(arduinoIP, 0, 0, dmxData01);
  //artnet.unicastDmx(arduinoIP, 0, 1, dmxData02);
}

void exit() {

  clearLeds(arduinoIP);
  super.exit();
}
