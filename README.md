# Math
Calculatrice en ligne de commande

INSTALLATION
============
make install

UNINSTALLATION
==============
make uninstall

UTILISATION
===========
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
    math "((2+2.5)*(5*64))/2"
        return 720.00
    math "x=(5/3)+((5%3)*2); x+10"
        return 11.70
    math "x=(5/3)+((5%3)*2); x+10" -s 5
        return 11.66670
    math "((2+2.5)*(5*64))/2" -s 4
        return 720.0000
    math "((2+2.5)*(5*64))/2" -s 0
        return 720
    math -pwr 2 3
        return 8 (2 puissance 3)
    math "pwr(2,3)"
        return 8 (2 puissance 3)
    math "2^3"
        return 8 (2 puissance 3)
    math -pi 
        return 3.1412
    math "pi()" 
        return 3.1412
    math "pi()" -s 15
        return 3.141592653589792

