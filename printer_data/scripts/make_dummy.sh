#/bin/bash

export SourceFile=$1
export DummyFile=`basename $1 .gcode`_dummy.gcode
export GcodeDir=~/printer_data/gcodes

# -e '/;FLAVOR:Marlin/,/;LAYER:1/{//!d}' \
# -e '/FLAVOR:Marlin/a G28\nG0 Z20\nG92 Z0' \
# -e 's:G1 F600 Z\(.*\)$:'
#-e 's: Z\(.*\)$::' \

cat ${GcodeDir}/${SourceFile} | sed \
-e '/print_start/a\print_start EXTRUDER=2350.0 BED=60.0' \
-e '/print_start EXTRUDER/d' \
-e 's/G1 F600 Z0.\(.*\)/G1 F600 Z10.\1\t; adjusted by z offset \nG92 Z0.\1\t\t; consider this the original z before offset/' \
-e 's:G1 \(.*\) E\(.*\)$:G1 \1:' \
-e '/^M1/d' \
-e '/print_end/,$d' \
> ${GcodeDir}/${DummyFile} 

ls -lrt ${GcodeDir}/

