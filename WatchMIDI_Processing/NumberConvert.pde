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


void midiNumberInit() {

//----------------------------------
	int noteStart = byte(0x90);
	for (int i = 0; i < 16; i++) {
		noteOn[i] = byte(noteStart + i);
		// println(i, noteOn[i], hex(noteOn[i]));
	}
//----------------------------------
	noteStart = byte(0x80);
	for (int i = 0; i < 16; i++) {
		noteOff[i] = byte(noteStart + i);
		// println(i, noteOff[i], hex(noteOff[i]));
	}
//----------------------------------
	noteStart = byte(0xB0);
	for (int i = 0; i < 16; i++) {
		noteControl[i] = byte(noteStart + i);
		// println(i, noteControl[i], hex(noteControl[i]));
	}
//----------------------------------
	noteStart = byte(0xC0);
	for (int i = 0; i < 16; i++) {
		noteProgram[i] = byte(noteStart + i);
		// println(i, noteProgram[i], hex(noteProgram[i]));
	}
//----------------------------------
	noteStart = byte(0x00);
	for (int i = 0; i < 128; i++) {
		noteMIDI[i] = byte(noteStart + i);
		// println(i, noteMIDI[i], hex(noteMIDI[i]));
	}



}



// byte[] noteProgram = new byte[16];
// byte[] noteMIDI = new byte[16];
// byte[] noteShow = new byte[16];
// byte[] noteFormat = new byte[16];
// byte[] noteCommand = new byte[16];