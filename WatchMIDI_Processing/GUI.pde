class GUI {
	CONTAINER inputDevices, outputDevices;
	BUTTON midiSubmit;

	boolean midiSelectMenu = false;

	void classSetup() {
		inputDevices = new CONTAINER("INPUT");
		outputDevices = new CONTAINER("OUTPUT");
		midiSubmit = new BUTTON();
	}

	void update() {
		if (midiSelectMenu == true) {
			midiDeviceUpdate();
			midiDeviceInputOutputUpdate();
		} else {


		}
	}

	void draw() {
		backgroundDraw();
		headerDraw();
		if (midiSelectMenu == true) {
			midiDeviceInputOutputDraw();
		} else {
			midiThruDraw();
			midiSendDraw();
			midiMessagesDraw();
		}


	}

	void backgroundDraw() {
		background(bgColor);
	}

	void headerDraw() {
		push();
		// rectMode(CENTER);
		fill(headerColor);
		rect(0, 0, width, headerHeight);
		fill(shadow);
		rect(0, headerHeight, width, dropShadow);

		textAlign(CENTER, CENTER);
		textSize(fontLarge);
		fill(shadow);
		text(headerName, centerX + dropShadow, headerCenter + dropShadow);
		fill(white);
		text(headerName, centerX, headerCenter);

		pop();
	}

		void midiDeviceUpdate() {
		midiInputLength = MidiBus.availableInputs().length;
		midiOutputLength = MidiBus.availableOutputs().length;

		// if (midiInputLength > 1) {
		// 	arrayCopy(MidiBus.availableInputs(), 1, midiInputArray, 0, midiInputLength  - 1);
		// } else {
		// 	midiInputArray[0] = "NO INPUT DEVICE";
		// }


		// if (midiOutputLength > 1) {
		// 	arrayCopy(MidiBus.availableOutputs(), 1, midiOutputArray, 0, midiOutputLength  - 1);
		// } else {
		// 	midiOutputArray[0] = "NO OUTPUT DEVICE";
		// }

		arrayCopy(MidiBus.availableInputs(), midiInputArray);
		arrayCopy(MidiBus.availableOutputs(), midiOutputArray);

	}

	void midiDeviceInputOutputUpdate() {
		if (midiSubmit.action == true) {
			midiSubmit.action = false;
			myBus.close();
			myBus = new MidiBus(this, inputDevices.userSelect, outputDevices.userSelect);
			println("CHANGING MIDI DEVICES: ", inputDevices.userSelect, outputDevices.userSelect);
		}
	}

	void midiDeviceInputOutputDraw() {
		inputDevices.update();
		inputDevices.draw(columnLeft, headerPadding, containerWidth, centerY * 1.35, "INPUT");
		outputDevices.update();
		outputDevices.draw(columnRight, headerPadding, containerWidth, centerY * 1.35, "OUTPUT");
		midiSubmit.show("SUBMIT", centerX, height - headerPadding / 2, containerWidth, headerHeight / 1.5);
	}


	void midiThruDraw() {
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

		translate(0, headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(strokeWeight);
		rect(padding, 0, centerX - padding * 1.5, topContainerHeight);

		popMatrix();
		pop();
	}

	void midiSendDraw() {
		push();
		pushMatrix();

		translate(0, headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(strokeWeight);
		rect(centerX + padding / 2, 0, centerX - padding * 1.5, topContainerHeight);

		popMatrix();
		pop();
	}

	void midiMessagesDraw() {
		push();
		pushMatrix();

		translate(0, headerHeight + padding * 2 + topContainerHeight);

		fill(black);
		stroke(grey);
		strokeWeight(strokeWeight);
		rect(padding, 0, width - padding * 2, bottomContainerHeight);

		popMatrix();
		pop();
	}

//--------------------------------------------------------------
// MARK: ---------- TOUCH EVENTS ----------
//--------------------------------------------------------------

	void touchDown() {
		if (mouseY < headerHeight) {
			if (midiSelectMenu == true) {
				midiSelectMenu = false;
			} else {
				midiSelectMenu = true;
			}
		}


		inputDevices.touchDown();
		outputDevices.touchDown();
		midiSubmit.touchDown();
	}

	void touchUp() {
		inputDevices.touchUp();
		outputDevices.touchUp();
		midiSubmit.touchUp();
	}

}