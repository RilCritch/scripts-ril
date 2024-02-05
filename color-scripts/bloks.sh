#!/usr/bin/env bash

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[1;90m";   redb="${esc}[1;91m";    greenb="${esc}[1;92m"
  yellowb="${esc}[1;93m"   blueb="${esc}[1;94m";   purpleb="${esc}[1;95m"
  cyanb="${esc}[1;96m";    whiteb="${esc}[1;97m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

numbers (){

initializeANSI

cat << EOF

${blackf}00000000${reset} ${redf}11111111${reset} ${greenf}22222222${reset} ${yellowf}33333333${reset} ${bluef}44444444${reset} ${purplef}55555555${reset} ${cyanf}66666666${reset} ${whitef}77777777${reset}
${blackb}88888888${reset} ${redb}99999999${reset} ${greenb}AAAAAAAA${reset} ${yellowb}BBBBBBBB${reset} ${blueb}CCCCCCCC${reset} ${purpleb}DDDDDDDD${reset} ${cyanb}EEEEEEEE${reset} ${whiteb}FFFFFFFF${reset}

EOF

}

blocks (){

initializeANSI

cat << EOF

${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}

EOF

}

case $1 in
	b)	blocks;;
	n)	numbers;;
	a)	blocks && numbers;;
	*)  blocks && numbers;;
esac

