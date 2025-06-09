# Supplemental code for "An axonal brake on striatal dopamine output by cholinergic interneurons"

------------------
## Contents
* [Project Overview](#project-overview)
* [File Structure](#file-structure)
* [License and citation](#license-and-citation)
* [Acknowledgements](#acknowledgements)

------------------
## Project Overview
This repository contains MATLAB scripts that run a computational simulation of dopamine (DA) release in a neural circuit, considering the effects of cholinergic interneurons (Chl) inhibition and desensitization. These scripts were custom-written by Yan-Feng Zhang and used in the study ["An axonal brake on striatal dopamine output by cholinergic interneurons"](https://www.biorxiv.org/content/10.1101/2024.05.15.594341v1).

------------------
## System Requirements
Any computer using an operating system capable of running MATLAB.

**Hardware Requirements**
The computational power needed to run the MATLAB script should be well within the capacities of mid-range laptop computers, with, for example:

    * 8gb of RAM 
    * processor with 4 cores of 4.00+GHz 

**Software Requirements**
MATLAB can be installed on machines running Windows, macOS or Linux. MATLAB software requires a paid subscription to be used. More details [here](https://uk.mathworks.com/products/matlab.html).

------------------
## File Structure
The following files are included in this repository:

**FCV**: Analysis of Fast-scan Cyclic Voltammetry (FCV) outputs.

**Patch-Clamp**: Plot electrophysiology traces from patch-clamp experiments. 

**Maths_Model**: All original MATLAB code used for mathemical predictions of geometrically expected mean minimum distances between ChIs or SPNs and their nearest astrocyte.

      *Models ChI Inhibition:* Defines time-varying inhibition levels in the DLS and NAcc, and incorporates a dynamic inhibition profile with initial strong inhibition and subsequent gradual decline.
    
      *Simulates ChI and DA Firing Rates:* Defines baseline and phasic firing rates for ChI and DA neurons, and includes a simulated burst of ChI activity.
    
      *Calculates Desensitization:* Models the desensitization of both DLS and NAcc to ChI inhibition over time.
    
      *Determines Inhibition Efficiency:* Defines a function to map ChI firing rate to inhibition efficiency.
    
      *Calculates ChI-Dependent Depression:* Calculates the level of depression in both DLS and NAcc based on ChI inhibition and desensitization.
    
      *Calculates Effective Dopamine Firing:* Determines the effective dopamine firing rate in DLS and NAcc, accounting for inhibition and desensitization.

**GRAB_imaging**: Measure fluorescence changes in GRAB sensor images. 

------------------
## License and Citation
This repository is released under the [MIT License](https://opensource.org/license/mit) - see the [LICENSE](LICENSE) file for details.

If you use use this computational model in your research, please cite:

Zhang, (2024) - Rapid modulation of striatal cholinergic interneurons and dopamine release by satellite astrocytes.  

------------------
## Acknowledgements
This research was funded in part by Aligning Science Across Parkinson’s [ASAP-020370] through the Michael J. Fox Foundation for Parkinson’s Research (MJFF).

Text from Yan-Feng

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

