# A Collection of Code Examples in AVR Assembler

## Table of Contents

* **turn_on_led**  
Turning on a single led connected to port B pin 7 (pb7). This happens to be the build-in led (L) on the Arduino Mega board.

* **blink_a_led**  
Blinking leds connected to port A with a delay of approximately 200 ms. This example uses a busy-wait delay with a fixed execution time implemented as a macro.

* **add_two_8_bit_values**  
Adding two 8 bit values and writing the result on port A

* **read_from_switch**  
    * Reading values from switches connected to port C and writing the result to port A. This example uses the internal pull-up resistors of the atmega mcu, and therefore the result we read are inverted (0 means a switch is pressed). To output a more intuitive result the value is inverted before written to port A.  
    * **read_from_switch_debounced**  
    Reading from switch and shifting 1 left and right accordingly. This example demonstrates how we can wait for a keypress and also do a simple form of button debouncing in software.  

* **countdown**  
Countdown to zero displayed on the leds. This example uses a delay loop implemented as a subroutine.

* **array_like_data_structure**  
Example showing how data could be written to and read from memory in an array-like manner. Execute in the simulator to see the data getting stored into memory.

* **bubble_sort**  
A bubble sort algorithm implemented in assembler. A sequence of data is loaded from program memory, placed in RAM and sorted. Execute in simulator to see how data is sorted. 

* **calling_convention**  
An example showing how to pass parameters and recieve a return value using a calling convention when doing subroutine calls. The result is written to port A.
