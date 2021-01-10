import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import themidibus.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class WatchMIDI_Processing extends PApplet {

 //Import the library

MidiBus myBus; // The MidiBus

byte[] noteOn = new byte[16];
byte[] noteOff = new byte[16];
byte[] noteControl = new byte[16];
byte[] noteProgram = new byte[16];
byte[] noteMIDI = new byte[128];
byte sysCom0 = PApplet.parseByte(0x00); //RESERVED
byte sysGO = PApplet.parseByte(0x01); //GO
byte sysStop = PApplet.parseByte(0x02); //STOP
byte sysResume = PApplet.parseByte(0x03); //RESUME
byte sysTimedGo = PApplet.parseByte(0x04); //TIMED GO
byte sysLoad = PApplet.parseByte(0x05); //LOAD
byte sysSet = PApplet.parseByte(0x06); //SET
byte sysFire = PApplet.parseByte(0x07); //FIRE
byte sysAllOff = PApplet.parseByte(0x08); //ALL OFF
byte sysRestore = PApplet.parseByte(0x09); //RESTORE
byte sesReset = PApplet.parseByte(0xA); //RESET
byte sysGoOff = PApplet.parseByte(0x0B); //GO OFF

public void setup() {
  
  
  midiNumberInit();

  println(noteOn[0]);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.



  myBus = new MidiBus(this, -1, 3); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

public void draw() {
  int channel = 0;
  int pitch = 64;
  int velocity = 127;
  
  sendControl(noteMIDI[127],noteMIDI[1],sysGO);
  delay(500);
  sendControl(noteMIDI[127],noteMIDI[1],sysStop);
  // myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  // delay(200);
  // myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  // int number = 0;
  // int value = 90;

  // myBus.sendControllerChange(channel, number, value); // Send a controllerChange
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

public void sendControl(byte device, byte format, byte command){
  println("SYS MESSAGE:");
  // myBus.sendMessage(new byte[] {byte(0xF0), byte(0x7F), byte(0x7F), byte(0x02), byte(0x01), byte(0x01), byte(0xF7)});
  myBus.sendMessage(new byte[] {PApplet.parseByte(0xF0), PApplet.parseByte(0x7F), PApplet.parseByte(device), PApplet.parseByte(0x02), PApplet.parseByte(format), PApplet.parseByte(command), PApplet.parseByte(0xF7)});
}
public void midiNumberInit() {

//----------------------------------
	int noteStart = PApplet.parseByte(0x90);
	for (int i = 0; i < 16; i++) {
		noteOn[i] = PApplet.parseByte(noteStart + i);
		println(i, noteOn[i], hex(noteOn[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0x80);
	for (int i = 0; i < 16; i++) {
		noteOff[i] = PApplet.parseByte(noteStart + i);
		println(i, noteOff[i], hex(noteOff[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0xB0);
	for (int i = 0; i < 16; i++) {
		noteControl[i] = PApplet.parseByte(noteStart + i);
		println(i, noteControl[i], hex(noteControl[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0xC0);
	for (int i = 0; i < 16; i++) {
		noteProgram[i] = PApplet.parseByte(noteStart + i);
		println(i, noteProgram[i], hex(noteProgram[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0x00);
	for (int i = 0; i < 128; i++) {
		noteMIDI[i] = PApplet.parseByte(noteStart + i);
		println(i, noteMIDI[i], hex(noteMIDI[i]));
	}



}



// byte[] noteProgram = new byte[16];
// byte[] noteMIDI = new byte[16];
// byte[] noteShow = new byte[16];
// byte[] noteFormat = new byte[16];
// byte[] noteCommand = new byte[16];
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "WatchMIDI_Processing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
