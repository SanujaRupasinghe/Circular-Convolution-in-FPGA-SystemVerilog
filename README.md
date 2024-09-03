# Convolution-in-FPGA-Simulated-SystemVerilog

## Overview
This is about implementing circular convolution for finite-length sequences. Circular convolution is an optimized method of performing convolution on finite length arrays or signals, making it especially efficient for certain signal processing tasks. Using hardware-level parallelism, and properties of periodicity (specially properties of shifting) the provided code generate convoluted data

## Features
- **Efficient Convolution**: The implementation focuses on optimizing both silicon area and computational efficiency.

## Example

### Process:
A state machine is implemented for the following task:
The circular convolution is performed on the two sequences as shown below:

<div style="display: flex; justify-content: space-between;">
    <img src="https://github.com/user-attachments/assets/a4009d8c-c2e9-4685-a9ff-3d34415022a1" alt="State Machine" style="width: 35%;">
    <img src="https://github.com/user-attachments/assets/6f0ce624-3d20-4baa-8c62-5c33908339d8" alt="Circular Convolution" style="width: 64%;">
</div>


### Result:
The resulting convoluted sequence is obtained as follows:

![2](https://github.com/user-attachments/assets/45c9448f-8643-4f76-bb46-03b55c3f1079)

### Convolution Implementation

#### 1. Single-Cycle Convolution
Performs the entire convolution in one clock cycle. Requires many multipliers. High-performance designs with ample hardware resources.

#### 2. Multi-Cycle Convolution
Spreads the convolution over several clock cycles, using only a few multipliers. Requires fewer multipliers, with a cycle count equal to the length of array `A + B - 1`. Resource-efficient designs where hardware is limited.
