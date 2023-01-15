with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package A_Tester_Grille is

   type Pt_Fonction is access function return Boolean;

   type Test_Unitaire is limited record
      Function_Of_Test : Pt_Fonction;
      Error_Test       : Unbounded_String;
   end record;

   -- tests tests TAD GrillesTakuzu
   function Test_Grille_P1 return Boolean; --1
   function Test_Grille_P2 return Boolean; --2
   function Test_Grille_P3 return Boolean; --3
   function Test_Grille_P4 return Boolean; --4
   function Test_Grille_P5 return Boolean; --5
   function Test_Grille_P6 return Boolean; --6
   function Test_Grille_P7 return Boolean; --7
   function Test_Grille_P8 return Boolean; --8
   function Test_Grille_P9 return Boolean; --9
   function Test_Grille_P10 return Boolean; --10
   function Test_Grille_P11 return Boolean; --11
   function Test_Grille_P12 return Boolean; --12
   function Test_Grille_P13 return Boolean; --13
   function Test_Grille_P14a return Boolean; --14
   function Test_Grille_P14b return Boolean; --15
   function Test_Grille_P15 return Boolean; --16
   function Test_Grille_P16 return Boolean; --17
   function Test_Grille_P17 return Boolean; --18
   function Test_Grille_Exception1 return Boolean; --19
   function Test_Grille_Exception2 return Boolean; --20
   function Test_Grille_Exception3 return Boolean; --21
   function Test_Remplir_Ligne return Boolean; --22
   function Test_Remplir_Colonne return Boolean; --23

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
   -- tests TAD GrillesSudoku

     ((Test_Grille_P1'Access, To_Unbounded_String ("la propriete 1 Grille")),
      (Test_Grille_P2'Access, To_Unbounded_String ("la propriete 2 Grille")),
      (Test_Grille_P3'Access, To_Unbounded_String ("la propriete 3 Grille")),
      (Test_Grille_P4'Access, To_Unbounded_String ("la propriete 4 Grille")),
      (Test_Grille_P5'Access, To_Unbounded_String ("la propriete 5 Grille")),
      (Test_Grille_P6'Access, To_Unbounded_String ("la propriete 6 Grille")),
      (Test_Grille_P7'Access, To_Unbounded_String ("la propriete 7 Grille")),
      (Test_Grille_P8'Access, To_Unbounded_String ("la propriete 8 Grille")),
      (Test_Grille_P9'Access, To_Unbounded_String ("la propriete 9 Grille")),
      (Test_Grille_P10'Access, To_Unbounded_String ("la propriete 10 Grille")),
      (Test_Grille_P11'Access, To_Unbounded_String ("la propriete 11 Grille")),
      (Test_Grille_P12'Access, To_Unbounded_String ("la propriete 12 Grille")),
      (Test_Grille_P13'Access, To_Unbounded_String ("la propriete 13 Grille")),
      (Test_Grille_P14a'Access,
       To_Unbounded_String ("la propriete 14a Grille")),
      (Test_Grille_P14b'Access,
       To_Unbounded_String ("la propriete 14b Grille")),
      (Test_Grille_P15'Access, To_Unbounded_String ("la propriete 15 Grille")),
      (Test_Grille_P16'Access, To_Unbounded_String ("la propriete 16 Grille")),
      (Test_Grille_P17'Access, To_Unbounded_String ("la propriete 17 Grille")),
      (Test_Grille_Exception1'Access,
       To_Unbounded_String ("l'exception 1 Grille")),
      (Test_Grille_Exception2'Access,
       To_Unbounded_String ("l'exception 2 Grille")),
      (Test_Grille_Exception3'Access,
       To_Unbounded_String ("l'exception 3 Grille")),
      (Test_Remplir_Ligne'Access,
       To_Unbounded_String ("construire Ligne Grille")),
      (Test_Remplir_Colonne'Access,
       To_Unbounded_String ("construire Colonne Grille")));

   Resultats : array (Les_Tests'Range) of Boolean;

end A_Tester_Grille;
