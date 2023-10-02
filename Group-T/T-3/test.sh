#!/bin/bash
x=0
until [ $x -gt 5 ]; do
	echo $x
	((x=$x+1))
done

