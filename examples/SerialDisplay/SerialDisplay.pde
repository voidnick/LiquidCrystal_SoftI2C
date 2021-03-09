/*
 * Displays text sent over the serial port (e.g. from the Serial Monitor) on
 * an attached LCD.
 */

/*
 * WAVGAT Nano 3.0 / LGT8F328P-LQFP32 MiniEVB
 * SDA -> D4
 * SCL -> D5
 * More info: https://www.arduino.cc/en/Reference/PortManipulation
 */
/*#define SDA_PORT PORTD
#define SDA_PIN 4
#define SCL_PORT PORTD
#define SCL_PIN 5
#define I2C_FASTMODE 1*/

/*
 * (!)Force use SlowSoftI2CMaster instead  SoftI2CMaster
 * WAVGAT Nano 3.0 / LGT8F328P-LQFP32 MiniEVB
 * SDA -> D4
 * SCL -> D5
 * More info: https://www.arduino.cc/en/Reference/PortManipulation
 */
/*#define _SLOW_SOFT
#define _SDA 4
#define _SCL 5*/

/*
 * ESP-01 (ESP8266)
 * SDA -> GPIO1 (TX)
 * SCL -> GPIO3 (RX)
 */
/*#define _SDA 1
#define _SCL 3*/

/*
 * ESP-01 (ESP8266)
 * SDA -> GPIO0
 * SCL -> GPIO2
 */
/*#define _SDA 0
#define _SCL 2*/

#include <LiquidCrystal_SoftI2C.h>

LiquidCrystal_SoftI2C lcd(0x27, 16, 2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

void setup()
{
  lcd.init();  // initialize the lcd 
  lcd.backlight();
  Serial.begin(9600);
}

void loop()
{
  // when characters arrive over the serial port...
  if (Serial.available()) {
    // wait a bit for the entire message to arrive
    delay(100);
    // clear the screen
    lcd.clear();
    // read all the available characters
    while (Serial.available() > 0) {
      // display each character to the LCD
      lcd.write(Serial.read());
    }
  }
}
