#!/bin/sh

arg=${1:-.}
exts="aux bbl blg brf idx ilg ind lof log lol lot out toc synctex.gz upa thm syg xml ist gls-abr glo-abr fls fdb_latexmk bcf auxlock xmpi acn acr alg glg-abr slg syi"

if [ -d $arg ]; then
    for ext in $exts; do
         rm -f $arg/*.$ext
         mv main.pdf output_pdf/main.pdf
         rm *vimtex.pdf
    done
else
    for ext in $exts; do
         rm -f $arg.$ext
         mv main.pdf output_pdf/main.pdf
         rm *vimtex.pdf
    done
fi
