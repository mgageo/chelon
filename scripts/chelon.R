# <!-- coding: utf-8 -->
#
# quelques fonctions pour Chelon
# auteur : Marc Gauthier
# licence: Creative Commons Paternité - Pas d'Utilisation Commerciale - Partage des Conditions Initiales à l'Identique 2.0 France
#
mga  <- function() {
  source("geo/scripts/onc35.R");
}
#
# les variables globales
Drive <- substr( getwd(),1,2)
baseDir <- sprintf("%s/web", Drive)
texDir <- sprintf("%s/web/geo/%s", Drive, "CHELON")
cfgDir <- sprintf("%s/web/geo/%s", Drive, "CHELON")
varDir <- sprintf("%s/web/geo/%s", Drive, "CHELON")
dir.create(varDir, showWarnings = FALSE, recursive = TRUE)
dir.create(texDir, showWarnings = FALSE, recursive = TRUE)
#
# les bibliothèques
setwd(baseDir)
source("geo/scripts/mga.R");
source("geo/scripts/misc.R");
source("geo/scripts/misc_geocode.R");
source("geo/scripts/chelon_carte.R");
source("geo/scripts/chelon_drive.R");

#
# les commandes permettant le lancement
DEBUG <- FALSE
if ( interactive() ) {
  carp("interactive")
# un peu de nettoyage
  graphics.off()
  par(mar=c(0,0,0,0), oma=c(0,0,0,0))
  options(stringsAsFactors=FALSE)
} else {
  carp("console")
}
