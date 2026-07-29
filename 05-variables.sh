#! /bin/bash
TIMESTAMP=$(date)

echo "time is $TIMESTAMP"
START_TIMESTAMP=$(date +%s)
sleep 10
END_TIMESTAMP=$(date +%s)

TOTAL_DIFF=(($END_TIMESTAMP-$START_TIMESTAMP))
echo "TOTAL_DIFF is $TOTAL_DIFF"