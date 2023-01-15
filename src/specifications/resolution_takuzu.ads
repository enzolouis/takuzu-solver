with Grille;     use Grille;
with Coordonnee; use Coordonnee;
with Chiffre;    use Chiffre;
with Rangee;     use Rangee;

package Resolution_Takuzu is


   procedure RegleADoublonLigne(g: in out Type_Grille; L:  in Integer; maj : out Boolean);

   procedure RegleADoublonColonne(g: in out Type_Grille; Col:  in Integer; maj : out Boolean);

   procedure RegleBLigne(g:in out Type_Grille; L:in Integer; maj : out Boolean);

   procedure RegleBColonne(g: in out Type_Grille; Col:in Integer; maj : out Boolean);

   -- Regle C.1 : complète la lignes l qui ont déj�  4 UN ou 4 ZERO
   procedure RegleCCompleterLigne
     (G : in out Type_Grille; L : in Integer; V : in Type_Chiffre);

   -- Regle C.2: complète les colonnes qui ont déj�  4 UN ou 4 ZERO
   procedure RegleCCompleterColonne
     (G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre);

   -- si la solution a ete maj pour la grille g, alors Maj est a VRAI et
   -- la grille est complete sinon Maj est a FAUX et la grille n'a aucune
   -- valeur significative parcours la grille

	function RegleDLigne (G : in Type_Grille) return Boolean;

	function RegleDColonne (G : in Type_Grille) return Boolean;


   procedure ResoudreTakuzu (G : in out Type_Grille; trouve : out Boolean);

end Resolution_Takuzu;
