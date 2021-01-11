import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import themidibus.*; 
import http.*; 

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


SimpleHTTPServer server;
MidiBus myBus; // The MidiBus



GUI gui;
BUTTON button;

public void setup() {
  classSetup();
  styleSetup();
  // frame.setVisible(false);
  
  

  try {
  server = new SimpleHTTPServer(this); 
  server.serve("style.css");
} catch(Exception e) {

}
  
  midiNumberInit();
  // background(bgColor);

  // println(MidiBus.availableInputs());
  // printArray(MidiBus.availableOutputs());

  // MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  myBus = new MidiBus(this, -1, 3); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

public void update() {
  gui.midiDeviceUpdate();
}

public void draw() {
  update();
  gui.backgroundDraw();
  gui.headerDraw();


  gui.midiDeviceInputDraw();
  gui.midiDeviceOutputDraw();
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

public void sendControl(byte device, byte format, byte command){
  println("SYS MESSAGE:");
  myBus.sendMessage(new byte[] {PApplet.parseByte(0xF0), PApplet.parseByte(0x7F), PApplet.parseByte(device), PApplet.parseByte(0x02), PApplet.parseByte(format), PApplet.parseByte(command), PApplet.parseByte(0xF7)});
}
class GUI {


	public void backgroundDraw() {
		background(bgColor);
	}

	public void headerDraw() {
		push();
		// rectMode(CENTER);
		fill(headerColor);
		rect(0,0,width,headerHeight);
		fill(shadow);
		rect(0,headerHeight,width,dropShadow);

		textAlign(CENTER, CENTER);
		textSize(fontLarge);
		fill(shadow);
		text(headerName,centerX+dropShadow,headerCenter+dropShadow);	
		fill(white);
		text(headerName,centerX,headerCenter);

		pop();
	}

	public void midiThruDraw() {
		// push();
		// pushMatrix();

		// translate(0,headerHeight + padding);

		// fill(black);
		// stroke(grey);
		// strokeWeight(5);
		// rect(padding,0,centerX - padding * 1.5, topContainerSize);

		// textAlign(RIGHT, CENTER);
		// textSize(13);
		// fill(white);
		// text(midiInputArray[0],centerX - padding * 2,padding * 3);

		// popMatrix();
		// pop();





		push();
		pushMatrix();

		translate(0,headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(padding,0,centerX - padding * 1.5f, topContainerHeight);

		popMatrix();
		pop();
	}

	public void midiSendDraw() {
		push();
		pushMatrix();

		translate(0,headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(centerX + padding / 2,0,centerX - padding * 1.5f, topContainerHeight);

		popMatrix();
		pop();
	}

	public void midiMessagesDraw() {
		push();
		pushMatrix();

		translate(0,headerHeight + padding * 2 + topContainerHeight);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(padding,0,width - padding * 2, bottomContainerHeight);

		popMatrix();
		pop();
	}



	public void midiDeviceUpdate() {
		push();
		// println(MidiBus.availableOutputs().length);
		arrayCopy(MidiBus.availableInputs(),midiInputArray);
		arrayCopy(MidiBus.availableOutputs(),midiOutputArray);
		// printArray(midiInputArray);
		// printArray(midiOutputArray);
		pop();
	}



	public void midiDeviceInputDraw() {
		push();
		pushMatrix();

		translate(0,headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(padding,0,containerWidth, centerY * 1.35f);

		fill(headerColor);
		rect(padding,0,containerWidth,padding * 2);

		fill(white);
		textSize(fontMedium);
		textAlign(CENTER,CENTER);
		text("INPUT DEVICES",containerWidth / 2 + padding,padding);

		textAlign(RIGHT, CENTER);
		textSize(fontSmall);
		fill(white);
		int paddingMultiplier = 3;

		int arrayLength = MidiBus.availableInputs().length;
		if (MidiBus.availableInputs().length > 15) {
			arrayLength = 15;
		}
		for (int i = 0; i < MidiBus.availableInputs().length; i++) {
			text(midiInputArray[i],containerWidth + padding / 2,padding * paddingMultiplier);
			paddingMultiplier++;
		}

		popMatrix();
		pop();
	}

	public void midiDeviceOutputDraw() {
		push();
		pushMatrix();

		translate(centerX - padding / 2,headerHeight + padding);

		fill(black);
		stroke(155);
		strokeWeight(5);
		rect(padding,0,containerWidth, centerY * 1.35f);

		fill(headerColor);
		rect(padding,0,containerWidth,padding * 2);

		fill(white);
		textSize(fontMedium);
		textAlign(CENTER,CENTER);
		text("OUTPUT DEVICES",containerWidth / 2 + padding,padding);

		textAlign(RIGHT, CENTER);
		textSize(fontSmall);
		fill(white);
		int paddingMultiplier = 3;

		int arrayLength = MidiBus.availableOutputs().length;
		if (MidiBus.availableOutputs().length > 15) {
			arrayLength = 15;
		}
		for (int i = 0; i < arrayLength; i++) {
			text(midiOutputArray[i],containerWidth + padding / 2,padding * paddingMultiplier);
			paddingMultiplier++;
		}

		popMatrix();
		pop();
	}


}
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


public void midiNumberInit() {

//----------------------------------
	int noteStart = PApplet.parseByte(0x90);
	for (int i = 0; i < 16; i++) {
		noteOn[i] = PApplet.parseByte(noteStart + i);
		// println(i, noteOn[i], hex(noteOn[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0x80);
	for (int i = 0; i < 16; i++) {
		noteOff[i] = PApplet.parseByte(noteStart + i);
		// println(i, noteOff[i], hex(noteOff[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0xB0);
	for (int i = 0; i < 16; i++) {
		noteControl[i] = PApplet.parseByte(noteStart + i);
		// println(i, noteControl[i], hex(noteControl[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0xC0);
	for (int i = 0; i < 16; i++) {
		noteProgram[i] = PApplet.parseByte(noteStart + i);
		// println(i, noteProgram[i], hex(noteProgram[i]));
	}
//----------------------------------
	noteStart = PApplet.parseByte(0x00);
	for (int i = 0; i < 128; i++) {
		noteMIDI[i] = PApplet.parseByte(noteStart + i);
		// println(i, noteMIDI[i], hex(noteMIDI[i]));
	}



}



// byte[] noteProgram = new byte[16];
// byte[] noteMIDI = new byte[16];
// byte[] noteShow = new byte[16];
// byte[] noteFormat = new byte[16];
// byte[] noteCommand = new byte[16];
class BUTTON {
	float x, y, w, h;
	boolean clicked = false;
	boolean doubleClicked = false;
	boolean action = false;
	boolean released = false;

	int buttonCorner = 10;

	public void show(String _ID, float _x, float _y, float _w, float _h, String _size) { //ONE TEXT
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;

		push();
		rectMode(CENTER);

		stroke(255);
		strokeWeight(10);
		if (this.clicked) {
			fill(100);
		} else {
			fill(0);
		}

		rect(_x, _y, _w, _h, buttonCorner);

		// try {

		// 	textAlign(CENTER, CENTER);
		// 	fill(255);

		// 	if (_size == "LARGE") {
		// 		textFont(fontLarge);
		// 	} else if (_size == "MEDIUM") {
		// 		textFont(fontMedium);
		// 	} else if (_size == "SMALL") {
		// 		textFont(fontSmall);
		// 	}
		// 	text(_ID, _x, _y); //INPUT

		// } catch (Exception e) {

		// }

		pop();
	}

}
//COLORS
int white = 255;
int black = 0;
int grey = 155;
int shadow = black;

int bgColor = 0xff141414;
int headerColor = 0xff343434;

//SIZES
float centerX, centerY;
float headerHeight, headerCenter;

float topContainerHeight, bottomContainerHeight;
float containerWidth, containerFullWidth;
float padding = 15;

//TEXT
String headerName = "MIDI NETWORK GATE";
float fontLarge, fontMedium, fontSmall;

float dropShadow = 5;

//ARRAYS
String[] midiInputArray = new String[100];
String[] midiOutputArray = new String[100];

public void styleSetup() {
	//SIZES
	centerX = width / 2;
	centerY = height / 2;


	headerHeight = height / 8;
	headerCenter = headerHeight / 2;

	topContainerHeight = centerY / 1.5f;
	bottomContainerHeight = centerY / 1.15f;

	containerWidth = centerX - padding * 1.5f;
	containerFullWidth = width - padding * 2;


	//TEXT
	fontLarge = 30;
	fontMedium = 16;
	fontSmall = 12;
}

public void classSetup() {
	gui = new GUI();
	button = new BUTTON();
}
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
