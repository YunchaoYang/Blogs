---
blogpost: true
date: Oct 10, 2024
author: Yunchao Yang
location: World
category: llm
language: English
---

# Flash Attention

## Table of Contents
1. [Intuition and underlying principles ](#Intuitionandunderlyingprinciples)
2. [Original Paper](#Paperreading)
3. [Implementation details](#Implementation-details)
4. [Fourth Example](#fourth-examplehttpwwwfourthexamplecom)

## Intuition and underlying principles

It just means that it does not treat the underlying hardware as a black box. Instead, it leverages the knowledge of the memory hierarchy of the underlying hardware.
what “IO-aware” refers to is the algebraic operations are tailored to match the memory hierarchy inside a GPU.

Depending on this ratio between computation and memory accesses, operations can be classified as either:

- compute-bound (example: matrix multiplication)
- memory-bound (examples: elementwise ops (activation, dropout, masking), reduction ops (softmax, layer norm, sum, etc.)…)

Modern machine learning accelerators all have hardware specialized for matrix-multiplication, such as Nvidia's "Tensor Cores".

<img width="497" alt="image" src="https://github.com/user-attachments/assets/5d54dd06-6ba7-4c23-a11a-9dffca45827a">

So, if you aren't doing matrix multiplication, you'll only be able to achieve 19.5 teraflops instead of the stated 312. Note that this isn't unique to GPUs - in fact, TPUs are even less general than GPUs.

credit to https://horace.io/brrr_intro.html

It turns out attention is (on current AI accelerators) memory-bound.

Why? Because it “mostly consists of elementwise ops” or more accurately the arithmetic density of attention is not very high.


# Paper reading
<img width="497" alt="image" src="https://github.com/user-attachments/assets/5b080b43-ce25-4b5f-a196-816f6c14d539">

The bottleneck in memory read and write. 

<img width="515" alt="image" src="https://github.com/user-attachments/assets/7b2fdc3b-4b69-4b9c-978c-207715cb40b0">

Naive implementation requires repeated R/W from GPU HBM.

Even though matrix multiplication takes the most floating point operations. But the matmul does not take the most of time.

<img width="497" alt="image" src="https://github.com/user-attachments/assets/859f8590-6201-4361-9d7c-bdef0546a06b">

![image](https://github.com/user-attachments/assets/852e5053-571a-4429-9449-d54ce8878e52)

# Implementation details

# Critiques and outlook 
TBD

