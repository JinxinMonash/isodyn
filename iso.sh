#!/bin/sh
#fiso="../filesimid/files/mark2" #13C labeling in Metabolights format
fiso="SW620-Glucose" #13C labeling in Metabolights format
fcon=xglc #concentrations
inpar="glc/1" #set of parameters to start
oudir="output"  #output directory
fstat="glc/statfl"  #statistics on the all sets of parameters
fcmpr="glc/statfl1" #statistics for matching conditions
manfi=2 #number of files saved
FNCKAS="0" #-Fit with Simulated annealing, find -Number of independent parameters,
tst=yes

while getopts ":a:b:i:o:s:c:m:FNCKAS" opt; do
  case $opt in
    a) fiso=$OPTARG;;
    b) fcon=$OPTARG;;
    i) inpar=$OPTARG;;
    o) oudir=$OPTARG;;
    s) fstat=$OPTARG;;
    c) fcmpr=$OPTARG;;
    m) manfi=$OPTARG;;
    F) FNCKAS=F;;
    N) FNCKAS=N;;
    C) FNCKAS=C;;
    K) FNCKAS=K;;
    A) FNCKAS=A;;
    S) FNCKAS=S;;
    *)
      echo "Invalid option: -$OPTARG" 
      cat help
      tst=no
      ;;
  esac
done
if [ $tst = yes ]
then
./isodyn.out $fiso $fcon $inpar $oudir $fstat $fcmpr $manfi $FNCKAS
fi
