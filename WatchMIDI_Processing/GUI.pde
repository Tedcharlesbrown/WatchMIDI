class GUI {
	CONTAINER inputDevices, outputDevices;

	void classSetup() {
		inputDevices = new CONTAINER("INPUT DEVICES");
		outputDevices = new CONTAINER("OUTPUT DEVICES");
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

	void midiDeviceInputOutputDraw() {
		inputDevices.update();
		inputDevices.draw(columnLeft, headerPadding, containerWidth, centerY * 1.35, "INPUT");
		outputDevices.update();
		outputDevices.draw(columnRight, headerPadding, containerWidth, centerY * 1.35, "OUTPUT");
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



	void midiDeviceUpdate() {
		push();
		// println(MidiBus.availableOutputs().length);
		arrayCopy(MidiBus.availableInputs(), midiInputArray);
		arrayCopy(MidiBus.availableOutputs(), midiOutputArray);
		// printArray(midiInputArray);
		// printArray(midiOutputArray);
		pop();
	}

//--------------------------------------------------------------
// MARK: ---------- TOUCH EVENTS ----------
//--------------------------------------------------------------

	void touchDown() {
		inputDevices.touchDown();
		outputDevices.touchDown();
	}

	void touchUp() {
		inputDevices.touchUp();
		outputDevices.touchUp();
	}

}