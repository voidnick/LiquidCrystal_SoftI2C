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

uint8_t bell[8]  = {0x4,0xe,0xe,0xe,0x1f,0x0,0x4};
uint8_t note[8]  = {0x2,0x3,0x2,0xe,0x1e,0xc,0x0};
uint8_t _clock[8] = {0x0,0xe,0x15,0x17,0x11,0xe,0x0};
uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0};
uint8_t duck[8]  = {0x0,0xc,0x1d,0xf,0xf,0x6,0x0};
uint8_t check[8] = {0x0,0x1,0x3,0x16,0x1c,0x8,0x0};
uint8_t cross[8] = {0x0,0x1b,0xe,0x4,0xe,0x1b,0x0};
uint8_t retarrow[8] = {	0x1,0x1,0x5,0x9,0x1f,0x8,0x4};
  
LiquidCrystal_SoftI2C lcd(0x27, 16, 2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

void setup()
{
  lcd.init();                      // initialize the lcd 
  lcd.backlight();
  
  lcd.createChar(0, bell);
  lcd.createChar(1, note);
  lcd.createChar(2, _clock);
  lcd.createChar(3, heart);
  lcd.createChar(4, duck);
  lcd.createChar(5, check);
  lcd.createChar(6, cross);
  lcd.createChar(7, retarrow);
  lcd.home();
  
  lcd.print("Hello world...");
  lcd.setCursor(0, 1);
  lcd.print("   I ");
  lcd.printByte(3);
  lcd.print(" arduinos!");
  delay(5000);
  displayKeyCodes();
  
}

// display all keycodes
void displayKeyCodes(void) {
  uint8_t i = 0;
  while (1) {
    lcd.clear();
    lcd.print("Codes 0x"); lcd.print(i, HEX);
    lcd.print("-0x"); lcd.print(i+16, HEX);
    lcd.setCursor(0, 1);
    for (int j=0; j<16; j++) {
      lcd.printByte(i+j);
    }
    i+=16;
    
    delay(4000);
  }
}

void loop()
{

}

