# Resources for Linux on checkm8able iDevices

* [How to build and boot Linux on my iDevice?](HOWTO.md)
-----

## Feature matrix
```
✓ - fully supported
P - partially supported
X - not supported
- - not available
```
|               	| A7 	| A8 	| A8X 	| A9 	| A9X 	| A10 	| A10X 	| T2 	| A11 	|
|:-------------:	|:--:	|:--:	|:---:	|:--:	|:---:	|:---:	|:----:	|:--:	|:---:	|
|      Boot     	|  ✓ 	|  ✓ 	|  ✓  	|  ✓ 	|  ✓  	|  ✓  	|   ✓  	|  ? 	|  ✓  	|
|      UART     	|  ✓ 	|  ✓ 	|  ✓  	|  ✓ 	|  ✓  	|  ✓  	|   ✓  	|  ✓ 	|  ✓  	|
|     GPIOs     	|  ✓ 	|  ✓ 	|  ✓  	|  ✓ 	|  ✓  	|  ✓  	|   ✓  	|  ✓ 	|  ✓  	|
|      USB      	|  P 	|  P 	|  P  	|  P 	|  P  	|  P  	|   P  	|  ? 	|  P  	|
|      I2C      	|  ✓ 	|  ✓ 	|  ✓  	|  ✓ 	|  ✓  	|  ✓  	|   ✓  	|  ✓ 	|  ✓  	|
|      SPI      	|  ? 	|  ? 	|  ?  	|  ? 	|  ?  	|  ?  	|   ?  	|  ? 	|  ?  	|
|      DART     	|  ? 	|  ? 	|  ?  	|  ? 	|  ?  	|  ?  	|   ?  	|  ? 	|  ?  	|
|    CPUFreq    	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|      SMP      	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|  DDR scaling  	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|  Gate clocks  	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
| Power domains 	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|   NVMe/NAND   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|      PCIe     	|  - 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|    Buttons    	|  ✓ 	|  ✓ 	|  ✓  	|  ✓ 	|  ✓  	|  ✓  	|   ✓  	|  - 	|  X  	|
|  Touchscreen  	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|   Backlight   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|    Sensors    	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|   Front cam   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|    Rear cam   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|   LED flash   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|    Speaker    	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|   3.5mm jack  	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|  Touch/FaceID 	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
| Lightning mux 	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|    Vibrator   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|  Temp sensors 	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|    Baseband   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|   VENC/VDEC   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|    GPU kekw   	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  - 	|  X  	|
|   Fuel gauge  	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
|    Charger    	|  X 	|  X 	|  X  	|  X 	|  X  	|  X  	|   X  	|  X 	|  X  	|
## What about Android?
We may attempt to port Android (and LineageOS/CyanogenMod) as well to Apple devices in the future, however it may or may not succeed.
