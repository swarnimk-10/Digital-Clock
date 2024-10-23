# Digital Clock Design using Verilog

This project implements a **digital clock** using Verilog HDL (Hardware Description Language). The clock is designed to display time in hours, minutes, and seconds, and operates on a 24-hour format. It includes counters for seconds, minutes, and hours, all driven by a clock signal. The clock design follows a modular approach, with separate modules for each time unit, ensuring scalability and ease of modification.

The primary goal of this project is to demonstrate the functionality of sequential circuits and finite state machines using Verilog, while maintaining a clear, hierarchical structure. This digital clock can be synthesized and tested on an FPGA platform for practical applications.

![Screenshot 2024-10-23 172540](https://github.com/user-attachments/assets/8ac5bf72-16c5-4d21-b4f6-611b2122a9c1)

### Digital Clock Module

The **Digital Clock Module** handles the core timing functionality. It takes several inputs such as:
- `Clk`: Clock signal to increment time.
- `en`: Enable signal to start/stop the clock.
- `rst`: Reset signal to initialize the clock.
- `hrup`, `minup`: Signals to manually increment hours and minutes.

This module produces binary outputs representing hours, minutes, and seconds. Hours and minutes are output as 4-bit binary numbers for each digit, while seconds are provided as an 8-bit output (`[7:0] sec`), which can be displayed using LEDs.

### Binary to BCD Converter

The **Binary to BCD Converter Module** converts the binary hour and minute values from the Digital Clock Module into **Binary Coded Decimal (BCD)** format. This conversion allows the time to be displayed on the 7-segment display. The BCD output is broken down into thousands, hundreds, tens, and ones, which are fed into the next stage for display.

### 7-Segment Driver

The **7-Segment Driver Module** takes the BCD outputs and decodes them to drive the **7-segment display**. It translates the BCD digits into display patterns and uses the `seg` and `an` signals to show the time in **HH:MM format** on the **4-digit 7-segment display** of the **Basys 3 board**.
### 7 segment display 

![Screenshot 2024-10-23 182451](https://github.com/user-attachments/assets/c7baec53-7f62-4988-84cf-3ff3936d2d0c)


### Display and Controls

The current time is displayed using a **4-digit 7-segment display** to show hours and minutes, while seconds are shown via LEDs. Users can control the clock with the following buttons and switches:
- `sw`: Switches to adjust time settings.
- `btnC`, `btnU`, `btnR`: Buttons for manual control of the clock (e.g., time reset or increment).

![Screenshot 2024-10-23 224245](https://github.com/user-attachments/assets/3c6cd72b-fbc6-456e-a7f6-61f2c6219a2f)


### Schematic Explanation

#### Inputs and Button Control

- **Button Inputs (`btnC`, `btnU`, `btnR`)**:  
  These buttons control the clock's functionality:
  - **`btnC`**: Resets the clock.
  - **`btnU`**: Increments the hour.
  - **`btnR`**: Increments the minute.

  Each button signal passes through a **debounce circuit** (`dbC`, `dbU`, `dbR`), which removes noise or bouncing from mechanical presses, ensuring that a single, clean signal is sent to the registers for hour and minute adjustments.

- **Switch Input (`sw`)**:  
  The switch (`sw`) serves as an additional input, possibly for toggling modes or enabling specific features, though its exact role is not immediately clear in this schematic.

#### Debouncing and Register Logic

- **Debounce Blocks**:  
  Each button signal (`btnU`, `btnR`, `btnC`) goes through a **debounce** block (`debounce`). This circuit synchronizes the button presses to eliminate false triggers caused by contact bounce, providing a stable output (`pb`) for further processing.

- **Hour and Minute Registers**:  
  The hour (`hrup`) and minute (`minup`) increment signals are stored in registers (`hrup_reg`, `minup_reg`). These registers hold the button states and provide inputs to the clock module for time adjustments.

#### Clock Module

- **Clock Module (`digital_clock`)**:  
  The **digital clock** block implements the core functionality, managing:
  - Hours: (`h2[3:0]`, `h1[3:0]`)
  - Minutes: (`m2[3:0]`, `m1[3:0]`)
  - Seconds: (`s1[3:0]`, `s2[3:0]`)

  It receives inputs for `clk`, `enable`, `hrup`, `minup`, and `rst`, outputting the current time values in binary format for each digit.

#### Seven-Segment Display Driver

- **Seven-Segment Driver (`sevenseg_driver`)**:  
  The time values from the digital clock are sent to the **7-segment driver** (`seg7`), which controls the **7-segment display** on the Basys 3 board.  
  - Inputs (`in1[3:0]`, `in2[3:0]`, `in3[3:0]`, `in4[3:0]`) correspond to the hours and minutes digits.
  - Outputs (`seg[6:0]`, `en[3:0]`) drive the 7-segment display, showing the time in **HH:MM format**.

#### LED Outputs

- **LED Output**:  
  The seconds (`s[7:0]`) are represented using **LEDs** on the board, providing a visual indication of the current seconds count.

#### Additional Control Logic

- **RTL Blocks**:  
  - **RTL_EQ** and **RTL_AND** blocks are employed to create logical conditions for updating hours and minutes, determining if the `hrup` and `minup` signals should trigger an update based on previous states.
  - Registers (`btnUclr_prev_reg`, `hrup_reg`, `minup_reg`) store button states, ensuring smooth and controlled time updates.
