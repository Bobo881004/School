PImage img;
int i;
int control=20;
void setup()
{
size(500, 500);
i=10;
img = loadImage("Robot.jpg");
frameRate(20);
}

void draw()
{
background(255);
image(img, 50, 50, i, i);
i = i+control;
if (i < 0 || i>400) control *= -1;
}
