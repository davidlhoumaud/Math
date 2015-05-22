#! /bin/bash
  
function _help () {
    echo "MATH version 0.4 by BeHuman
GNU/GPL v3
Usage:
    math [OPTION] [FORMULE or FILE] [SUBOPTION]
  
Options:
    -h          Help
    -hf         Help List BC Functions
    -pi         return PI
    -pwr        Power
    -sqrt       Square root
    -sin        Sine
    -cos        Consine
    -tan        Tangent
    -exp        Exponentiel
    -log        Logarithmique
    -bessel     fonction de Bessel
    -sec        Secant
    -csc        Cosecant
    -ctn        Cotangent
    -asin       Arc sine
    -acos       Arc consine
    -atan       Arc tangent
    -asec       Arc Secant
    -acsc       Arc Cosecant
    -actn       Arc Cotangent
    -newton     Newton (N=Kg*m/s²)
    -mass       Mass (Kg=N/9.81441)
    -lbm2kg     Livre to Kilogramme (Kg=lbm*0.45359237)
    -kg2lbm     Kilogramme to livre (lbm=Kg/0.45359237)
    -pascal     Pression Pascal (Pa=N/m²)
SubOptions:
    -s      Float scale (default 4)
 
Liste des opérations:
+ , - , *, / : addition, soustraction, multiplication, division
% : reste de la division entière
^ : puissance
 
Exemple:
    math \"((2+2.5)*(5*64))/2\"
        return 720.00
    math \"x=(5/3)+((5%3)*2); x+10\"
        return 11.70
    math \"x=(5/3)+((5%3)*2); x+10\" -s 5
        return 11.66670
    math \"((2+2.5)*(5*64))/2\" -s 4
        return 720.0000
    math \"((2+2.5)*(5*64))/2\" -s 0
        return 720
    math -pwr 2 3
        return 8 (2 puissance 3)
    math \"pwr(2,3)\"
        return 8 (2 puissance 3)
    math \"2^3\"
        return 8 (2 puissance 3)
    math -pi 
        return 3.1412
    math \"pi()\" 
        return 3.1412
    math \"pi()\" -s 15
        return 3.141592653589792"
}
 
function _helpf () {
    echo "$functionsBC"
}
  
#Others function
function pi () #PI
{
    echo "scale=$2; 4*a(1)" | bc -l
}
 
function pwr () #Power
{
    echo "scale=$3;$1^$2" | bc -l
}
  
function sqrt () #Square root
{
    echo "scale=$2;sqrt($1)" | bc -l
}
  
function newton () #Square root
{
    echo "scale=$3; $1*$2" | bc -l
}
  
function mass () #Square root
{
    echo "scale=$2; $1/9.81441" | bc -l
}
  
function lbm2kg () #Square root
{
    echo "scale=$2; $1*0.45359237" | bc -l
}
  
function kg2lbm () #Square root
{
    echo "scale=$2; $1/0.45359237" | bc -l
}
  
function pascal () #Square root
{
    echo "scale=$3; $1/$2" | bc -l
}
  
#Function trignometry
function sin () #Sine
{
    echo "scale=$2;s($1)" | bc -l
}
  
function cos () #Cosine
{
    echo "scale=$2;c($1)" | bc -l
}
  
function tan () #Tangent
{
    echo "scale=$2;s($1)/c($1)" | bc -l
}
 
function exp () #Exponentiel
{
    echo "scale=$2;j($1)" | bc -l
}
 
function log () #Logarithmique
{
    echo "scale=$2;l($1)" | bc -l
}
 
function bessel () #Bessel
{
    echo "scale=$3;l($1,$2)" | bc -l
}
  
function sec () #Secant
{
    echo "scale=$2;1/c($1)" | bc -l
}
  
function csc () #Cosecant
{
    echo "scale=$2;1/s($1)" | bc -l
}
  
function ctn () #Cotangent
{
    echo "scale=$2;c($1)/s($1)" | bc -l
}
  
function asin () #Arc Sine
{
    if (( $(echo "$1 == 1" | bc -l) ));then
       echo "90"  
    elif (( $(echo "$1 < 1" | bc -l) ));then
       echo "scale=$2;a(sqrt((1/(1-($1^2)))-1))" | bc -l
    elif (( $(echo "$1 > 1" | bc -l) ));then
       echo "error"
    fi
}
  
function acos () #Arc Cosine
{
    if (( $(echo "$1 == 0" | bc -l) ));then
       echo "90"
    elif (( $(echo "$1 <= 1" | bc -l) ));then
       echo "scale=$2;a(sqrt((1/($1^2))-1))" | bc -l
    elif (( $(echo "$1 > 1" | bc -l) ));then
       echo "error"
    fi
}
  
function atan () #Arc Tangent
{
    echo "scale=$2;a($1)" | bc -l
}
  
function asec () #Arc Secant
{
    echo "scale=$2;a(sqrt(($1^2)-1))" | bc -l
}
  
function acsc () #Arc Cosecant
{
    echo "scale=$2;a(1/(sqrt($1^2)-1))" | bc -l
}
  
function actn () #Arc Cotangent
{
    echo "scale=$2;a(1/$1)" | bc -l
}
 
functionsBC="/* force newton */
define newton (x,y) {
    return x*y;
}
 
/* pression pascal */
define pascal (x,y) {
    return x/y;
}
 
/* pi */
define pi () {
    return 4*a(1);
}
 
/* fonction de mass */
define mass (x) {
    return x/9.81441;
}
 
/* livre en kg */
define lbm2kg (x) {
    return x*0.45359237;
}
 
/* kg en livre */
define kg2lbm (x) {
    return x/0.45359237;
}
 
/* sinus */
define sin (x) {
    return s(x);
}
 
/* cosinus */
define cos (x) {
    return c(x);
}
 
/* tangent */
define tan (x) {
    return s(x)/c(x);
}
 
/* exponentiel */
define exp (x) {
    return e(x);
}
 
/* logarithme */
define log (x) {
    return l(x);
}
 
/* fonction de Bessel */
define bessel (n,y) {
    return j(n,y);
}
 
/* puissance */
define pwr (x,y) {
    return x^y;
}
 
/* secant */
define sec (x) {
    return 1/c(x);
}
 
/* cosecant */
define csc (x) {
    return 1/s(x);
}
 
/* cotangente */
define ctn (x) {
    return c(x)/s(x);
}
 
/* arc sinus */
define asin (x) {
    if (x==1)  return 90;
    if (x<1)  return a(sqrt((1/(1-(x^2)))-1))
    return -1
}
 
/* arc cosinus */
define acos (x) {
    if (x==0)return 90;
    if (x<=1)return a(sqrt((1/(x^2))-1))
    return -1
}
 
/* arc tangent */
define atan (x) {
    return a(x)
}
 
/* arc secant */
define asec (x) {
    return a(sqrt((x^2)-1))
}
 
/* arc cosecant */
define acsc (x) {
    return a(1/(sqrt(x^2)-1))
}
 
/* arc cotagent */
define actn (x) {
    return a(1/x)
}
 
/* calcul de factorielle n */
define fact(n) {
    auto i, r;
    r = 1;
    for (i=2; i<=n; i++) {
        r = r*i;
    }
    return (r);
}"
 
function openFileToCalculate() {
    f=""
    if [[ -f "$1" ]]; then
        while IFS=$'\n' read line; do
            f="$f
$line"
        done < "$1"
        #echo "$functionsBC scale=$2; $f"
        echo "$functionsBC scale=$2; $f" | bc -l
    else
        echo "$functionsBC scale=$2; $1"| bc -l
    fi
}
 
if [ "$1" == "-h" ];then
    _help
elif [ "$1" == "-hf" ];then
    _helpf
elif [ $# -ge 1 ]; then 
    if [ "$1" == "-pwr" ];then
        [[ "$4" == "-s" ]]&&s=$5||s=4
        pwr "$2" "$3" $s
    elif [ "$1" == "-exp" ];then
        [[ "$3" == "-s" ]]&&s=$4||s=4
        exp "$2" $s
    elif [ "$1" == "-log" ];then
        [[ "$3" == "-s" ]]&&s=$4||s=4
        log "$2" $s
    elif [ "$1" == "-bessel" ];then
        [[ "$4" == "-s" ]]&&s=$5||s=4
        bessel "$2" "$3" $s
    elif [ "$1" == "-pi" ];then
        [[ "$2" == "-s" ]]&&s=$3||s=4
        pi "$2" $s
    elif [ "$1" == "-sqrt" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        sqrt "$x" $s
    elif [ "$1" == "-sin" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        sin "$x" $s
    elif [ "$1" == "-cos" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        cos "$x" $s
    elif [ "$1" == "-tan" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        tan "$x" $s
    elif [ "$1" == "-sec" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        sec "$x" $s
    elif [ "$1" == "-csc" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        csc "$x" $s
    elif [ "$1" == "-ctn" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        ctn "$x" $s
    elif [ "$1" == "-asin" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        asin "$x" $s
    elif [ "$1" == "-acos" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        acos "$x" $s
    elif [ "$1" == "-atan" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        atan "$x" $s
    elif [ "$1" == "-asec" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        asec "$x" $s
    elif [ "$1" == "-acsc" ];then
        x=$2
        [[ "$3" == "-s" ]]&&s=$4||s=4
        acsc "$x" $s
    elif [ "$1" == "-actn" ];then
        [[ "$3" == "-s" ]]&&s=$4||s=4
        actn "$2" $s
    elif [ "$1" == "-newton" ];then
        [[ "$4" == "-s" ]]&&s=$5||s=4
        newton "$2" "$3" $s
    elif [ "$1" == "-mass" ];then
        [[ "$3" == "-s" ]]&&s=$4||s=4
        mass "$2" $s
    elif [ "$1" == "-lbm2kg" ];then
        [[ "$3" == "-s" ]]&&s=$4||s=4
        lbm2kg "$2" $s
    elif [ "$1" == "-kg2lbm" ];then
        [[ "$3" == "-s" ]]&&s=$4||s=4
        kg2lbm "$2" $s
    elif [ "$1" == "-pascal" ];then
        [[ "$4" == "-s" ]]&&s=$5||s=4
        pascal "$2" "$3" $s
    else
        [[ "$2" == "-s" ]]&&s=$3||s=4
        openFileToCalculate "$1" $s
    fi
else
    _help
fi
