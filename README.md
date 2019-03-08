# Docker Image for Blender GPU rendering
This image contains packages needed for running GPU-accelerated Blender on systems with Linux and Nvidia GPU. Blender can run in GUI mode or from command-line.

This image is based on `nvidia/cudagl` and contains **CUDA 10.0 + OpenGL (glvnd 1.0)**. Blender is fetched from repositories by [Thomas Schiex](https://launchpad.net/~thomas-schiex).

Available tags
* `latest` points to `2.80beta`
* `2.80beta`
* `2.79b`

Workdir in container is set to `/tmp/blender`.

<br>

## Requirements
Your host system needs to have **nvidia-docker2** installed and NVIDIA GPU driver version **>= 410.48**.

<br>

## Running
* Set up permissions *(needs to be done only once per boot)*
    ```bash
    $ xhost +local:root
    ```
* Run container with Blender in GUI mode *(current directory will be mounted as `/tmp/blender` in the container)*
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/tmp/blender jtomori/blender_gpu:latest
    ```
* Run container with Blender in command-line mode *(current directory will be mounted as `/tmp/blender` in the container)*
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/tmp/blender jtomori/blender_gpu:latest blender -b project_file.blend # your parameters here
    ```
* Run container with Bash shell *(current directory will be mounted as `/tmp/blender` in the container)*
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/tmp/blender jtomori/blender_gpu:latest bash
    ```

<br>

## Todo
* Run container as host user - for file permissions on created files