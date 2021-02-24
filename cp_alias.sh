#!/bin/bash

#We create the backups
echo "Creando bk en ~/bashrc_bk"
mkdir -p ~/bashrc_bk
cp ~/.bash_aliases ~/bashrc_bk/bash_aliases.bk
cp ~/.zshrc ~/bashrc_bk/zshrc.bk

################ Añadimos los alias a los archivos de bash_aliases y zsh ######################
##Eliminamos el contenido perteneciente a este script del archivo original .bash_aliases y dejando el contenido previo a él intacto
if [[ -f ~/.bash_aliases ]]
  then
    linea=$(awk -F": " '/#############Custom  Aliases for hacking#############/{ print NR }' ~/.bash_aliases)
    backup=""
    for i in $( eval echo -e {1..$linea} )
    do
    backup=$backup$(awk -v line="$i" 'NR==line' ~/.bash_aliases) #~/.bash_aliases
    #sleep 2
    done
fi
echo -e "$backup"
#Leemos el archivo bash aliases del proyecto y añadimos dicho contenido al contenido de ~/.bash_aliases
aliases=$( cat bash_aliases )
echo -n "$backup $aliases" > ~/.bash_aliases

##Para el ~/.zshrc
#
#
#
#
#chequeamos si existe la linea source ~/.bash_aliases
aux=$(awk -F": " '/source ~\/.bash_aliases/{ print $1 }' ~/.zshrc)
if [ "$aux" = "" ]
  then
    echo "En zshrc no está asociado el bash_aliases"
    source="#Linea añadida para asociar el contenido de .bash_aliases \nsource ~/.bash_aliases"
    echo $source
    echo "$source" >> ~/.zshrc
  else
    echo "Ya está todo hecho"
fi

#Esto para actualizar la terminal al nuevo fichero
bash
source ~/.bash_aliases
exit
zsh
source ~/.zshrc
exit


#########Actualizamos la carpeta de scripts###########
mkdir -p ~/bin/ext
sudo cp -R ext/* ~/bin/ext
sudo chmod +x ~/bin/ext/*

#Añadimos el directorio ~/bin/ext al PATH
redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"

echo "Añadir el PATH debe ser manual!!"
echo "Tan sólo hazle un nano a /etc/profile con permisos de root"
echo "Y justo despues de modificarlo para actualizarlo sin necesidad de reiniciar tan sólo ejecuta:"
echo "\$ source ${redColour}/etc/profile${endColour}"
echo -e "Y para zsh tan sólo en ${redColour}/etc/zsh/zprofile${endColour}"
echo ""
echo "Para añadir el PATH en una sesion concreta ejecuta:"
echo "PATH=$PATH:~/bin/ext"
