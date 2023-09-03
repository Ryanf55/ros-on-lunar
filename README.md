# ros-on-lunar

Building ROS 2 on Ubuntu Lunar (23). The version is set with a docker build arg. Python virtual environments are used.

Why? Ubuntu 23 is a pre-requisite to ubuntu 24, which is what J-turtle targets. Also, before ubuntu 22.10, booting new Linux hardware on Ubuntu 22 was impossible, so Ubuntu 23 was used because it came with Linux Kernel 6.

| ROS 2 Distribution | Command |
| - | - |
| humble | `docker build -t lunar-humble --build-arg ROS_DISTRO=humble .` |
| iron | `docker build -t lunar-humble --build-arg ROS_DISTRO=iron .` |
| rolling | `docker build -t lunar-humble --build-arg ROS_DISTRO=rolling .` |


## Related Issues

* https://github.com/ament/ament_cmake/pull/328
* https://github.com/ros2/rosidl/issues/491
* https://github.com/ros2/ros2/issues/1094
* https://github.com/ros2/ros2/issues/1452
* https://www.qt.io/blog/qt-5.15-support-ends#:~:text=Qt%205.15%20LTS%20was%20a,published%20yesterday%2C%20May%2025th%202023.