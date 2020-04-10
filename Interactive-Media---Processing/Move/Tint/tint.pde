PImage img;
int i;

void setup()
{
size(1000, 200);
i=255;
img = loadImage("Robot.jpg");
frameRate(2);
}

void draw()
{
tint(i); // Tint gray
image(img, 0, 0);
i = i-20;
if (i<0) i=0;
}
