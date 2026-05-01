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

  • **Depth:** Number of memory locations
  
  • **Width:** Size of each memory word
  
  • **Address Width:** Automatically calculated using $clog2(depth)

### Key Features

  • Synchronous active-high reset

  • Write operation when wr_rd_i = 1

  • Read operation when wr_rd_i = 0

  • Valid-Ready handshake mechanism

  • Memory initialized to zero on reset

## Working Principle
### ✔ Reset Phase
  • ***When rst_i = 1:***
  
--------> Memory is cleared

--------> ready_o and rdata_o are reset

### ✔ Write Operation
  • ***Triggered when:***
  
--------> valid_i = 1

--------> wr_rd_i = 1

  • ***Data (wdata_i) is written to mem[addr_i]***
  
### ✔ Read Operation

  • ***Triggered when:***
  
--------> valid_i = 1

--------> wr_rd_i = 0

  • ***Data from mem[addr_i] is assigned to rdata_o***
  
### ✔ Handshake Logic

  • ready_o is asserted when the module accepts a valid request
  
  • Ensures controlled data transfer

## Testbench Description

The testbench verifies functionality using task-based stimulus generation.

### Tasks Implemented
#### ✔ Reset Task

  • Initializes all signals

  • Applies reset for 2 clock cycles

#### ✔ Write Task

  • Writes random data to all memory locations

  • Iterates through entire address space

  • Waits for ready_o before proceeding

#### ✔ Read Task

  • Reads data sequentially from all addresses

  • Verifies stored values
