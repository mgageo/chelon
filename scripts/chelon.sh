#!/bin/sh
# <!-- coding: utf-8 -->
#T Chelon
# auteur: Marc Gauthier
[ -f ../win32/scripts/misc.sh ] && . ../win32/scripts/misc.sh
[ -f ../win32/scripts/misc_pkg.sh ] && . ../win32/scripts/misc_pkg.sh
#f CONF:
CONF() {
  LOG "CONF debut"
  ENV
  Depot=chelon
  CFG="CHELON"
  [ -d "${CFG}" ] || mkdir "${CFG}"
  LOG "CONF fin"
}

#F e: edition des principaux fichiers
e() {
  LOG "e debut"
  E scripts/${Depot}.sh
  E scripts/${Depot}.R
  LOG "e fin"
}
#F GIT: pour mettre à jour le dépot git
GIT() {
  LOG "GIT debut"
  Local="${DRIVE}/web/geo"; Remote=frama
  export Local
  export Depot
  export Remote
  _git_lst
  bash ../win32/scripts/git.sh INIT $*
#  bash ../win32/scripts/git.sh PUSH
  LOG "GIT fin"
}
#f _git_lst: la liste des fichiers pour le dépot
_git_lst() {
  cat  <<EOF > /tmp/git.lst
scripts/${Depot}.sh
scripts/${Depot}.R
EOF
  _ENV_R
#  ( cd ..; R --vanilla -e "source('geo/scripts/misc_code.R');code_git('geo/scripts/${Depot}.R')" )
  cat  <<EOF > /tmp/README.md
# ${Depot} : carte d'une tournée de Georges Chelon en 1995

Scripts en environnement Windows 10 et Linux

## Scripts R
Ces scripts sont dans le dossier "scripts".

## Scripts sh
Ces scripts sont dans le dossier "scripts".


EOF
}
#f CLONE:
CLONE() {
  LOG "CLONE debut"
  git clone https://framagit.org/mgageo/${Depot}.git
  LOG "CLONE fin"
}
#f U:
U() {
  LOG "U debut"
  sudo R -e "source('${Depot}.R');install()"
  LOG "U fin"
}
#f W:
W() {
  LOG "W debut"
  _ENV_R
  (
    cd ..
    R -e "source('geo/scripts/${Depot}.R'); install()"
  )
  LOG "W fin"
}
[ $# -eq 0 ] && ( HELP )
CONF
while [ "$1" != "" ]; do
  case $1 in
    -c | --conf )
      shift
      Conf=$1
      ;;
    * )
      $*
      exit 1
  esac
  shift
done