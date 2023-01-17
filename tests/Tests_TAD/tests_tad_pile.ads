with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package tests_TAD_Pile is

   type Pt_Fonction is access function return Boolean;

   type Test_Unitaire is limited record
      function_Of_Test : Pt_Fonction;
      error_Test       : Unbounded_String;
   end record;

   function test_P1 return Boolean;
   function test_P2 return Boolean;
   function test_P3 return Boolean;
   function test_P4a return Boolean;
   function test_P4b return Boolean;
   function test_Exception_Pile_Pleine return Boolean;
   function test_Exception_Pile_Videa return Boolean;
   function test_Exception_Pile_Videb return Boolean;

   les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((test_P1'Access, To_Unbounded_String("echec de la propriété 1")),
      (test_P2'Access, To_Unbounded_String("echec de la propriété 2")),
      (test_P3'Access, To_Unbounded_String("echec de la propriété 3")),
      (test_P4a'Access, To_Unbounded_String("echec de la propriété 4a")),
      (test_P4b'Access, To_Unbounded_String("echec de la propriété 4b")),
      (test_Exception_Pile_Pleine'Access, To_Unbounded_String("echec de la propriété Exception Pile Pleine")),
      (test_Exception_Pile_Videa'Access, To_Unbounded_String("echec de la propriété Exception Pile Vide a")),
      (test_Exception_Pile_Videa'Access, To_Unbounded_String("echec de la propriété Exception Pile Vide b")));

   resultats : array(les_Tests'Range) of Boolean;

end tests_TAD_Pile;
