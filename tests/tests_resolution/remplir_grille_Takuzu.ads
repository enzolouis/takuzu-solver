with Coordonnee; use Coordonnee;
with Grille;     use Grille;
with Chiffre;    use Chiffre;

package Remplir_Grille_Takuzu is

   PROBLEME_TAILLE_GRILLE : exception;

   function Lire_Grille (Nom : String) return Type_Grille;

end Remplir_Grille_Takuzu;
