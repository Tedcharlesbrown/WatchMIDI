class BUTTON {
	float x, y, w, h;
	boolean clicked = false;
	boolean doubleClicked = false;
	boolean action = false;
	boolean released = false;

	int buttonCorner = 10;

	void show(String _ID, float _x, float _y, float _w, float _h, String _size) { //ONE TEXT
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