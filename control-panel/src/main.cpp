#include "arduino.h"
const int button1Pin = 2, button2Pin = 3, button3Pin = 4, button4Pin = 5;
const char key1, key2, key3, key4;
void setup(){
  pinMode(button1Pin, INPUT);
  Keyboard.begin();

}
void loop(){
  if(digitalRead(button1Pin) == 0){
    Keyboard.print(key1);
  }if(digitalRead(button2Pin) == 0){
    Keyboard.print(key2);
  }if(digitalRead(button3Pin) == 0){
    Keyboard.print(key3);
  }if(digitalRead(button1Pin)== 0){
    Keyboard.print(key4);
  }
}
\
