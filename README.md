# -Turbine-Energy-Balancing-(Thermodynamics)
The models are designed for educational and research purposes, and demonstrate how turbine efficiency and inlet/outlet conditions affect energy conversion from steam to mechanical work.

This repository contains a Simulink model and associated MATLAB scripts for energy balancing of a steam turbine system. The project focuses on analyzing the thermodynamic performance of the turbine using the mass-energy balance principle, including isentropic and actual enthalpy calculations, as well as shaft power output.

The models are designed for educational and research purposes, and demonstrate how turbine efficiency and inlet/outlet conditions affect energy conversion from steam to mechanical work.

Features

Turbine Energy Balance Calculation:
Computes shaft power using:

𝑊turbine = m
˙
(
ℎ
𝑖
𝑛
−
ℎ
𝑜
𝑢
𝑡
)

and incorporates isentropic efficiency to find actual outlet enthalpy.

Simulink Model:
Implements a turbine block for energy balance, suitable for integration with larger thermodynamic system models.

MATLAB Scripts (without CoolProp):
Provides the energy balance calculation using user-defined enthalpy values. Designed to be fully functional even without external property libraries.

Visualization (Optional):
Can be extended to plot shaft power vs. outlet enthalpy or mass flow, helping to visualize turbine performance under varying operating conditions.

Energy Balancing Concept

The turbine energy balance is based on the first law of thermodynamics for a control volume:

𝑚 ˙
(
ℎ
𝑖
𝑛
+
𝑉
𝑖
𝑛
^
2
+
𝑔
𝑧
𝑖
𝑛
)

−
𝑚 ˙
(
ℎ
𝑜
𝑢
𝑡
+
𝑉
𝑜
𝑢
𝑡
^
2
+
𝑔
𝑧
𝑜
𝑢
𝑡
)

=
𝑊
˙
𝑠
ℎ
𝑎
𝑓
𝑡


m
˙
 = mass flow rate of the working fluid

ℎ
 = specific enthalpy (kJ/kg)

𝑉
 = fluid velocity (m/s)

𝑧
 = elevation (m)

𝑊
˙
𝑠
ℎ
𝑎
𝑓
𝑡
 = mechanical power extracted by the turbine

For practical purposes, kinetic and potential energy differences are often negligible in steam turbines, so the simplified equation becomes:

𝑊˙
𝑠
ℎ
𝑎
𝑓
𝑡 = 
𝑚
˙
(
ℎ
𝑖
𝑛
−
ℎ
𝑜
𝑢
𝑡
)



If turbine isentropic efficiency (
𝜂
𝑡	
) is known:

ℎ𝑜
𝑢
𝑡
,
𝑎
𝑐
𝑡
𝑢
𝑎
𝑙
= ℎ
𝑖
𝑛
−
𝜂
𝑡
(
ℎ
𝑖
𝑛
−
ℎ
𝑜
𝑢
𝑡
,
𝑖
𝑠
𝑒
𝑛
𝑡
𝑟
𝑜
𝑝
𝑖
𝑐
)

This accounts for real-world losses in the turbine.

MATLAB Graph explanation

For visualizing turbine energy balancing, a common approach is to plot shaft power versus mass flow rate, which shows how turbine power increases linearly with mass flow when inlet and outlet enthalpies are constant, and can include multiple curves for different turbine efficiencies to illustrate the effect of efficiency; alternatively, plotting shaft power versus actual outlet enthalpy produces a decreasing curve because as outlet enthalpy increases, less energy is extracted and shaft power decreases, while comparing actual versus isentropic outlet enthalpy against turbine efficiency yields a decreasing linear trend where higher efficiencies bring the actual enthalpy closer to the ideal isentropic value; optionally, if tracking outlet temperature or pressure, plotting mass flow versus outlet temperature or pressure can provide additional insight into system behavior. Graphs should use line plots with markers for discrete points, clearly labeled axes including units (e.g., kW, MW, kJ/kg, kg/s), grid lines for readability, and legends to distinguish curves for different efficiencies or inlet conditions, for example using plot(mdot_array, W_dot_array,'-o','LineWidth',2) for a single curve and hold on with additional plot commands for multiple efficiencies, which together allow clear visualization of turbine performance trends under varying operating conditions.
