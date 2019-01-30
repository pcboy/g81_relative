[![Build Status](https://travis-ci.com/pcboy/g81_relative.svg?branch=master)](https://travis-ci.com/pcboy/g81_relative)

https://github.com/PrusaOwners/prusaowners/wiki/Bed_Leveling_without_Wave_Springs

Following that tutorial and because I didn't want to update my firmware only to have relative numbers, I made a script to convert the output from Marlin to the relative numbers you need.  
Script takes a file as parameter with G81 output, like that:

```
Recv:   0.16500  0.18463  0.19991  0.21083  0.21741  0.21963  0.21750
Recv:   0.16046  0.18181  0.20058  0.21676  0.23036  0.24138  0.24981
Recv:   0.15630  0.18067  0.20295  0.22315  0.24126  0.25727  0.27120
Recv:   0.15250  0.18120  0.20704  0.23000  0.25009  0.26731  0.28167
Recv:   0.14907  0.18342  0.21283  0.23731  0.25687  0.27150  0.28120
Recv:   0.14602  0.18730  0.22033  0.24509  0.26159  0.26984  0.26981
Recv:   0.14333  0.19287  0.22954  0.25333  0.26426  0.26231  0.24750
```

Then when you do:
```
$> ruby gen.rb output.txt

      Raw values:
      -0.07	-0.02	-0.01
      -0.08	0	0.05
      -0.09	0.02	0.02

      Degrees:
      -50°	-14°	-7°
      -58°	0	36°
      -65°	14°	14°

      Fractional Turns:
      -1/10	0	0
      -1/5	0	1/10
      -1/5	0	0
```

You get the proper output relative to the center. You also get the degrees and fractional turns from the correct position for each screw.  
You can also access the converter directly online by going to: https://pcboy.github.io/g81_relative/
