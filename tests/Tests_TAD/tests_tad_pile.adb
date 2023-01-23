-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
--with TAD_Coordonnee;      use TAD_Coordonnee;
with Pile_Entier;        use Pile_Entier;
--with TAD_grilleSudoku; use TAD_grilleSudoku;
with affichage; use affichage;
-- Résolutions de sudoku
with affichage;           use affichage;
with resolution_takuzu;         use resolution_takuzu;
with Remplir_Grille_Takuzu;       use Remplir_Grille_Takuzu;

package body tests_TAD_Pile is

   -------------
   -- test_P1 --
   -------------
   function test_P1 return Boolean is
      p : Type_Pile ;
   begin
      p := construirePile ;
      return estVide(p);
   end test_P1;

   ----------------
   -- test_P2 --
   ----------------
   function test_P2  return Boolean is
      p : Type_Pile;
   begin
      p := construirePile;
      p := empiler(p, 10) ;
      return not (estVide (p));
   end test_P2;

   ----------------
   -- test_P3 --
   ----------------
	function test_P3  return Boolean is
		p : Type_Pile;
	begin
		p := construirePile;
		p := empiler(p, 10) ;
		return dernier (p) = 10 ;
   end test_P3;

   ---------------
   -- test_P4 --
   ---------------
 function test_P4a  return Boolean is
		p : Type_Pile;
   begin
      p := construirePile;
      p := empiler(p, 10) ;
      p := depiler (p) ;
      return estVide (p);
   end test_P4a;

   function test_P4b return Boolean is
      p : Type_Pile;
   begin
      p := construirePile;
      p := empiler(p, 10) ;
      p := empiler(p, 12) ;
      p := depiler (p) ;
      return dernier (p) = 10 ;
   end test_P4b;

   -------------------------------------------
   -- test_Exception_Pile_Pleine --
   -------------------------------------------
   function test_exception_Pile_Pleine  return Boolean is
	p : Type_Pile;
   begin
      p := construirePile;
      for i in 1..TAILLE_MAX+1 loop
         p := empiler(p, i+10) ;
      end loop ;
      return False ;
   exception
      when PILE_PLEINE =>
         return True;
      when others =>
         return False ;
   end test_exception_Pile_Pleine;

  -------------------------------------------
   -- test_Exception_Pile_Vide  --
   -------------------------------------------
   function test_exception_Pile_Videa  return Boolean is
      p : Type_Pile;
      i : integer ;
   begin
      p := construirePile;
      i := dernier(p) ;
      return false ;
   exception
      when PILE_VIDE =>
        return True;
      when others =>
        return False;
   end test_exception_Pile_Videa;

   function test_exception_Pile_Videb  return Boolean is
      p : Type_Pile;
   begin
      p := construirePile;
      p := depiler(p) ;
      return False;
   exception
      when PILE_VIDE =>
        return True;
      when others =>
        return False;
   end test_exception_Pile_Videb;

end tests_TAD_Pile;
