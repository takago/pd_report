#include <avr/io.h>
#include <avr/wdt.h>
int main(void)
{
	DDRC = 0x30;	// PC5/4を出力ピンに設定
	PORTC = 0x10;	// PC5/4の出力をL/Hに設定
	for (;;) {
		wdt_reset();	// ウォッチドックタイマをリセット
	}
	return 0;
}
