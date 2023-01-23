with Grille;     use Grille;
with Coordonnee; use Coordonnee;
with Chiffre;    use Chiffre;
with Rangee;     use Rangee;
with Pile_TCC;   use Pile_TCC;
with Coord_Chiffres; use Coord_Chiffres;

package Resolution_Takuzu is

<<<<<<< HEAD
=======
	type Type_Coord_Chiffre is record
      coord : Type_Coordonnee;
      chiffre : Type_Chiffre;
   end record;


>>>>>>> ac62ca94ca7d3385bb1768a14c8c01d111b1215e
   procedure RegleADoublonLigne(g: in out Type_Grille; L:  in Integer; maj : in out Boolean);

   procedure RegleADoublonColonne(g: in out Type_Grille; Col:  in Integer; maj : in out Boolean);

   procedure RegleBLigne(g:in out Type_Grille; L:in Integer; maj : in out Boolean);

   procedure RegleBColonne(g: in out Type_Grille; Col:in Integer; maj : in out Boolean);

   -- Regle C.1 : complete la lignes l qui ont deja  4 UN ou 4 ZERO
   procedure RegleCCompleterLigne
     (G : in out Type_Grille; L : in Integer; V : in Type_Chiffre);

   -- Regle C.2: complete les colonnes qui ont deja 4 UN ou 4 ZERO
   procedure RegleCCompleterColonne
     (G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre);

   -- si la solution a ete maj pour la grille g, alors Maj est a VRAI et
   -- la grille est complete sinon Maj est a FAUX et la grille n'a aucune
   -- valeur significative parcours la grille

	function RegleDLigne (G : in Type_Grille) return Boolean;

	function RegleDColonne (G : in Type_Grille) return Boolean;

<<<<<<< HEAD
=======
    procedure ResoudreTakuzu (G : in out Type_Grille; trouve : out Boolean; P : in out Type_Pile);

>>>>>>> ac62ca94ca7d3385bb1768a14c8c01d111b1215e
	function is_valid_ligne(g: in Type_Grille; L: Integer; n : in Integer) return Boolean;

	function is_valid_colonne(g: in Type_Grille; Col: Integer; n : in Integer) return Boolean;

<<<<<<< HEAD


	function Is_Valid(G:in Type_Grille) return Boolean;

	function Depiler_V2 (Pile : in Type_Pile) return Type_Pile;

   procedure ResoudreTakuzu (g : in out Type_Grille; trouve: out Boolean);



=======
	function is_valid(g: in Type_Grille) return Boolean;

	--  ResoudreTakuzu (G : in out Type_Grille; L:in Integer; Colonne:in Integer) return Boolean
>>>>>>> ac62ca94ca7d3385bb1768a14c8c01d111b1215e

end Resolution_Takuzu;
