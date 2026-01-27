#!/bin/bash
echo "This may take a few minutes, please wait..."
FILE=$(mktemp)
system_profiler > $FILE 2> /dev/null
NAME=$(scutil --get ComputerName)
HUUID=$(grep "Hardware UUID" $FILE)
DEVID=$(mdatp health |grep edr_machine_id | sed 's/edr_machine_id[[:space:]]*/Device ID/')
SN=$(grep "Serial Number (system)" $FILE)
MN1=$(grep "^\s*Model Name" $FILE)
MN2=$(grep "^\s*Model Identifier" $FILE)
MN3=$(grep "^\s*Model Number" $FILE)
echo -e "$NAME\n $HUUID\n $DEVID\n $SN\n $MN1\n $MN2\n $MN3\n" | pbcopy
echo "Info copied to clipboard. Please send an email to your IT support or physast.itsupport@ucl.ac.uk pasting the information in (Cmd-V or using the Edit menu)"
rm $FILE
