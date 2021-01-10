import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

byte[] noteOn = new byte[16];
byte[] noteOff = new byte[16];
byte[] noteControl = new byte[16];
byte[] noteProgram = new byte[16];
byte[] noteMIDI = new byte[128];
byte sysCom0 = byte(0x00); //RESERVED
byte sysGO = byte(0x01); //GO
byte sysStop = byte(0x02); //STOP
byte sysResume = byte(0x03); //RESUME
byte sysTimedGo = byte(0x04); //TIMED GO
byte sysLoad = byte(0x05); //LOAD
byte sysSet = byte(0x06); //SET
byte sysFire = byte(0x07); //FIRE
byte sysAllOff = byte(0x08); //ALL OFF
byte sysRestore = byte(0x09); //RESTORE
byte sesReset = byte(0xA); //RESET
byte sysGoOff = byte(0x0B); //GO OFF

void setup() {
  size(400, 400);
  
  midiNumberInit();

  println(noteOn[0]);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.



  myBus = new MidiBus(this, -1, 3); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
  
  sendControl(noteMIDI[127],noteMIDI[1],sysGO);
  delay(500);
  sendControl(noteMIDI[127],noteMIDI[1],sysStop);
  // myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  // delay(200);
  // myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  delay(2000);
}

void sendControl(byte device, byte format, byte command){
  println("SYS MESSAGE:");
  myBus.sendMessage(new byte[] {byte(0xF0), byte(0x7F), byte(device), byte(0x02), byte(format), byte(command), byte(0xF7)});
}
