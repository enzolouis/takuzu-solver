package body A_Tester_Coordonnees is

   -----------------------
   -- tests coordonnees --
   -----------------------

   -- test obtenirLigne
   function Test_Coordonnees_P1 return Boolean is
   begin
      return ObtenirLigne (ConstruireCoordonnees (1, 2)) = 1;
   end Test_Coordonnees_P1;

   -- test obtenirColonne
   function Test_Coordonnees_P2 return Boolean is
   begin
      return ObtenirColonne (ConstruireCoordonnees (1, 2)) = 2;
   end Test_Coordonnees_P2;

end A_Tester_Coordonnees;
