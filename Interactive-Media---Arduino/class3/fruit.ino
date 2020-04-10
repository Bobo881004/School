int speakerOut = 9;
int tone01 = 2028;
int sensorValue = 0;
int outputValue = 0;
const int analogInPin = A0;
const int analogInPin1 = A1;
int tmp = 0;
int ans = 0;
int delayValue,A1Value;
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  for(int i = 6 ; i >= 2 ; i--){
     pinMode(i, OUTPUT); 
  }
  pinMode(speakerOut, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  sensorValue = analogRead(analogInPin);
  outputValue = map(sensorValue, 0, 1023, 0, 255);
  A1Value =  analogRead(analogInPin1);
  delayValue = map(A1Value, 0, 1023, 100, 500);
  Serial.print("sensor = ");
  Serial.print(sensorValue);
  Serial.print("\t output = ");
  Serial.println(outputValue);
  Serial.print(delayValue);


    if(tmp == 0){
      for(int i = 2 ; i <= 6 ; i++){
        if(sensorValue < 500){
         sensorValue = analogRead(analogInPin);
          if(sensorValue < 100){
            digitalWrite(i, HIGH);
            delay(1000);
            tmp = 1;
            ans = i;
            break;  
          }
          else{
            digitalWrite(i, HIGH);
            delay(delayValue);
            digitalWrite(i, LOW);
          }
       }
      }     
    }

    
    if(ans == 5){
      digitalWrite(speakerOut,HIGH);
      delayMicroseconds(tone01 / 2);
      digitalWrite(speakerOut, LOW);
      delayMicroseconds(tone01 / 2);
    }
    sensorValue = analogRead(analogInPin);
    
    if(sensorValue > 100){
      digitalWrite(ans, LOW);
      tmp = 0;
      ans = 0;
    }
}
