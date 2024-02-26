import pybullet as p
import pybullet_data
import time
import math
from PIL import Image
import numpy as np
import sys 

# Connect to PyBullet
p.connect(p.GUI)
p.setGravity(0, 0, -10)
p.setAdditionalSearchPath(pybullet_data.getDataPath())

# Load the ground plane
#planeId = p.loadURDF("plane.urdf")

#logId = p.startStateLogging(p.STATE_LOGGING_VIDEO_MP4, "test1.webm")

# Load the robot arm URDF
# Ensure this path is correct for your setup
robotArm = p.loadURDF("test1.urdf", [0, 0, 0], useFixedBase=0)

# Set the target velocity to a non-zero value
p.setJointMotorControl2(robotArm, 0, p.VELOCITY_CONTROL, targetVelocity=0, force=0)
p.setJointMotorControl2(robotArm, 1, p.VELOCITY_CONTROL, targetVelocity=0, force=0)


# Run the simulation
for i in range(3000):
    p.stepSimulation()

    
    time.sleep(1./240.)

p.disconnect()

