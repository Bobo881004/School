int speakerOut = 9;
int tone;

void setup() {
pinMode(speakerOut, OUTPUT);

}

void loop() {

tone = 2028;

digitalWrite(speakerOut,HIGH);
delayMicroseconds(tone / 2);
digitalWrite(speakerOut, LOW);
delayMicroseconds(tone / 2);

}
