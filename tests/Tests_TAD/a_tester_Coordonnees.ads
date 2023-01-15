with Coordonnee; use Coordonnee;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package a_tester_Coordonnees is

   -- tests TAD Coordonnees
   function Test_Coordonnees_P1 return Boolean; --1
   function Test_Coordonnees_P2 return Boolean; --2

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((Test_Coordonnees_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Coordonnees")),
      (Test_Coordonnees_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Coordonnees")));

   Resultats : array (Les_Tests'Range) of Boolean;

end a_tester_Coordonnees;
