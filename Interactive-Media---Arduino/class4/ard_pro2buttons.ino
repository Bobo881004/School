int buttonState = 0;
int lastButtonState = 0;

int buttonState2 = 0;
int lastButtonState2 = 0;

int switchPin = 4;
int switchPin2 = 2;// Switch connected to pin 4

void setup() {
pinMode(switchPin, INPUT);// Set pin 0 as an input
pinMode(switchPin2, INPUT);// Set pin 0 as an input
Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
 int val;
 int val2;
 int k;
 buttonState =digitalRead(switchPin);
 buttonState2 =digitalRead(switchPin2);
if (buttonState != lastButtonState) { // If switch is ON,
  if (buttonState == HIGH)
     val=1;
   else  // If the switch is not ON,
     val=0;
//Serial.println(val);
}
if (buttonState2 != lastButtonState2) { // If switch is ON,
  if (buttonState2 == HIGH)
     val2=1;
   else  // If the switch is not ON,
     val2=0;
//Serial.println(val);
}
if (val ==  0 && val2 == 0)
k =0;
if (val == 0 && val2  ==  1)
k =1;
if (val ==  1 && val2  ==  0)
k =2;
if (val ==  1 && val2  ==  1)
k = 3;

if (buttonState != lastButtonState || buttonState2 != lastButtonState2)
  Serial.write(k);

lastButtonState = buttonState;
lastButtonState2 = buttonState2;
delay(100); // Wait 100 milliseconds
}
