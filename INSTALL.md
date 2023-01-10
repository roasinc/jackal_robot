# Installation on ROS Humble / Ubuntu 22.04LTS

## Install packages

Install vcs
```
$ sudo apt-get install python3-vcstool
```

Clone packages
```
$ mkdir -p ~/jackal_ws/src
$ cd ~/jackal_ws
$ wget https://raw.githubusercontent.com/roasinc/jackal_robot/humble-devel/dependencies.repos
$ vcs import src < dependencies.repos
```

Install additional dependencies
```
$ rosdep install --from-paths src --ignore-src -r -y
```

## Build

```
$ cd ~/jackal_ws
$ colcon build --symlink-install
```

## Update Firmware

- Install dfu_util
    ```
    $ sudo apt install dfu-util
    ```
- Open the lid of jackal robot. And then, change mode switch to ALT, press RESET button.

- Start updating firmware
    ```
    $ cd ~/jackal_ws/src/jackal_robot/firmware
    $ ./jackal_firmware_flash.sh
    ```

- Change mode switch to NORMAL, press RESET or Power Off/On Robot.


## setting udev rules
```
$ sudo cp ~/jackal_ws/src/jackal_robot/udev/99-jackal-robot.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

## Setup micro-ros-agent
```
$ cd ~/jackal_ws
$ ros2 run micro_ros_setup create_agent_ws.sh
$ ros2 run micro_ros_setup build_agent.sh
$ colcon build --symlink-install
```

## launch Jackal robot

! ROS_DOMAIN_ID must be 0.
```
export ROS_DOMAIN_ID=0
```

```
$ ros2 launch jackal_robot bringup.launch.py
```