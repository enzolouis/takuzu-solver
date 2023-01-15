with Chiffre; use Chiffre;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package A_Tester_Chiffre is

   -- tests TAD Chiffre
   function Test_Chiffre_P1 return Boolean; --1
   function Test_Chiffre_P2 return Boolean; --2
   function Test_Chiffre_P3 return Boolean; --3
   function Test_Chiffre_P4 return Boolean; --4
   function Test_Chiffre_P5 return Boolean; --5
   function Test_Chiffre_P6 return Boolean; --6
   function Test_Chiffre_P7 return Boolean; --7
   function Test_Chiffre_P8 return Boolean; --8
   function Test_Chiffre_Complement_Exception return Boolean; --9
   function Test_Chiffre_P9a return Boolean; --10
   function Test_Chiffre_P9b return Boolean; --11
   function Test_Chiffre_P9c return Boolean; --12
   function Test_Chiffre_P9d return Boolean; --13
   function Test_Chiffre_P9e return Boolean; --14
   function Test_Chiffre_P9f return Boolean; --15
   function Test_Chiffre_P9g return Boolean; --16
   function Test_Chiffre_P9h return Boolean; --17
   function Test_Chiffre_P9i return Boolean; --18

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((Test_Chiffre_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Chiffre")),
      (Test_Chiffre_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Chiffre")),
      (Test_Chiffre_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Chiffre")),
      (Test_Chiffre_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 Chiffre")),
      (Test_Chiffre_P5'Access,
       To_Unbounded_String ("echec de la propriete 5 Chiffre")),
      (Test_Chiffre_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 Chiffre")),
      (Test_Chiffre_P7'Access,
       To_Unbounded_String ("echec de la propriete 7 Chiffre")),
      (Test_Chiffre_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 Chiffre")),
      (Test_Chiffre_Complement_Exception'Access,
       To_Unbounded_String ("echec de la levée d'exception de Chiffre")),
      (Test_Chiffre_P9a'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9b'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9c'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9d'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9e'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9f'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9g'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9h'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")),
      (Test_Chiffre_P9i'Access,
       To_Unbounded_String ("echec de la propriete 9 Chiffre (égalité)")));

   Resultats : array (Les_Tests'Range) of Boolean;

end A_Tester_Chiffre;
