import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  myBus = new MidiBus(this, -1, 3); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
  int channel = 0;
  int pitch = 64;
  int velocity = 127;

  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  delay(200);
  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  int number = 0;
  int value = 90;

  myBus.sendControllerChange(channel, number, value); // Send a controllerChange
  delay(2000);

  //Or for something different we could send a custom Midi message ...

  // int status_byte = 0xA0; // For instance let us send aftertouch
  // int channel_byte = 0; // On channel 0 again
  // int first_byte = 64; // The same note;
  // int second_byte = 80; // But with less velocity

  // myBus.sendMessage(status_byte, channel_byte, first_byte, second_byte);

  //---------------------------------------------------------------------------

  //Or for something different we could send a custom Midi message ...
  // int status_byte = 0xA0; // For instance let us send aftertouch
  // int channel_byte = 0; // On channel 0 again
  // int first_byte = 64; // The same note;
  // int second_byte = 80; // But with less velocity

  // myBus.sendMessage(status_byte, channel_byte, first_byte, second_byte);

  //---------------------------------------------------------------------------
  
  //Or we could even send a variable length sysex message
  //IMPORTANT: On mac you will have to use the MMJ MIDI subsystem to be able to send SysexMessages. Consult README.md for more information

  // myBus.sendMessage(
  //   new byte[] {
  //     (byte)0xF0, (byte)0x1, (byte)0x2, (byte)0x3, (byte)0x4, (byte)0xF7
  //   }
  // );
  // //We could also do the same thing this way ...

  // try { //All the methods of SysexMessage, ShortMessage, etc, require try catch blocks
  //   SysexMessage message = new SysexMessage();
  //   message.setMessage(
  //     0xF0, 
  //     new byte[] {
  //       (byte)0x5, (byte)0x6, (byte)0x7, (byte)0x8, (byte)0xF7
  //     },
  //     5
  //   );
  //   myBus.sendMessage(message);
  // } catch(Exception e) {

  // }
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
