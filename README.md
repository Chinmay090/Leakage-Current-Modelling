# Leakage Current Estimation of ISCAS 74182 circuit

* `single-mos` directory contains netlists to obtain the leakage currents in single MOSFET on and off cases. It also contains the output matrices as text files.
* `mos-stack` directory contains netlists to obtain the intermediate node voltage in a stack of 2 MOSFETs, along with the output matrices as text files.
* `gates` directory contains netlists for NOT gate and 2 input NAND, NOR, AND and OR gates.
* `estimate_leakage.ipynb` notebook has the Python code to estimate the leakage current in the individual gates and using them to estimate the leakage current in the ISCAS 74182 circuit.
* To run the estimation, change the inputs in the last cell of the notebook and run all the cells.
* The output will be a numpy array `[total supply leakage, total gate leakage]`.
* `cla.sp` is the netlist of the ISCAS 74182 circuit. Run this netlist to obtain the leakage currents in the circuit and to verify the estimated leakage currents.