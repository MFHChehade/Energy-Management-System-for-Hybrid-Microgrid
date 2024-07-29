# Energy Management System for Hybrid Microgrid

## Overview
This repository contains the implementation of an energy management system designed for hybrid microgrids. The system optimizes energy distribution and effectively uses renewable energy sources.

## Structure
- **Code**:
  - **Algorithm**: Implementation of energy management algorithms, available as interactive Live Scripts and executable scripts.
    - **Live Script (Notebook) Version**:
      - `EMS Algorithm.mlx`: Interactive notebook detailing the EMS algorithm with visualizations and live code for a comprehensive understanding.
      - `Sensitivity Analysis for Battery-Diesel Trade-off.mlx`: Interactive analysis focusing on the trade-offs between battery storage and diesel generator usage.
    - **Script Version**:
      - `EMS_Algorithm.m`: Executable MATLAB script of the EMS algorithm for direct simulation.
      - `Sensitivity_Analysis_for_Battery-Diesel_Trade-off.m`: MATLAB script for conducting sensitivity analysis regarding energy storage and diesel usage.
  - **Data Generation**: Scripts for generating or simulating data necessary for testing the algorithms.
- **Data**:
  - `EDL.csv`: Energy distribution and load data.
  - `Load.csv`: Specific load consumption data.
  - `Temperature.csv`: Temperature data influencing energy consumption or generation.
  - `radiation_data.csv`: Solar radiation data crucial for solar power calculations.
  - `solar_irradiance.csv`: Data on solar irradiance.
- **Documentation**:
  - `Report.pdf`: Detailed project report including system architecture, algorithm details, and performance results.
  - `Slides.pdf`: Presentation slides providing an overview and impact of the energy management system.

## Getting Started
To get started, clone this repository and navigate to the `Code` directory to explore the algorithms implemented. Ensure you have the necessary software and libraries installed to run the scripts, particularly MATLAB for the scripts and Live Scripts.

## Contributing
We welcome contributions! If you have improvements or new features, please fork the repository and submit a pull request. Ensure to include a brief description of your changes and any necessary documentation updates.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

## Contact
For any queries or further collaboration, please open an issue in this repository or contact the project maintainers directly.

## Acknowledgments
- We extend our heartfelt thanks to all contributors, data providers, advisors, and everyone who has supported this project. Your contributions have been invaluable.
