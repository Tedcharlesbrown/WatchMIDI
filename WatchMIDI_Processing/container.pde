class CONTAINER {
	ArrayList<HIGHLIGHTBUTTON> inputSelectButton = new ArrayList<HIGHLIGHTBUTTON>();
	ArrayList<HIGHLIGHTBUTTON> outputSelectButton = new ArrayList<HIGHLIGHTBUTTON>();

	String ID;
	String CASE;
	float x, y, w, h;

	CONTAINER(String _ID) {
		this.ID = _ID;
		for (int i = 0; i < 15; i++) {
			inputSelectButton.add(new HIGHLIGHTBUTTON());
			outputSelectButton.add(new HIGHLIGHTBUTTON());
		}
	}

	void update() {
		for (int i = 0; i < 15; i++) {
			if (inputSelectButton.get(i).action == true && inputSelectButton.get(i).clicked == true) {
				for (int j = 0; j < 15; j++) {
					inputSelectButton.get(j).clicked = false;
				}
				inputSelectButton.get(i).action = false;
				inputSelectButton.get(i).clicked = true;
			}
		}

		for (int i = 0; i < 15; i++) {
			if (outputSelectButton.get(i).action == true && outputSelectButton.get(i).clicked == true) {
				for (int j = 0; j < 15; j++) {
					outputSelectButton.get(j).clicked = false;
				}
				outputSelectButton.get(i).action = false;
				outputSelectButton.get(i).clicked = true;
			}
		}
	}

	void draw(float _x, float _y, float _w, float _h, String _case) {
		this.CASE = _case;
		this.x = _x;
		push();
		pushMatrix();

		noFill();
		stroke(grey);
		strokeWeight(strokeWeight);
		rect(_x + padding, _y, _w, _h);

		fill(headerColor);
		rect(_x + padding, _y, containerWidth, padding * 2);

		fill(white);
		textSize(fontMedium);
		textAlign(CENTER, CENTER);
		text(this.ID, _x + containerWidth / 2 + padding, headerPadding + padding);

		if (this.CASE == "INPUT") {
			inputDraw();
		} else if (this.CASE == "OUTPUT") {
			outputDraw();
		}

		popMatrix();
		pop();
	}

	void inputDraw() {
		textAlign(RIGHT, CENTER);
		textSize(fontSmall);
		fill(white);
		float paddingMultiplier = 7.25;

		int arrayLength = MidiBus.availableInputs().length;
		if (MidiBus.availableInputs().length > 15) {
			arrayLength = 15;
		}
		for (int i = 0; i < MidiBus.availableInputs().length; i++) {
			inputSelectButton.get(i).hover();
			inputSelectButton.get(i).show("I", i, columnCenter, padding * paddingMultiplier, containerWidth - strokeWeight, padding);
			text(midiInputArray[i], this.x + containerWidth + padding / 2, padding * paddingMultiplier);
			paddingMultiplier++;
		}
	}

	void outputDraw() {
		textAlign(RIGHT, CENTER);
		textSize(fontSmall);
		fill(white);
		float paddingMultiplier = 7.25;

		int arrayLength = MidiBus.availableOutputs().length;
		if (MidiBus.availableOutputs().length > 15) {
			arrayLength = 15;
		}
		for (int i = 0; i < MidiBus.availableOutputs().length; i++) {
			outputSelectButton.get(i).hover();
			outputSelectButton.get(i).show("O", i, this.x + columnCenter, padding * paddingMultiplier, containerWidth - strokeWeight, padding);
			text(midiOutputArray[i], this.x + containerWidth + padding / 1.5, padding * paddingMultiplier);
			paddingMultiplier++;
		}
	}

	void touchDown() {
		for (int i = 0; i < 15; i++) {
			inputSelectButton.get(i).touchDown();
			outputSelectButton.get(i).touchDown();
		}
	}

	void touchUp() {
		for (int i = 0; i < 15; i++) {
			inputSelectButton.get(i).touchUp();
			outputSelectButton.get(i).touchUp();
		}
	}

}