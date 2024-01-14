#!/bin/bash

clear;  # Clear console first

date_spec="Today";  # For specifying the exact date desired
month_tmp=$(date -d "$date_spec" +"%b");  # Temporary month var
if [ "$month_tmp" == "May" ]; then
	week_mo=$(date -d "$date_spec" +"%A, %b");  # Day of week + month abbrev. (MAY)
else
	week_mo=$(date -d "$date_spec" +"%A, %b.");  # Day of week + month abbrev. (NOT MAY)
fi
year=$(date -d "$date_spec" +"%Y");  # Year
day_suffix=("st" "nd" "rd" "th");  # List of suffixes for display logic
day=$(date -d "$date_spec" +%-d);  # The numerical day of the month
day_ldig=$((day % 10));  # Last digit of the numerical day
time=$(date +"%I:%M %p");  # Time
loc="";  # Location
loc_short=""

echo "| $time";
echo -n "| $week_mo";  # Day of week + month abbrev.

# Suffix of the numerical day
if [ "$day" -eq 11 ] || [ "$day" -eq 12 ] || [ "$day" -eq 13 ]; then  # Not in the teens
	echo -n " $day${day_suffix[3]}, "
elif [ "$day_ldig" -eq 1 ]; then
	echo -n " $day${day_suffix[0]}, ";
elif [ "$day_ldig" -eq 2 ]; then
	echo -n " $day${day_suffix[1]}, ";
elif [ "$day_ldig" -eq 3 ]; then
	echo -n " $day${day_suffix[2]}, ";
else
	echo -n " $day${day_suffix[3]}, ";
fi
		
echo "$year";  # Year + Time
echo;
ncal -3wb;  # Calendar
echo;
curl wttr.in/?m0;  # Weather
echo;
