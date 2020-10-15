#!/bin/sh
#
# (c) 2020 Yoichi Tanibayashi
#
MYNAME=`basename $0`
MYDIR=`dirname $0`

get_val () {
    if [ -z "$1" ]; then
        echo
        return
    fi

    _VAL=`pigs r $1`
    if [ $_VAL -eq 0 ]; then
        _VAL_STR="L"
    else
        _VAL_STR="H"
    fi
    echo $_VAL_STR
}

get_mode () {
    if [ -z "$1" ]; then
        echo ""
        return
    fi
    
    _M_VAL=`pigs mg $1`
    _M_STR=""

    if [ ${_M_VAL} -eq 0 ]; then
        _M_STR="IN "
    fi
    if [ ${_M_VAL} -eq 1 ]; then
        _M_STR="OUT"
    fi
    if [ ${_M_VAL} -eq 2 ]; then
        _M_STR="AL5"
    fi
    if [ ${_M_VAL} -eq 3 ]; then
        _M_STR="AL4"
    fi
    if [ ${_M_VAL} -eq 4 ]; then
        _M_STR="AL0"
    fi
    if [ ${_M_VAL} -eq 5 ]; then
        _M_STR="AL1"
    fi
    if [ ${_M_VAL} -eq 6 ]; then
        _M_STR="AL2"
    fi
    if [ ${_M_VAL} -eq 7 ]; then
        _M_STR="AL3"
    fi

    echo "$_M_STR"
}

echo "  -------------------------- "
echo " |VAL|MOD|GPIO||GPIO|MOD|VAL|"
echo " |---+---+----++----+---+---|"
echo " |3.3|---| 3V || 5V |---|5.0|"
echo " | `pigs r 2` |`get_mode 2`| 2  || 5V |---|5.0|"
echo " | `pigs r 3` |`get_mode 3`| 3  ||GND |---|GND|"
echo " | `pigs r 4` |`get_mode 4`| 4  || 14 |`get_mode 14`| `pigs r 14` |"
echo " |GND|---| GND|| 15 |`get_mode 15`| `pigs r 15` |"
echo " | `pigs r 17` |`get_mode 17`| 17 || 18 |`get_mode 18`| `pigs r 18` |" 
echo " | `pigs r 27` |`get_mode 27`| 27 ||GND |---|GND|"
echo " | `pigs r 22` |`get_mode 22`| 22 || 23 |`get_mode 23`| `pigs r 23` |"
echo " |3.3|---| 3V || 24 |`get_mode 24`| `pigs r 24` |"
echo " | `pigs r 10` |`get_mode 10`| 10 ||GND |---|GND|"
echo " | `pigs r 9` |`get_mode 9`| 9  || 25 |`get_mode 25`| `pigs r 25` |"
echo " | `pigs r 11` |`get_mode 11`| 11 ||  8 |`get_mode 8`| `pigs r 8` |"
echo " |GND|---| GND||  7 |`get_mode 7`| `pigs r 7` |"
echo " | `pigs r 0` |`get_mode 0`| 0  ||  1 |`get_mode 1`| `pigs r 1` |"
echo " | `pigs r 5` |`get_mode 5`| 5  ||GND |---|GND|"
echo " | `pigs r 6` |`get_mode 6`| 6  || 12 |`get_mode 12`| `pigs r 12` |"
echo " | `pigs r 13` |`get_mode 13`| 13 ||GND |---|GND|"
echo " | `pigs r 19` |`get_mode 19`| 19 || 16 |`get_mode 16`| `pigs r 16` |"
echo " | `pigs r 26` |`get_mode 26`| 26 || 20 |`get_mode 20`| `pigs r 20` |"
echo " |GND|---| GND|| 21 |`get_mode 21`| `pigs r 21` |"
echo " |---+---+----++----+---+---|"
echo " |VAL|MOD|GPIO||GPIO|MOD|VAL|"
echo "  -------------------------- "
