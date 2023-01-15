package Coordonnee is

   type Type_Coordonnee is private;

   -- retourne la valeur d'une Coordonnee
   function ConstruireCoordonnees
     (Ligne, Colonne : in Integer) return Type_Coordonnee;

   -- retourne le numero de la ligne dans lequel se trouve la coordonnee c
   function ObtenirLigne (C : in Type_Coordonnee) return Integer;

   -- retourne le numero de la colonne dans lequel se trouve la coordonnee c
   function ObtenirColonne (C : in Type_Coordonnee) return Integer;

private
   type Type_Coordonnee is record
      Ligne   : Integer; -- ligne d'une coordonnée
      Colonne : Integer; -- colonne d'une coordonnée
   end record;

end Coordonnee;
