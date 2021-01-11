class GUI {


	void backgroundDraw() {
		background(bgColor);
	}

	void headerDraw() {
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

		translate(0,headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(padding,0,centerX - padding * 1.5, topContainerHeight);

		popMatrix();
		pop();
	}

	void midiSendDraw() {
		push();
		pushMatrix();

		translate(0,headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(centerX + padding / 2,0,centerX - padding * 1.5, topContainerHeight);

		popMatrix();
		pop();
	}

	void midiMessagesDraw() {
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



	void midiDeviceUpdate() {
		push();
		// println(MidiBus.availableOutputs().length);
		arrayCopy(MidiBus.availableInputs(),midiInputArray);
		arrayCopy(MidiBus.availableOutputs(),midiOutputArray);
		// printArray(midiInputArray);
		// printArray(midiOutputArray);
		pop();
	}



	void midiDeviceInputDraw() {
		push();
		pushMatrix();

		translate(0,headerHeight + padding);

		fill(black);
		stroke(grey);
		strokeWeight(5);
		rect(padding,0,containerWidth, centerY * 1.35);

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

	void midiDeviceOutputDraw() {
		push();
		pushMatrix();

		translate(centerX - padding / 2,headerHeight + padding);

		fill(black);
		stroke(155);
		strokeWeight(5);
		rect(padding,0,containerWidth, centerY * 1.35);

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