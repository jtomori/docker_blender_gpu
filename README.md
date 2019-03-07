# Docker Image for Blender GPU rendering
This image contains packages needed for running GPU-accelerated apps and Blender on systems with Linux and Nvidia GPU.

Blender version: **2.8**

This image is based on `nvidia/cudagl:10.0-base-ubuntu18.04` and contains **CUDA 10.0 + OpenGL (glvnd 1.0)**. 

<br>

## Requirements
Your host system needs to have **nvidia-docker2** installed and NVIDIA GPU driver version **>= 410.48**.

<br>

## Running
* Set up permissions *(needs to be done only once per boot)*
    ```bash
    $ xhost +local:root
    ```
* Run container with Blender
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix jtomori/blender_gpu
    ```
