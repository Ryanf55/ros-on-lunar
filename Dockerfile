FROM ubuntu:lunar

# https://docs.ros.org/en/eloquent/Installation/Linux-Development-Setup.html#set-locale
RUN apt update && apt -y install locales \ 
  && locale-gen en_US en_US.UTF-8 \
  && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \ 
  && export LANG=en_US.UTF-8

# https://docs.ros.org/en/eloquent/Installation/Linux-Development-Setup.html#add-the-ros-2-apt-repository
# This must be skipped because lunar does not have a release file
# "1.423 E: The repository 'http://packages.ros.org/ros2/ubuntu lunar Release' does not have a Release file"
#RUN apt update && apt -y install curl gnupg2 lsb-release \ 
#  && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \ 
#  && sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# https://docs.ros.org/en/eloquent/Installation/Linux-Development-Setup.html#install-development-tools-and-ros-tools
RUN apt update && apt install -y \
  build-essential \
  cmake \
  git \
  # E: Unable to locate package python3-colcon-common-extensions \
  # python3-colcon-common-extensions \
  python3-pip \
  # E: Unable to locate package python-rosdep \ 
  # python-rosdep \
  # E: Unable to locate package python3-vcstool
  # python3-vcstool \
  wget  


# install some pip packages needed for testing
# Before this, create a virtual environment
RUN apt update && apt install -y python3-venv && python3 -m venv .rolling && . .rolling/bin/activate
# For the virtual environment to be used in docker, add it to PATH like so:
# https://stackoverflow.com/questions/48561981/activate-python-virtualenv-in-dockerfile
ENV PATH="/.rolling/bin:$PATH"
RUN python3 -m pip install -U \
      argcomplete \
      flake8 \
      flake8-blind-except \
      flake8-builtins \
      flake8-class-newline \
      flake8-comprehensions \
      flake8-deprecated \
      flake8-docstrings \
      flake8-import-order \
      flake8-quotes \
      pytest-repeat \
      pytest-rerunfailures \
      pytest \
      pytest-cov \
      pytest-runner \
      setuptools
# install Fast-RTPS dependencies
# RF - added in apt-update
RUN apt update && apt install --no-install-recommends -y \
    libasio-dev \
    libtinyxml2-dev
# install Cyclone DDS dependencies
# RF - added in apt-update
RUN apt update && apt install --no-install-recommends -y \
    libcunit1-dev









