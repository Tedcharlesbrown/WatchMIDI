void midiNumberInit() {

//----------------------------------
	int noteStart = byte(0x90);
	for (int i = 0; i < 16; i++) {
		noteOn[i] = byte(noteStart + i);
		println(i, noteOn[i], hex(noteOn[i]));
	}
//----------------------------------
	noteStart = byte(0x80);
	for (int i = 0; i < 16; i++) {
		noteOff[i] = byte(noteStart + i);
		println(i, noteOff[i], hex(noteOff[i]));
	}
//----------------------------------
	noteStart = byte(0xB0);
	for (int i = 0; i < 16; i++) {
		noteControl[i] = byte(noteStart + i);
		println(i, noteControl[i], hex(noteControl[i]));
	}
//----------------------------------
	noteStart = byte(0xC0);
	for (int i = 0; i < 16; i++) {
		noteProgram[i] = byte(noteStart + i);
		println(i, noteProgram[i], hex(noteProgram[i]));
	}
//----------------------------------
	noteStart = byte(0x00);
	for (int i = 0; i < 128; i++) {
		noteMIDI[i] = byte(noteStart + i);
		println(i, noteMIDI[i], hex(noteMIDI[i]));
	}



}



// byte[] noteProgram = new byte[16];
// byte[] noteMIDI = new byte[16];
// byte[] noteShow = new byte[16];
// byte[] noteFormat = new byte[16];
// byte[] noteCommand = new byte[16];