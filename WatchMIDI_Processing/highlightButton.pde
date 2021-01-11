class HIGHLIGHTBUTTON {
	float x, y, w, h;
	String ID;
	int ID2;
	boolean hover = false;
	boolean clicked = false;
	boolean action = false;
	boolean released = false;

	int buttonCorner = 10;

	void hover() {
		if (mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2) {
			this.hover = true;
		} else {
			this.hover = false;
		}
	}

	void show(String _ID, int _ID2, float _x, float _y, float _w, float _h) { //ONE TEXT
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;
		this.ID = _ID;
		this.ID2 = _ID2;

		push();
		rectMode(CENTER);
		noStroke();
		if (this.clicked) {
			fill(grey);
		} else if (this.hover) {
			fill(grey / 2);
		} else {
			fill(bgColor);
		}

		rect(_x, _y, _w, _h);

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
		// this.clicked = false;
	}


}