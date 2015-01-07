MRI-T2
======

This MatLab code is designed to model T2 dephasing of protons following the 90 deg pulse as seen in a spin-echo sequence due to their diffusion and interaction with the magnetic field inhomogeneity created by nanoparticles. The algorithm is largely based on the paper by P.A. Hardy and R.M. Henkelman "Transverse relaxation rate enhancement caused by magnetic particulates" (http://dx.doi.org/10.1016/0730-725X(89)90549-3)

Installation
------------

Copy repository. Assuming that you have a linux environment and Git installed
```
$ git clone https://github.com/rubel75/MRI-T2
```

Alternatively you can just download a zip-file from


Compilation (optional)
----------------------

For multitasking and high-performance computing is is more convenient to compile the code and create a stand-alone application. Please note that compiling is not a mandatory option and you can run the simulation just from MatLab (see Execution 2 section below). Next steps explain how to compile the code.

Navigate to the source directory
```
$ cd MRI-T2
```

Lunch MatLab
```
$ matlab
```

Compile the code within MatLab (need MatLab Compiler)
```
>> mcc -m main
```

Exit MatLab and check for the new executable to be present
```
$ ls -ltr
...
-rwxrw-r-- 1 oleg oleg 60230 Feb  3  2014 main
```

You are ready to perform simulations.


Execution 1
-----------

This part is relevant for the compiled version. Please refer to Sec. Execution 2 below if you would like to run the code from MatLab environment.

```
$ ./main 1 out.dat  <  input.txt
```
Here `1` indicates that the input will be fed from `input.txt` file. Alternatively, it is possible to use the input from `assigninptdt.m`, e.g.
```
$ ./main 0 out.dat
```
However, in this case your input is hardcoded after compiling. This is not a recommended option.


Execution 2
-----------

This option is good for debugging and small calculations.

Navigate to the source directory
```
$ cd MRI-T2
```

Lunch MatLab
```
$ matlab
```

Open the file with input parameters
```
>> open assigninptdt.m
```
Edit parameters according to your needs. Save.

Lunch simulation
```
>> main 0 out.dat
```
Here the argument `0` indicates that the input should be taken from the `assigninptdt.m` file and `out.dat` is the output file name.


Results
-------

The output fille contains two columns time [s] and transverse mangetization [arb. units normalized to 1]
```
$ less out.dat
0.000000e+00    1.000000e+00
4.000000e-03    9.249262e-01
8.000000e-03    9.691416e-01
1.200000e-02    9.197097e-01
1.600000e-02    9.507682e-01
...
```


Credit
------

Oleg Rubel  
Department of Material Science and Engineering  
McMaster University  
1280 Main Street West, Hamilton, Ontario L8S 4L8  
Web page: http://www.tbrri.com/~orubel


Acknowledgement
---------------

A special thanks to Dr. Boguslaw Tomanek (Department of Oncology, University of Alberta) for numerous discussions about the physics of MRI.
