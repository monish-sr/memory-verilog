# Design and Testbench for Memory using Verilog
This project implements a parameterized synchronous memory module in Verilog along with a testbench for functional verification. The design supports configurable depth and data width, and demonstrates basic read/write operations using a valid-ready handshake mechanism. It serves as a simple example of memory modeling and testbench development in digital design.

## Overview
This project implements a parameterized synchronous memory module in Verilog along with a testbench to verify its functionality.

***The design supports configurable:***

  • Memory depth
  
  • Data width
  
  • Address width

***It demonstrates fundamental concepts like:***

  • Synchronous reset
  
  • Read/Write operations
  
  • Handshaking using valid and ready signals

## Design Details
### Memory Module

The memory is implemented as a register array:

  • Depth: Number of memory locations
  
  • Width: Size of each memory word
  
  • Address Width: Automatically calculated using $clog2(depth)

### Key Features

  • Synchronous active-high reset

  • Write operation when wr_rd_i = 1

  • Read operation when wr_rd_i = 0

  • Valid-Ready handshake mechanism

  • Memory initialized to zero on reset
