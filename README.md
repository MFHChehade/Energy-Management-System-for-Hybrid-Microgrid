# Energy-Management-System-for-Hybrid-Microgrid
This work develops a simple energy management algorithm for a residential hybrid system consisting of PV, battery storage, unreliable grid and a diesel generator.

The work constructs this algorithm from scratch using the basic equations that govern the operation of the different components of the system.

- The work proposes a model for the unreliable utility grid in Lebanon.
- The project uses an HDKR model to compute the solar radiation. 
- The algorithm prioritizes the most economical available sources.
- The system takes into consideration battery health and charging/discharging times. 
- The system ensures minimal use of diesel generators and completely eliminates their contribution during some days of the summer.

## Steps
- Run the "EDL.ipynb" Jupyter notebook. This program models the grid availability for the case of Lebanon. It stores the output in a spreadsheet that is named "EDL.csv", which will be used by the algorithm.
- Run the "Irradiance_Calculation.m" MATLAB file. This file imports the HDKR_Model.m" file and calculates the solar irradiance from multiple parameters that include panel coordinates using the HDKR model. These parameters are found in the spreadsheet "radiation_data.csv". The calculated irradiance will be stored in the spreadsheet "solar_irradiance.csv". 
- Run the "algorithm.mlx" MATLAB Live Script. This algorithm uses the provided files "Temperature.csv" and "Load.csv" as well as the files created in the previous steps "EDL.csv" and "solar_irradiance.csv". It finds the best contribution of each resource in the system to the load demand.
- Additionaly, run the "Sensitivity Analysis for Battery-Diesel Trade-off.mlx" MATLAB Live Script. This program is very similar to the algorithm file above, but in this case, multiple runs of the algorithm are performed, each time varying the size of batteries and observing the effect of this variation on the contribution of the diesel generator to the system. The result plot is found at the end of the script, where the trade-off between the size of the battery and the contribution of diesel is apparent. This could be a good method to determine the best size of the battery, by choosing to operate at the knee of the plotted curve. However, it should be noted that the aim of this work is not to determine the best sizing for the system components but to find the best coordination between the resources of sizes already given. 

## Report and Presentation
Kindly also find a report on the matter in "Report.pdf" and a presentation file in "Presentation.pdf". 
