# RPIPico-PICalc
Calc the value of PI on a Pico.

This is an experiment for my YouTube Channel [DrJonEA](https://youtube.com/@DrJonEA). I wanted to see the effect of using two cores on the Pico in a barebones model and with FreeRTOS. The workload I am using is to calculate the value of PI to 1000 decimal places,which the Pico does in under a second.


There are a number of approaches to calculating the value of PI. I've used the Spigot-type algorithm and an example called [pi_spigot](https://github.com/imahjoub/pi_spigot) by [Iliass Mahjoub](https://github.com/imahjoub).

## Clone and Build
Please clone using the --recurse_submodules switch to include the libraries. We both use the pi_spigot library and FreeRTOS Kernel.

Each of the four projects has its own build files. Use normal Pico SDK build process with cmake.
```
mkdir build
cd build
cmake ..
make
```

## Barebones 1 Core
This is the base example and counts howmany times it can calculate the value of PI in one minute.

## Barebones 2 Core
This is simple handcrafted dual core example. So both cores calculate the value of PI and use the Core FIFO to communicate. 

## 1 RTOS
Using a single core for FreeRTOS Kernel to calculate the value of PI. I  have two worker threads calculating the value of PI but they are both on the same core. So would expect performance to be a little less than the Barebones 1 Core.

## 2 RTOS
Using a dual core configuration of FreeRTOS Kernel, making use of the new V11 merged SMP release. I have four worker threads calculating across the two cores. 

## Results

| Model | PIs Calcs |
| ------------ |------------ |
| 1Core | 184 | 
| 2Core | 360 | 
| 1RTOS | 188 | 
| 2RTOS | 336 | 

Surprised that single core FreeRTOS outperforms single core barebones.
