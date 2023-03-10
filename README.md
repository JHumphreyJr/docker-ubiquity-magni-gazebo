# Ubiquity Magni Simulator Docker Container

Sets up a base docker image for the Ubiquity Magni in an empty world in Gazebo that you can control via teleop_twist and view in rviz.

This image does require x11 support and a GPU is recommended. The easiest way to run this image is through [rocker][rocker].

## Install

### Prerequisites

- [Docker][docker]
- [Nvidia Container Toolkit][nvidia-docker]
- [Rocker][rocker]

After installing installing the docker and nvidia prerequisites, install [rocker][rocker]:

```bash
sudo apt install python3-rocker
```

### Running the image

```
rocker --nvidia --x11 --pull jhumphreyjr/ubiquity-magni-simulator:latest
```

[docker]: https://docs.docker.com/engine/install/ubuntu/
[nvidia-docker]: https://github.com/NVIDIA/nvidia-docker
[rocker]: https://github.com/osrf/rocker
