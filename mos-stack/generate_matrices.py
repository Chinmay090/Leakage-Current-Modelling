import os
from tabulate import tabulate

mos_type = ["nmos", "pmos"]
inputs = ["00", "01", "10", "11"]
widths = [1, 2, 3, 4, 6, 8]
vdd = 0.8

headers = ["", "W", "2W", "3W", "4W", "6W", "8W"]

for mosfet in mos_type:
    Vint_matrix = []
    for inp in inputs:
        row = [f"{inp}"]
        filename = f"{mosfet}_stack_{inp}.txt"
        with open(filename, "r") as file:
            for line in file:
                values = line.split()
                row.append(values[3])
        Vint_matrix.append(row)
    print("--------------------------------------------------------------")
    print(f"Intermediate voltage for 2 {mosfet.upper()} stack:")
    print(tabulate(Vint_matrix, headers=headers, tablefmt="rounded_outline"))
    print("--------------------------------------------------------------")


# states = ["nmos_on", "nmos_off", "pmos_on", "pmos_off"]
# widths = [1, 2, 3, 4, 6, 8]
# vdd = 0.8
# voltages = ["{:.2f}V".format(x) for x in (i * 0.05 for i in range(1, int(vdd / 0.05) + 1))]
# headers = [""] + voltages

# for state in states:
#     Id_matrix = []
#     Ig_matrix = []
#     Is_matrix = []
#     Ib_matrix = []
#     for width in widths:
#         Id = [f"{width}*Wmin"]
#         Ig = [f"{width}*Wmin"]
#         Is = [f"{width}*Wmin"]
#         Ib = [f"{width}*Wmin"]
#         filename = f"{state}_{width}W.txt"
#         with open(filename, "r") as file:
#             for line in file:
#                 values = line.split()
#                 Id.append(values[-4])
#                 Ig.append(values[-3])
#                 Is.append(values[-2])
#                 Ib.append(values[-1])
#         Id_matrix.append(Id)
#         Ig_matrix.append(Ig)
#         Is_matrix.append(Is)
#         Ib_matrix.append(Ib)

#     print("--------------------------------------------------------------")
#     print("State: ", state)
#     print("Id:")
#     print(tabulate(Id_matrix, headers=headers, tablefmt="rounded_outline"))
#     print("Ig:")
#     print(tabulate(Ig_matrix, headers=headers, tablefmt="rounded_outline"))
#     print("Is:")
#     print(tabulate(Is_matrix, headers=headers, tablefmt="rounded_outline"))
#     print("Ib:")
#     print(tabulate(Ib_matrix, headers=headers, tablefmt="rounded_outline"))
#     print("--------------------------------------------------------------")
