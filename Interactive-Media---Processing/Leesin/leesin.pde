Ring[] rings; // Declare the array
PImage img1;//LEE SIN
PImage img2;//Q SKILL
int numRings = 50;
int currentRing = 0;

void setup() {
  size(1000, 1000);
  smooth();
  img1 = loadImage("leesin.jpg");
  img2 = loadImage("Q.png");

  rings = new Ring[numRings]; // Create the array
  for (int i = 0; i < numRings; i++) {
    rings[i] = new Ring(); // Create each object
  }
}

void draw() {
  background(0);
  image(img1, 700, 0,300,600);
  for (int i = 0; i < numRings; i++) {
    rings[i].grow();
    rings[i].display();
  }
}

// Click to create a new Ring
void mousePressed() {
  rings[currentRing].start(mouseX, mouseY);
  currentRing++;
  if (currentRing >= numRings) {
    currentRing = 0;
  }
}

class Ring {
  float x, y; // X-coordinate, y-coordinate
  float diameter ; // Diameter of the ring
  boolean on = false; // Turns the display on and off

  void start(float xpos, float ypos) { 
    x = xpos;
    y = ypos;
    on = true;
  }

  void grow() {
    if (on == true) {
      x -= 10;
      if (x < 0) {
        on = false;
      }
    }
  }

  void display() {

    if (on == true) {
       image(img2,x, y,80,80);
    }
  }
}
