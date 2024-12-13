<h1> NanoProcessor </h1>

This is a very simple microprocessor (hence, called a nanoprocessor) <br>
4-bit processor capable of executing 4 instructions <br>
Whole behavioural design is coded using VHDL.<br>
Processor can be run on a FPGA.

<h3 align ="center" >Instruction Table</h3>

![image](https://github.com/De-Silva-Madhushankha/NanoProcessor/assets/113349359/81ebb87e-fdac-4325-9021-2d4731806f98)
<h2 align = "center"> Architecture </h2>

![image](https://github.com/De-Silva-Madhushankha/NanoProcessor/assets/113349359/201bd595-b50f-40f0-9746-4f0acd109d28)

<h4>Sample machine code</h4>
    example program - countdowm from 10 to 0<br>
        "100010001010", -- MOVI R1,10<br>
        "100100000001", -- MOVI R2,1<br>
        "010100000000", -- NEG R2<br>
        "000010100000", -- ADD R1,R2<br>
        "110010000111", -- JNZ R1,7<br>
        "110000000011", -- JNZ R0,4<br>
        "000000000000", -- <br>
        "ZZZZZZZZZZZZ"  -- High Imp.<br>



