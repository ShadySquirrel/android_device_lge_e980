#!/system/bin/sh
#
# Lab P6, Mobile Communication Company, LG ELECTRONICS INC., SEOUL, KOREA
# Copyright(c) 2013 by LG Electronics Inc.
#
# All rights reserved. No part of this work may be reproduced, stored in a
# retrieval system, or transmitted by any means without prior written
# Permission of LG Electronics Inc.
#

APTX_STREAMING=`getprop bluetooth.a2dp_streaming`
case $APTX_STREAMING in
    0)
        echo 500000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        ;;
    1)
        echo 720000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        ;;
    *)
        ;;
esac

exit 0