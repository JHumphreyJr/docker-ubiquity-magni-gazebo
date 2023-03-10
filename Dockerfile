FROM osrf/ros:noetic-desktop-full-focal

RUN apt-get update && \
   apt-get upgrade -y && \
   apt-get install -y python3-rosinstall git ros-noetic-teleop-twist-keyboard

# Ubiquity did not build amd64 packages for magni_robot on focal main, rosinstall is required
RUN mkdir ~/ros_magni_ws && \
   cd ~/ros_magni_ws && \
   rosinstall . /opt/ros/noetic https://raw.githubusercontent.com/UbiquityRobotics/magni_robot/noetic-devel/magni.rosinstall && \
   echo source ~/ros_magni_ws/setup.bash >> ~/.bashrc

CMD [ "/bin/bash", "-c", "source ~/ros_magni_ws/setup.bash && roslaunch magni_gazebo empty_world.launch &> /dev/null & rosrun teleop_twist_keyboard teleop_twist_keyboard.py" ]
