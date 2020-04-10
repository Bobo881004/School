import processing.serial.*;
Serial port; // Create object from Serial class
int val; // Data received from the serial port
void setup() {
    size(400, 400);
    frameRate(10);
// Open the port that the board is connected to and use the same speed (9600 bps)
    println(Serial.list()); 
    String portName = Serial.list()[1]; 
//where 0 is dependent on the "com" port number.

    port = new Serial(this, portName, 9600);
}
void draw() {
    if (0 < port.available()) { // If data is available,
        val = port.read();
        println(val);
        // read it and store it in val
     }
    background(255); // Set background to white
    if (val == 0) { // If the serial value is 0,
        fill(0); // set fill to black
        rect(50, 50, 100, 100);
        fill(0); // set fill to light gray
        rect(150,150,100,100);
    } 
    else if(val == 1){ // If the serial value is not 0,
        fill(0); // set fill to black
        rect(50, 50, 100, 100);
        fill(204); // set fill to light gray
        rect(150,150,100,100);
    }
    else if(val == 2){ // If the serial value is not 0,
        fill(204); // set fill to black
        rect(50, 50, 100, 100);
        fill(0); // set fill to light gray
        rect(150,150,100,100);
    }
     else if(val == 3){ // If the serial value is not 0,
        fill(204); // set fill to black
        rect(50, 50, 100, 100);
        fill(204); // set fill to light gray
        rect(150,150,100,100);
    }
    

}
