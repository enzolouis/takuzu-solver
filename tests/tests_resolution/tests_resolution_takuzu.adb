with resolution_Takuzu;    use resolution_Takuzu;
with Grille;               use Grille;
with affichage;            use affichage;
with Ada.Text_IO;          use Ada.Text_IO;
with remplir_grille_takuzu; use remplir_grille_takuzu;
with Pile_TCC; use Pile_TCC;

procedure tests_Resolution_Takuzu is

   --------------------------------------------------
   -- Procedure d'affichage du test de la grille g --
   --------------------------------------------------
   procedure test (g : in out Type_Grille; m : in String) is
      nbChiffresDepart : Integer;
		--Pile : Pile_TCC.Type_Pile;
		trouve:Boolean;
   begin
      New_Line;
      Put_Line ("*************************************************");
      Put_Line (m);
      Put_Line ("*************************************************");
      afficherGrille (g);
      nbChiffresDepart := NombreChiffresConnus (g);
      resoudreTakuzu (G,  trouve);
      afficherResultat (G, trouve, nbChiffresDepart);
   end test;

   TRACE                  : Boolean := False;
   G0                     : Type_Grille;
   G1, G2, G3, G4, G5, G6 : Type_Grille;
   G7                     : Type_Grille;
   G8                     : Type_Grille;

begin

   --------------------------------------
   -- Initialisation de toutes les grilles
   --------------------------------------

   -- On initialise les 9 grilles a des difficultes differentes
   g0 := Lire_Grille("g0.txt");
   g1 := Lire_Grille("g1.txt");
   g2 := Lire_Grille("g2.txt");
   g3 := Lire_Grille("g3.txt");
   g4 := Lire_Grille("g4.txt");
   g5 := Lire_Grille("g5.txt");
   g6 := Lire_Grille("g6.txt");
   g7 := Lire_Grille("g7.txt");
   g8 := Lire_Grille("g8.txt");


	-- test is_valid vite fait
	--if is_valid(g0) and is_valid(g1) and is_valid(g2) and is_valid(g3) and is_valid(g4) then
	--	put("test");
	--end if;

   -- On les teste une par une
   test (g0, "***  Takuzu tres facile taille 6 : grille 0   ***");
   --test (g1, "*** Takuzu grille tres tres facile : grille 1 ***");
   --test (g2, "***    Takuzu grille tres facile : grille 2   ***");
   --test (g3, "***    Takuzu grille tres facile : grille 3   ***");
   --test (g4, "***      Takuzu grille moyenne : grille 4     ***");
   --test (g5, "***     Takuzu grille difficile : grille 5    ***");
   --test (g6, "***  Takuzu grille tres difficile : grille 6  ***");
   --test (g7, "***     Takuzu grille taille 10 : grille 7    ***");
   --test (g8, "***     Takuzu grille taille 12 : grille 8    ***");



end tests_Resolution_Takuzu;
