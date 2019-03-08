# Docker Image for Blender GPU rendering
This image contains packages needed for running GPU-accelerated Blender on systems with Linux and Nvidia GPU. Blender can run in GUI mode or from command-line.

This image is based on `nvidia/cudagl` and contains **CUDA 10.0 + OpenGL (glvnd 1.0)**. Blender is fetched from repositories by [Thomas Schiex](https://launchpad.net/~thomas-schiex).

Available tags
* `latest` points to `2.80beta`
* `2.80beta`
* `2.79b`

<br>

## Requirements
Your host system needs to have **nvidia-docker2** installed and NVIDIA GPU driver version **>= 410.48**.

<br>

## Running
* Run container with Blender in GUI mode
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -u $(id -u):$(id -g) -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/tmp/blender jtomori/blender_gpu:latest
    ```
* Run container with Blender in command-line mode
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -u $(id -u):$(id -g) -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/tmp/blender jtomori/blender_gpu:latest blender -b project_file.blend # your parameters here
    ```
* Run container with Bash shell
    ```bash
    $ docker run --runtime=nvidia -it --rm -e DISPLAY -u $(id -u):$(id -g) -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)":/tmp/blender jtomori/blender_gpu:latest bash
    ```

<br>

## Notes
* Docker parameter `-v "$(pwd)":/tmp/blender` mounts current working directory to `/tmp/blender` in container
* `-u $(id -u):$(id -g)` sets container user to your user (user which is running the container)
    * this user will not exist in the container *(Bash will issue a warning)* which should be fine but some applications might not work correctly
    * it is however needed for access rights to X server and is useful for permissions and ownership on files created in container
    * if you skip this option then you need to run `$ xhost +local:root` *(only once per system boot is needed)*
        * otherwise you will get this error
            ```
            No protocol specified
            Unable to open a display
            ```
* Default working directory in container is set to `/tmp/blender`