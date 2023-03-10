FROM osrf/ros:noetic-desktop-full-focal

RUN apt-get update && \
   apt-get upgrade -y && \
   apt-get install -y python3-rosinstall git ros-noetic-teleop-twist-keyboard

# https://learn.ubiquityrobotics.com/noetic_package_repositories
#RUN sh -c 'echo "deb https://packages.ubiquityrobotics.com/ubuntu/ubiquity-testing focal main" > /etc/apt/sources.list.d/ubiquity-latest.list'
# Keyserver issues: https://github.com/tianon/gosu/issues/39
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C3032ED8
#RUN apt-get update
# RUN apt-get install ros-$ROS_DISTRO-magni-robot 

# Ubiquity did not build amd64 packages for magni_robot on focal main, rosinstall is required
RUN mkdir ~/ros_magni_ws && \
   cd ~/ros_magni_ws && \
   rosinstall . /opt/ros/noetic https://raw.githubusercontent.com/UbiquityRobotics/magni_robot/noetic-devel/magni.rosinstall && \
   echo source ~/ros_magni_ws/setup.bash >> ~/.bashrc

CMD [ "/bin/bash", "-c", "source ~/ros_magni_ws/setup.bash && roslaunch magni_gazebo empty_world.launch &> /dev/null & rosrun teleop_twist_keyboard teleop_twist_keyboard.py" ]
