%% Readme File: Dopamine Release Calculation with ChI Inhibition and Desensitization

This MATLAB script simulates dopamine release in a neural circuit, considering the effects of ChI inhibition and desensitization. 

**Key Features:**

* **Models ChI Inhibition:** 
    * Defines time-varying inhibition levels in the DLS and NAcc.
    * Incorporates a dynamic inhibition profile with initial strong inhibition and subsequent gradual decline.
* **Simulates ChI and DA Firing Rates:** 
    * Defines baseline and phasic firing rates for ChI and DA neurons.
    * Includes a simulated burst of ChI activity.
* **Calculates Desensitization:**
    * Models the desensitization of both DLS and NAcc to ChI inhibition over time.
* **Determines Inhibition Efficiency:**
    * Defines a function to map ChI firing rate to inhibition efficiency.
* **Calculates ChI-Dependent Depression:** 
    * Calculates the level of depression in both DLS and NAcc based on ChI inhibition and desensitization.
* **Calculates Effective Dopamine Firing:** 
    * Determines the effective dopamine firing rate in DLS and NAcc, accounting for inhibition and desensitization.

**Usage:**

1. Run the script in MATLAB.
2. The script will generate:
    * Time-varying inhibition levels in DLS and NAcc.
    * Simulated ChI and DA firing rates.
    * Calculated desensitization scores.
    * Calculated ChI-dependent depression scores.
    * Calculated effective dopamine firing rates in DLS and NAcc.
3. The script includes commented-out plotting commands for visualization. 
    * Uncomment and modify these lines to plot the desired results.

**Note:**

* This is a simplified model and may not fully capture the complexities of the biological system.
* The parameters and functions used in the script can be adjusted to explore different scenarios and investigate the impact of various factors on dopamine release.

This script provides a framework for understanding the interplay between ChI inhibition, desensitization, and dopamine release. It can be further expanded and refined to incorporate additional biological details and explore more complex scenarios.

**Author:Yanfeng Zhang
**Date:08/01/2025
