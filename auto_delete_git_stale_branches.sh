#!/bin/bash
#This script assumes the forward flow of time cannot be broken(i.e the dates can't be changed in git)
#Automatically delete git branches that haven't been committed to in the last 3 months
#first attempt

#This prints all the lines of the commit dates. Output below. 
#CMD: git log <branchName> | awk '$1 ~ /Date:/{print}'
#don't type the chevrons (<>)
# Date:   Fri Oct 28 12:47:14 2022 -0500
# Date:   Thu Oct 27 23:23:54 2022 -0500
# Date:   Tue Oct 25 11:04:32 2022 -0500
# Date:   Tue Oct 25 10:40:31 2022 -0500
# Date:   Mon Oct 24 17:29:36 2022 -0500
# Date:   Thu Oct 20 15:33:48 2022 -0500
# Date:   Thu Oct 20 14:24:25 2022 -0500
# Date:   Thu Oct 20 14:22:08 2022 -0500

varMostRecentCommit=$(git log --date=format:'%Y %m %d' d2report | awk '$1 ~ /Date:/{print}' | sed -n '1p')
varMostRecentCommitYear=$( echo "$varMostRecentCommit" | awk '{print $2}')
varMostRecentCommitMonth=$( echo "$varMostRecentCommit" | awk '{print $3}')
varMostRecentCommitDay=$( echo "$varMostRecentCommit" | awk '{print $4}')

varTodaysDateYear=$(date "+%y")
varTodaysDateMonth=$(date "+%m")
varTodaysDateDay=$(date "+%d")

echo "$varMostRecentCommitYear"
echo "$varMostRecentCommitMonth"
echo "$varMostRecentCommitDay"
echo "$varMostRecentCommit"
echo "$varTodaysDateYear"
echo "$varTodaysDateMonth"
echo "$varTodaysDateDay"


