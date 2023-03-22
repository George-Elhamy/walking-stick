#include <NewPing.h>

int trig =12;
int echo =11;
int max_distance = 200;
int vibrate = 7;


NewPing ultra (trig , echo , max_distance) ;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(vibrate ,OUTPUT);


}

void loop() {
  // put your main code here, to run repeatedly:
  int return_distance = ultra.ping();
  int distance = return_distance/US_ROUNDTRIP_CM;
  Serial.print("ping :");
  Serial.println(distance); 

  if (distance < 40 && distance > 1){
    digitalWrite(vibrate ,LOW );
  }
  else {
    digitalWrite(vibrate, HIGH);
  }
  delay(200);

}
