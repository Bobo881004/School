// Arduino code
const int SIZE = 8;

int buttonState[SIZE] = {0};
int lastButtonState[SIZE] = {0};
int switchPin[SIZE] = {1, 2, 3, 4};
// pin2 = left
// pin3 = right
// pin4 = jump
// pin5 = stop

void setup()
{
  for(int i=0; i<SIZE; i++)
    pinMode(switchPin[i], INPUT); // Set pin 0 as an input

  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop()
{
  int val;

  //int i=1;
  for(int i=0; i<SIZE; i++)
  {
    buttonState[i] = digitalRead(switchPin[i]);

    if(buttonState[i] != lastButtonState[i])
    { // If switch is ON,
      if (buttonState[i] == HIGH)
        val=i+2;
      else  // If the switch is not ON,
        val=0;
      Serial.write(val);
      //Serial.println(val);
    }

    lastButtonState[i] = buttonState[i];
  }

  delay(100); // Wait 100 milliseconds
}
