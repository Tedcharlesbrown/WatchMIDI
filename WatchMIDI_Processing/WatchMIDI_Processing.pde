import themidibus.*; //Import the library
import http.*;

SimpleHTTPServer server;
MidiBus myBus; // The MidiBus

GUI gui;
BUTTON button;

void setup() {
  classSetup();
  styleSetup();
  gui.classSetup();
  // frame.setVisible(false);
  size(400, 400);


  try {
    server = new SimpleHTTPServer(this);
    server.serve("style.css");
  } catch (Exception e) {

  }

  midiNumberInit();
  // background(bgColor);

  // println(MidiBus.availableInputs());
  printArray(MidiBus.availableOutputs());

  myBus = new MidiBus(this, 0, 0);
  // myBus.close();
}

void update() {
  gui.update();
}

void draw() {
  update();
  gui.draw();


  // gui.midiThruDraw();
  // gui.midiSendDraw();
  // gui.midiMessagesDraw();




  // button.show("A",width / 2, height / 2, 100,100,"LARGE");
  // sendControl(noteMIDI[127],noteMIDI[1],sysGO);
  // delay(500);
  // sendControl(noteMIDI[127],noteMIDI[1],sysStop);
  // myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  // delay(200);
  // myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  // delay(2000);
}

void sendControl(byte device, byte format, byte command) {
  println("SYS MESSAGE:");
  myBus.sendMessage(new byte[] {byte(0xF0), byte(0x7F), byte(device), byte(0x02), byte(format), byte(command), byte(0xF7)});
}


void mousePressed() {
  gui.touchDown();

}

void mouseReleased() {
  gui.touchUp();
}