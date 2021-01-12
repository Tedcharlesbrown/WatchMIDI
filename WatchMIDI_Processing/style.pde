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

float columnLeft, columnRight;
float headerPadding;
float topContainerHeight, bottomContainerHeight;
float containerWidth, containerFullWidth;
float columnCenter;
float padding = 15;
float strokeWeight = 5;

//TEXT
String headerName = "MIDI NETWORK GATE";
float fontLarge, fontMedium, fontSmall;

float dropShadow = 5;

//ARRAYS
String[] midiInputArray = new String[100];
String[] midiOutputArray = new String[100];

int midiInputLength, midiOutputLength;

void styleSetup() {
	//SIZES
	centerX = width / 2;
	centerY = height / 2;

	columnLeft = 0;
	columnRight = centerX - padding / 2;

	headerHeight = height / 8;
	headerCenter = headerHeight / 2;
	headerPadding = headerHeight + padding;

	topContainerHeight = centerY / 1.5;
	bottomContainerHeight = centerY / 1.15;

	containerWidth = centerX - padding * 1.5;
	containerFullWidth = width - padding * 2;

	columnCenter = containerWidth / 2 + padding;


	//TEXT
	fontLarge = 30;
	fontMedium = 16;
	fontSmall = 12;
}

void classSetup() {
	gui = new GUI();
	button = new BUTTON();
}