MRI-T2
======

This MatLab code is designed to model T2 dephasing of protons following the 90 deg pulse as seen in a spin-echo sequence due to their diffusion and interaction with the magnetic field inhomogeneity created by nanoparticles. The algorithm is largely based on the paper by P.A. Hardy and R.M. Henkelman "Transverse relaxation rate enhancement caused by magnetic particulates" (http://dx.doi.org/10.1016/0730-725X(89)90549-3)

Installation
------------

Copy repository. Assuming that you have a linux environment and Git installed
```
$ git clone https://github.com/rubel75/MRI-T2
```

Navigate to the new directory
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


Execution
---------

```
$ ./main 1 out.dat  <  input.txt
```
Here `1` indicates that the input will be fed from `input.txt` file. Alternatively, it is possible to use the input from `assigninptdt.m`, e.g.
```
$ ./main 0 out.dat
```
However, in this case your input is hardcoded after compiling. This is not recommended option.
