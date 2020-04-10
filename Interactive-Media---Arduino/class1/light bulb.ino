void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  for(int i = 10 ; i > 0 ; i -= 2){
     pinMode(i, OUTPUT); 
  }
}

// the loop function runs over and over again forever
void loop() {
  for(int i = 0 ; i < 3 ; i++){
    digitalWrite(10, HIGH);
    digitalWrite(8, HIGH);
    digitalWrite(6, HIGH);
    digitalWrite(4, HIGH);
    digitalWrite(2, HIGH);
    delay(200);
    digitalWrite(10, LOW);
    digitalWrite(8, LOW);
    digitalWrite(6, LOW);
    digitalWrite(4, LOW);
    digitalWrite(2, LOW);
  }
  for(int i = 10 ; i > 0 ; i -=2){
   digitalWrite(i, HIGH);
   delay(1000);
   if(i == 2){
      for(int j = i ; j <= 10 ; j+=2){
        digitalWrite(j, LOW);
         delay(1000);
      }
    }
 }// 2
                       // wait for a second
}
