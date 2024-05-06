#!/bin/bash
#
# Auteur : Drawn13
# Date : Mars 2024
# Version 1.0.0 : Script de création de mot de passe aléatoire
#

#Demande envers l'utilisateur de la longueur souhaité du mot de passe
echo -e "\nBonjour $(whoami), combien de caractères souhaites-tu pour ton mot de passe ? :"
read longueur

#Demande envers l'utilisateur des sortes de caractères à inclure dans son mot de passe
echo -e "\nOkay, donc nous sommes sur un mot de passe de $longueur caractères."

echo -e "\nPour commencer, veux-tu des lettres minuscules ? (o/n)"
read minuscules

echo -e "\nVeux-tu des lettres Majuscules ? (o/n)"
read majuscules

echo -e "\nVeux-tu inclure dans ton mot de passe des chiffres ? (o/n)"
read chiffres

echo -e "\nEt puis enfin, veux-tu ajouter des caractères spéciaux dans ton mot de passe ? (o/n)"
read str_speciaux

#Initialisation de la variable caractères
caracteres=''
echo -e "\n*********************************"
echo -e "\nInitialisation du mot de passe..."
echo -e "\n*********************************"

#Ajout des caractères selon les choix de l'utilisateur avec une condition Si
if [ "$minuscules" = "o" ]; then
    caracteres+='abcdefghijklmnopqrstuvwxyz'
fi

if [ "$majuscules" = "o" ]; then
    caracteres+='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
fi

if [ "$chiffres" = "o" ]; then
    caracteres+='0123456789'
fi

if [ "$str_speciaux" = "o" ]; then
    caracteres+='éàè€!@#$%^&*()_+{}[]'
fi

#Vérification des entrées du user s'il a choisi au moins un type de caractères qui a été demandé
if [ -z "$caracteres" ]; then
    echo -e "\nVeilles à choisir au moins un type de caractères pour que le script fonctionne !"
    exit 1
fi

#Génération du mot de passe aléatoire avec une condition Pour
mot_de_passe=''
for i in $(seq 1 $longueur); do
    rand_index=$((RANDOM % ${#caracteres}))
    mot_de_passe+="${caracteres:$rand_index:1}"
done

#Affichage du mot de passe généré par le script
echo -e "\nEt ton mot de passe est : $mot_de_passe, fait en bon usage !"
echo -e "\nÀ bientôt"

