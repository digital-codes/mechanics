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
planeId = p.loadURDF("plane.urdf")

# Load the robot arm URDF
# Ensure this path is correct for your setup
robotArmId = p.loadURDF("arm2.urdf", [0, 0, 0], useFixedBase=1)


# Set the camera position and orientation
# Set up the video recording
# logId = p.startStateLogging(p.STATE_LOGGING_VIDEO_MP4, "robotArmSim.mp4")
# doesn't work. openh264 available but not x264. 

# Set up the camera view
viewMatrix = p.computeViewMatrixFromYawPitchRoll(cameraTargetPosition=[0,0,0],
                                                 distance=10.0,
                                                 yaw=0,
                                                 pitch=-30,
                                                 roll=0,
                                                 upAxisIndex=2)
projectionMatrix = p.computeProjectionMatrixFOV(fov=60,
                                                 aspect=float(960) /720,
                                                 nearVal=0.1,
                                                 farVal=100.0)
#p.configureDebugVisualizer(p.COV_ENABLE_SINGLE_STEP_RENDERING)  # This line is important to get the images

# Placeholder for the image file names
first_image_file = "./first_position.png"

# Take the first image  (before the simulation starts)  
# Take the first image (before the simulation starts)
width, height, rgbImg, depthImg, segImg = p.getCameraImage(width=960, height=720, viewMatrix=viewMatrix, projectionMatrix=projectionMatrix)

# Convert the image data to a PIL image
image = Image.fromarray(np.array(rgbImg))

# Save the image
image.save(first_image_file)

if True:
    # Run the simulation
    for i in range(3000):
        p.stepSimulation()

        # control joint rotations        
        shoulderPosition = math.sin(i * 0.01) * -0.3
        p.setJointMotorControl2(robotArmId, 0, p.POSITION_CONTROL, targetPosition=shoulderPosition)
        
        # Control the base-to-upper arm joint (shoulder-like motion)
        shoulderPosition = math.sin(i * 0.02) * 0.5
        p.setJointMotorControl2(robotArmId, 1, p.POSITION_CONTROL, targetPosition=shoulderPosition)
        
        # Control the upper-to-lower arm joint (elbow-like motion)
        # The elbow's motion is typically dependent on the shoulder's position or a separate control scheme
##        if i < 1500:
##            elbowPosition = math.fabs(math.sin(i * 0.02))  # Simple example to flex and extend the elbow
##        else:
##            elbowPosition = math.fabs(math.sin(i * 0.01))  # Change the rate for demonstration
##        p.setJointMotorControl2(robotArmId, 2, p.POSITION_CONTROL, targetPosition=elbowPosition)
        
        time.sleep(1./240.)

    p.disconnect()

