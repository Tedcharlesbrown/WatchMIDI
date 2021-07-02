class BUTTON {
	float x, y, w, h;
	boolean clicked = false;
	boolean doubleClicked = false;
	boolean action = false;
	boolean released = false;

	int buttonCorner = 10;

	void show(String _ID, float _x, float _y, float _w, float _h) { //ONE TEXT
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;

		push();
		rectMode(CENTER);

		stroke(grey);
		strokeWeight(strokeWeight);
		if (this.clicked) {
			fill(100);
		} else {
			fill(0);
		}

		rect(_x, _y, _w, _h, buttonCorner);

		try {
			textSize(fontMedium);
			textAlign(CENTER, CENTER);
			fill(255);

			text(_ID, _x, _y - fontMedium / 8); //INPUT

		} catch (Exception e) {

		}

		pop();
	}

	void touchDown() {
		if (mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2) {
			this.clicked = true;
			this.action = true;
			// println(this.ID, this.ID2);
		}
	}

	void touchUp() {
		if (clicked) {
			this.released = true;
		}
		this.clicked = false;
	}

}