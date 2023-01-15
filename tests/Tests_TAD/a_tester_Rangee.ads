-- TAD
with Rangee; use Rangee;
-- test
with Types_Tests; use Types_Tests;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- bibliothèques d'entrée sortie (au cas où)
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package A_Tester_Rangee is

   -- REVOIR TOUS LES TESTS AVEC LA NOUVELLE VERSION DU TAD
   -- RAJOUTER TOUTES LES 8 LEVEES D'EXCEPTION

   -- tests TAD Rangee
   function Test_Rangee_P1 return Boolean; --1
   function Test_Rangee_P2 return Boolean; --2
   function Test_Rangee_P3 return Boolean; --3
   function Test_Rangee_P4 return Boolean; --4
   function Test_Rangee_P5 return Boolean; --5
   function Test_Rangee_P6 return Boolean; --6
   function Test_Rangee_P7 return Boolean; --7
   function Test_Rangee_P8 return Boolean; --8
   function Test_Rangee_P13 return Boolean; --13
   function Test_Rangee_P14 return Boolean; --14
   function Test_Rangee_P15 return Boolean; --15
   function Test_Rangee_P16 return Boolean; --16
   function Test_Rangee_P17a return Boolean; --17
   function Test_Rangee_P17b return Boolean; --18
   function Test_Rangee_P18 return Boolean; --19
   function Test_Rangee_P19 return Boolean; --20
   function Test_Rangee_P20 return Boolean; --21
   function Test_Rangee_P21 return Boolean; --22
   function Test_Rangee_P22a return Boolean; --23
    function Test_Rangee_P22b return Boolean; --24
  function Test_Rangee_P23a return Boolean; --25
  function Test_Rangee_P23b return Boolean; --26
   function Test_Rangee_P24 return Boolean; --27
   function Test_Rangee_P25 return Boolean; --28
   function Test_Rangee_P26 return Boolean; --29
   function Test_Rangee_Exception_1a return Boolean; --30
   function Test_Rangee_Exception_1b return Boolean; --31
   function Test_Rangee_Exception_2a return Boolean; --32
   function Test_Rangee_Exception_2b return Boolean; --33
   function Test_Rangee_Exception_3a return Boolean; --34
   function Test_Rangee_Exception_3b return Boolean; --35
   function Test_Rangee_Exception_4a return Boolean; --36
   function Test_Rangee_Exception_4b return Boolean; --37
   function Test_Rangee_Exception_5a return Boolean; --38
   function Test_Rangee_Exception_5b return Boolean; --39
   function Test_Rangee_Exception_6a return Boolean; --40
   function Test_Rangee_Exception_6b return Boolean; --41
   function Test_Rangee_Exception_7a return Boolean; --42
   function Test_Rangee_Exception_7b return Boolean; --43

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
   -- tests TAD Rangee

     ((Test_Rangee_P1'Access,
      To_Unbounded_String ("echec de la propriete 1 Rangee")),
      (Test_Rangee_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Rangee")),
      (Test_Rangee_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Rangee")),
      (Test_Rangee_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 Rangee")),
      (Test_Rangee_P5'Access,
       To_Unbounded_String ("echec de la propriete 5 Rangee")),
      (Test_Rangee_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 Rangee")),
      (Test_Rangee_P7'Access,
       To_Unbounded_String ("echec de la propriete 7 Rangee")),
      (Test_Rangee_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 Rangee")),
      (Test_Rangee_P13'Access,
       To_Unbounded_String ("echec de la propriete 13 Rangee")),
      (Test_Rangee_P14'Access,
       To_Unbounded_String ("echec de la propriete 14 Rangee")),
      (Test_Rangee_P15'Access,
       To_Unbounded_String ("echec de la propriete 15 Rangee")),
      (Test_Rangee_P16'Access,
       To_Unbounded_String ("echec de la propriete 16 Rangee")),
      (Test_Rangee_P17a'Access,
       To_Unbounded_String ("echec de la propriete 17a Rangee")),
      (Test_Rangee_P17b'Access,
       To_Unbounded_String ("echec de la propriete 17b Rangee")),
      (Test_Rangee_P18'Access,
       To_Unbounded_String ("echec de la propriete 18 Rangee")),
      (Test_Rangee_P19'Access,
       To_Unbounded_String ("echec de la propriete 19 Rangee")),
     (Test_Rangee_P20'Access,
       To_Unbounded_String ("echec de la propriete 20 Rangee")),
     (Test_Rangee_P21'Access,
       To_Unbounded_String ("echec de la propriete 21 Rangee")),
     (Test_Rangee_P22a'Access,
       To_Unbounded_String ("echec de la propriete 22a Rangee")),
     (Test_Rangee_P22b'Access,
       To_Unbounded_String ("echec de la propriete 22b Rangee")),
     (Test_Rangee_P23a'Access,
       To_Unbounded_String ("echec de la propriete 23a Rangee")),
     (Test_Rangee_P23b'Access,
       To_Unbounded_String ("echec de la propriete 23b Rangee")),
     (Test_Rangee_P24'Access,
       To_Unbounded_String ("echec de la propriete 24 Rangee")),
     (Test_Rangee_P25'Access,
       To_Unbounded_String ("echec de la propriete 25 Rangee")),
     (Test_Rangee_P26'Access,
       To_Unbounded_String ("echec de la propriete 26 Rangee")),
     (Test_Rangee_Exception_1a'Access,
       To_Unbounded_String ("echec de la levée d'exception 1a Rangee")),
     (Test_Rangee_Exception_1b'Access,
       To_Unbounded_String ("echec de la levée d'exception 1b Rangee")),
     (Test_Rangee_Exception_2a'Access,
       To_Unbounded_String ("echec de la levée d'exception 2a Rangee")),
     (Test_Rangee_Exception_2b'Access,
       To_Unbounded_String ("echec de la levée d'exception 2b Rangee")),
     (Test_Rangee_Exception_3a'Access,
       To_Unbounded_String ("echec de la levée d'exception 3a Rangee")),
     (Test_Rangee_Exception_3b'Access,
       To_Unbounded_String ("echec de la levée d'exception 3b Rangee")),
     (Test_Rangee_Exception_4a'Access,
       To_Unbounded_String ("echec de la levée d'exception 4a Rangee")),
     (Test_Rangee_Exception_4b'Access,
       To_Unbounded_String ("echec de la levée d'exception 4b Rangee")),
     (Test_Rangee_Exception_5a'Access,
       To_Unbounded_String ("echec de la levée d'exception 5a Rangee")),
     (Test_Rangee_Exception_5b'Access,
       To_Unbounded_String ("echec de la levée d'exception 5b Rangee")),
     (Test_Rangee_Exception_6a'Access,
       To_Unbounded_String ("echec de la levée d'exception 6a Rangee")),
     (Test_Rangee_Exception_6b'Access,
       To_Unbounded_String ("echec de la levée d'exception 6b Rangee")),
     (Test_Rangee_Exception_7a'Access,
       To_Unbounded_String ("echec de la levée d'exception 7a Rangee")),
     (Test_Rangee_Exception_7b'Access,
       To_Unbounded_String ("echec de la levée d'exception 7b Rangee"))
	);

   Resultats : array (Les_Tests'Range) of Boolean;

end A_Tester_Rangee;
