#!/bin/sh
# basic script to verify the GSM functionality using the scripts
#
#	Author : Priyank Rathod <rathodpriyank@gmail.com>
#
#

_port_host=/dev/ttyACM0
_port_device=/dev/ttyGS0
_port=
_command=$1

usage()
{
	echo "Usage: 	$0 AT"
	echo "	$0 ATE0"
	echo "	$0 at+creg?"
}

check_machine()
{
	checking=`uname -a | grep mdm`
	if [ -z  "${checking}" ]; then
		_port=${_port_host}
	else
		_port=${_port_device}
	fi
}

execute_at()
{
	echo "Executing ==> $1"
	echo "$1" > ${_port}
	sleep 1
}

connect_inet()
{
	echo "Will do something here"
}

main()
{
	check_machine
	if [ -z "${_command}" ]; then
		usage
	elif [ "${_command}" = "connect" ]; then
		echo "Trying to connecting to internet"
		connect_inet	
	else
		execute_at "${_command}"
	fi
}

main 
exit 0
