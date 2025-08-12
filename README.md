# Satellite Navigation Simulation Using GNSS

This MATLAB project provides a detailed simulation of a Satellite Navigation System based on GNSS (Global Navigation Satellite System) technology. The system estimates the user’s position by calculating pseudorange measurements between multiple satellites and a receiver located on or near the Earth's surface.

# Project Overview
The simulation starts by defining the positions of several satellites in Earth-Centered Earth-Fixed (ECEF) coordinates. It then generates pseudorange measurements, which are the distances between each satellite and the user receiver, affected by simulated measurement noise to reflect real-world inaccuracies.

Using these noisy pseudorange values, the system formulates a set of linear equations solved via a least squares algorithm to estimate the user's three-dimensional position (X, Y, Z) and clock bias. This method is a simplified approach to positioning in GNSS, showcasing how satellite signals can be used to determine a location accurately despite measurement errors.

# Key Features
Satellite Positioning: The simulation includes realistic satellite coordinates in ECEF format.

Pseudorange Calculation: Adds Gaussian noise to simulate real measurement uncertainties.

Least Squares Estimation: Computes the user’s position and clock bias by solving an overdetermined system.

Visualization: 3D plots of satellite positions, true user position, and the estimated position, along with connecting lines illustrating satellite-user links.

Educational Tool: Helps users understand the fundamental concepts of GNSS positioning and the effect of measurement noise on accuracy.

# Applications
This simulation is useful for engineers, students, and researchers interested in satellite navigation, signal processing, and positioning algorithms. It can serve as a base for further studies in improving accuracy, testing alternative algorithms, or understanding GNSS system limitations.

# How to Use
Modify the satellite positions or user true position as needed.

Run the MATLAB script to perform the simulation.

Analyze the output position estimates and visualization to assess system performance.

<img width="1274" height="743" alt="image" src="https://github.com/user-attachments/assets/72d31013-865a-4991-8995-ff3d1a97b330" />
