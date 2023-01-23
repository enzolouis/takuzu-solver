pragma Ada_2012;
package body Coordonnee is

   ---------------------------
   -- ConstruireCoordonnees --
   ---------------------------

   function ConstruireCoordonnees (Ligne, Colonne : in Integer) return Type_Coordonnee is
      coord : Type_Coordonnee;
   begin
      coord.Ligne := Ligne;
      coord.Colonne := Colonne;
      return coord;
   end ConstruireCoordonnees;

   ------------------
   -- ObtenirLigne --
   ------------------

   function ObtenirLigne (C : in Type_Coordonnee) return Integer is
   begin
      return C.Ligne;
   end ObtenirLigne;

   --------------------
   -- ObtenirColonne --
   --------------------

   function ObtenirColonne (C : in Type_Coordonnee) return Integer is
   begin
      return C.Colonne;
   end ObtenirColonne;

end Coordonnee;
