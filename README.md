# Convolution-in-FPGA-Simulated-SystemVerilog

## Overview
This project implements circular convolution for finite-length sequences. Circular convolution is an optimized method of performing convolution on periodic arrays or signals, making it especially efficient for certain signal processing tasks. Using hardware-level parallelism, and properties of periodic signal (specially properties of shifting) the provided code generate convoluted data

## Features
- **Efficient Convolution**: The implementation focuses on optimizing both silicon area and computational efficiency.

## Example

### Process:
The circular convolution is performed on the two sequences as shown below:

![Capture](https://github.com/user-attachments/assets/6f0ce624-3d20-4baa-8c62-5c33908339d8)

### Result:
The resulting convoluted sequence is obtained as follows:

![2](https://github.com/user-attachments/assets/45c9448f-8643-4f76-bb46-03b55c3f1079)
