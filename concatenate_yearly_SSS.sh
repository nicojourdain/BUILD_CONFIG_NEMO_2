#!/bin/bash

CONFIG="AMU12r"
SSS_DIR="$SHAREDELMER/input/nemo_${CONFIG}/SSS"
YEARi=1979
YEARf=1981

for YEAR in $(seq $YEARi $YEARf)
do

  ncrcat ${SSS_DIR}/sss_${YEAR}_*_${CONFIG}.nc ${SSS_DIR}/sss_y${YEAR}_${CONFIG}.nc
  if [ -f ${SSS_DIR}/sss_y${YEAR}_${CONFIG}.nc ]; then
    rm -f ${SSS_DIR}/sss_${YEAR}_*_${CONFIG}.nc
    echo "${SSS_DIR}/sss_y${YEAR}_${CONFIG}.nc  [oK]"
  else
    echo "~!@#%^&* ERROR: ${SSS_DIR}/sss_y${YEAR}_${CONFIG}.nc HAS NOT BEEN CREATED   >>>>> STOP !!"
    exit
  fi

done
