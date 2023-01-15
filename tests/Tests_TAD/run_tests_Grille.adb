-- bibliothèques d'entrée sortie
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- Tests
with A_Tester_Grille; use A_Tester_Grille;

procedure Run_Tests_Grille is
begin
   -- execution automatique des tests
   for I in Les_Tests'Range loop
      Put ("test de ");
      Put (To_String (Les_Tests (I).Error_Test));
      Resultats (I) := Les_Tests (I).Function_Of_Test.all;
      if Resultats (I) then
         Put (" OK");
      else
         Put (" Non OK");
      end if;
      New_Line;
   end loop;

   -- affichage des resultats
   if (for all I in Resultats'Range => Resultats (I)) then
      Put_Line ("Tous les tests OK");
   else
      Put_Line ("***** ATTENTION *****");
      for I in Resultats'Range loop
         if not Resultats (I) then
            Put ("echec de la ");
            Put_Line (To_String (Les_Tests (I).Error_Test));
         end if;
      end loop;
   end if;
end Run_Tests_Grille;
