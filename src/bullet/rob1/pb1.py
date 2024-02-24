import pybullet as p
import pybullet_data
import time
import math

# Connect to PyBullet
p.connect(p.GUI)
p.setGravity(0, 0, -10)
p.setAdditionalSearchPath(pybullet_data.getDataPath())

# Load the ground plane
planeId = p.loadURDF("plane.urdf")

# Load the robot arm URDF
# Ensure this path is correct for your setup
robotArmId = p.loadURDF("simple_robot_arm.urdf", [0, 0, 0], useFixedBase=1)

# Run the simulation
for i in range(3000):
    p.stepSimulation()
    
    # Control the base-to-upper arm joint (shoulder-like motion)
    shoulderPosition = math.sin(i * 0.02) * 0.5
    p.setJointMotorControl2(robotArmId, 0, p.POSITION_CONTROL, targetPosition=shoulderPosition)
    
    # Control the upper-to-lower arm joint (elbow-like motion)
    # The elbow's motion is typically dependent on the shoulder's position or a separate control scheme
    if i < 1500:
        elbowPosition = math.fabs(math.sin(i * 0.02))  # Simple example to flex and extend the elbow
    else:
        elbowPosition = math.fabs(math.sin(i * 0.01))  # Change the rate for demonstration
    p.setJointMotorControl2(robotArmId, 1, p.POSITION_CONTROL, targetPosition=elbowPosition)
    
    time.sleep(1./240.)

p.disconnect()
