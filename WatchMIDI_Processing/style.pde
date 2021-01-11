//COLORS
color white = 255;
color black = 0;
color grey = 155;
color shadow = black;

color bgColor = #141414;
color headerColor = #343434;

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

void styleSetup() {
	//SIZES
	centerX = width / 2;
	centerY = height / 2;


	headerHeight = height / 8;
	headerCenter = headerHeight / 2;

	topContainerHeight = centerY / 1.5;
	bottomContainerHeight = centerY / 1.15;

	containerWidth = centerX - padding * 1.5;
	containerFullWidth = width - padding * 2;


	//TEXT
	fontLarge = 30;
	fontMedium = 16;
	fontSmall = 12;
}

void classSetup() {
	gui = new GUI();
	button = new BUTTON();
}