with Coordonnee; use Coordonnee;
with Grille;     use Grille;
with Chiffre;    use Chiffre;
with Rangee;     use Rangee;

package Affichage is

   NB_POSITIONS : constant Integer := 5;
   NUL          : constant Integer := 0;

   -- affiche la valeur de la case v sur NB_POSITIONS
   procedure AfficherValeur (V : in Type_Chiffre);

   -- affiche la valeur de la case c de la grille g
   procedure AfficherCase (G : in Type_Grille; C : in Type_Coordonnee);

   -- affiche toutes les cases de la grille g
   procedure AfficherGrille (G : in Type_Grille);

   -- affiche le résultat d'une tentative de résolution de la grille g
   procedure AfficherResultat
     (G : in Type_Grille; Trouve : in Boolean; NbChiffresDepart : in Integer);

   --affiche la coordonnées
   procedure AfficherCoordonnee (C : in Type_Coordonnee);

   -- affiche une ligne lig de la grille g
   procedure AfficherLigne (G : in Type_Grille; Lig : in Integer);

   -- affiche horizontalement la colonne col de la grille g
   procedure AfficherColonne (G : in Type_Grille; Col : in Integer);

   -- affiche horizontalement la Rangee e
   procedure AfficherRangee (E : in Type_Rangee);

end Affichage;
