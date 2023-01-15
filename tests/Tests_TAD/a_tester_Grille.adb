-- bibliothÃ¨ques d'entrÃ©e sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with Coordonnee; use Coordonnee;
with Grille;     use Grille;
with Affichage;  use Affichage;
with Coordonnee; use Coordonnee;
with Chiffre;    use Chiffre;
with Rangee;     use Rangee;

package body A_Tester_Grille is

   TAILLE_GRILLE_TEST : constant Integer := 8;

   -----------------------
   -- Tests Grille Vide --
   -----------------------

   -- creation grille
   -- verification de la taille
   function Test_Grille_P1 return Boolean is
      G : Type_Grille;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      return Taille (G) = TAILLE_GRILLE_TEST;
   end Test_Grille_P1;

   -- creation grille
   -- verification que toutes les cases sont vides
   function Test_Grille_P2 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for I in 1 .. Taille (G) loop
         for J in 1 .. Taille (G) loop
            C := ConstruireCoordonnees (I, J);
            if (not estCaseVide (G, C)) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end Test_Grille_P2;

   -- creation grille
   -- verification que la grille ne contient que des chiffres inconnus
   function Test_Grille_P3 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for I in 1 .. Taille (G) loop
         for J in 1 .. Taille (G) loop
            C := ConstruireCoordonnees (I, J);
            if not estCaseVide (G, C) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end Test_Grille_P3;

   -- creation grille
   -- verification que le nombre de chiffres connus = 0
   function Test_Grille_P4 return Boolean is
      G : Type_Grille;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      return NombreChiffresConnus (G) = 0;
   end Test_Grille_P4;

   -- creation grille
   -- verification que la grille n'est pas remplie
   function Test_Grille_P5 return Boolean is
      G : Type_Grille;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      return EstRemplie (G) = False;
   end Test_Grille_P5;

   -- extraire une ligne
   -- vÃ©rifier qu'elle sest de la bonne taille
   function Test_Grille_P6 return Boolean is
      G : Type_Grille;
      R : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      R := extraireLigne (G, Taille (G));
      return Taille (R) = Taille (G);
   end Test_Grille_P6;

   -- extraire une ligne
   -- vÃ©rifier que toutes les cases sont toutes vide
   function Test_Grille_P7 return Boolean is
      G : Type_Grille;
      R : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for i in 1 .. TAILLE_GRILLE_TEST loop
         R := extraireLigne (G, i);
         if not EstVide (R) then
            return False;
         end if;
      end loop;
      return True;
   end Test_Grille_P7;

   -- extraire une colonne
   -- vÃ©rifier qu'elle est de la bonne taille
   function Test_Grille_P8 return Boolean is
      G : Type_Grille;
      R : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      R := extraireLigne (G, Taille (G));
      return Taille (R) = Taille (G);
   end Test_Grille_P8;

   -- extraire une colonne
   -- vÃ©rifier que toutes les cases sont vide
   function Test_Grille_P9 return Boolean is
      G : Type_Grille;
      R : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for i in 1 .. TAILLE_GRILLE_TEST loop
         R := extraireColonne (G, i);
         if not EstVide (R) then
            return False;
         end if;
      end loop;
      return True;
   end Test_Grille_P9;

   ---------------------------
   -- Tests Grille non vide --
   ---------------------------

   -- vÃ©rifier que la taille de la grille n'est pas modifiÃ©e aprÃ¨s
   -- l'ajout d'une valeur
   function Test_Grille_P10 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (Taille (G), Taille (G));
      G := FixerChiffre (G, C, UN);
      return Taille (G) = TAILLE_GRILLE_TEST;
   end Test_Grille_P10;

   -- vÃ©rifier que les cases vides sont celles
   -- dont la valeur est inconnue
   function Test_Grille_P11 return Boolean is
      G  : Type_Grille;
      CI : Type_Coordonnee;
      C0 : Type_Coordonnee;
      C1 : Type_Coordonnee;
   begin

      G  := ConstruireGrille (TAILLE_GRILLE_TEST);
      C1 := ConstruireCoordonnees (Taille (G), Taille (G));
      G  := FixerChiffre (G, C1, UN);
      C0 := ConstruireCoordonnees (1, 1);
      G  := FixerChiffre (G, C0, ZERO);
      CI := ConstruireCoordonnees (2, 5);
      return
        not estCaseVide (G, C1) and not estCaseVide (G, C0) and
        estCaseVide (G, CI);
   end Test_Grille_P11;

   -- vÃ©rifier que le chiffre entrÃ© dans une case
   --retourne la valeur entree
   function Test_Grille_P12 return Boolean is
      G  : Type_Grille;
      CI : Type_Coordonnee;
      C0 : Type_Coordonnee;
      C1 : Type_Coordonnee;
   begin
      G  := ConstruireGrille (TAILLE_GRILLE_TEST);
      C1 := ConstruireCoordonnees (Taille (G), Taille (G));
      G  := FixerChiffre (G, C1, UN);
      C0 := ConstruireCoordonnees (1, 1);
      G  := FixerChiffre (G, C0, ZERO);
      CI := ConstruireCoordonnees (2, 5);
      return
        ObtenirChiffre (G, C1) = UN and ObtenirChiffre (G, C0) = ZERO and
        estCaseVide (G, CI);
   end Test_Grille_P12;

   -- nombre de valeurs entree s'incremente de 1
   function Test_Grille_P13 return Boolean is
      G             : Type_Grille;
      C1            : Type_Coordonnee;
      C0            : Type_Coordonnee;
      CI            : Type_Coordonnee;
      CardinalAvant : Integer;
   begin
      G             := ConstruireGrille (TAILLE_GRILLE_TEST);
      CardinalAvant := NombreChiffresConnus (G);
      C1            := ConstruireCoordonnees (Taille (G), Taille (G));
      G             := FixerChiffre (G, C1, UN);
      C0            := ConstruireCoordonnees (1, 1);
      G             := FixerChiffre (G, C0, ZERO);
      CI            := ConstruireCoordonnees (2, 5);
      G             := FixerChiffre (G, CI, INCONNU);
      return NombreChiffresConnus (G) = CardinalAvant + 2;
   end Test_Grille_P13;

   -- VÃ©rifie que lorsque l'on rempli une case alors la grille n'est pas
   -- remplie
   function Test_Grille_P14a return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (Taille (G), Taille (G));
      G := FixerChiffre (G, C, UN);
      return not EstRemplie (G);
   end Test_Grille_P14a;

   -- rempli la grille avec des UN VÃ©rifie que la grille est remplie
   function Test_Grille_P14b return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for I in 1 .. Taille (G) loop
         for J in 1 .. Taille (G) loop
            C := ConstruireCoordonnees (I, J);
            G := FixerChiffre (G, C, UN);
         end loop;
      end loop;
      return EstRemplie (G);
   end Test_Grille_P14b;

   -- Extraire Ligne
   -- VÃ©rifie que les valeurs rentrÃ©e dans la ligne correspondent Ã
   -- celles de la ligne
   function Test_Grille_P15 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
      R : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for I in 1 .. Taille (G) loop
         for J in 1 .. Taille (G) loop
            C := ConstruireCoordonnees (I, J);
            G := FixerChiffre (G, C, UN);
         end loop;
      end loop;
      for i in 1 .. Taille (G) loop
         R := extraireLigne (G, i);
         for j in 1 .. Taille (G) loop
            if ObtenirChiffre (R, j) /= UN then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end Test_Grille_P15;

   -- Extraire Ligne
   -- VÃ©rifie que les valeurs rentrÃ©e dans la ligne correspondent Ã
   -- celles de la ligne
   function Test_Grille_P16 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
      R : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      for I in 1 .. Taille (G) loop
         for J in 1 .. Taille (G) loop
            C := ConstruireCoordonnees (I, J);
            G := FixerChiffre (G, C, UN);
         end loop;
      end loop;
      for i in 1 .. Taille (G) loop
         R := extraireColonne (G, i);
         for j in 1 .. Taille (G) loop
            if ObtenirChiffre (R, j) /= UN then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end Test_Grille_P16;

   -- ViderChiffre
   -- case remplie devient  vide
   function Test_Grille_P17 return Boolean is
      G  : Type_Grille;
      C1 : Type_Coordonnee;
      C0 : Type_Coordonnee;
   begin
      G  := ConstruireGrille (TAILLE_GRILLE_TEST);
      C1 := ConstruireCoordonnees (Taille (G), Taille (G));
      G  := FixerChiffre (G, C1, UN);
      G  := ViderCase (G, C1);
      C0 := ConstruireCoordonnees (1, 1);
      G  := FixerChiffre (G, C0, ZERO);
      return estCaseVide (G, C1) and not estCaseVide (G, C0);
   end Test_Grille_P17;

   ----------------
   -- Exceptions --
   ----------------

   -- Exception 1 : obtenirChiffre (g, c) est defini ssi non estCaseVide (g, c)
   function Test_Grille_Exception1 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (Taille (G), Taille (G));
      return ObtenirChiffre (G, C) = INCONNU;
   exception
      when CASE_VIDE =>
         return True;
      when others =>
         return False;
   end Test_Grille_Exception1;

   function Test_Grille_Exception2 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (Taille (G), Taille (G));
      G := FixerChiffre (G, C, UN);
      G := FixerChiffre (G, C, ZERO);
      return False;
   exception
      when FIXER_CHIFFRE_NON_NUL =>
         return True;
      when others =>
         return False;
   end Test_Grille_Exception2;

   function Test_Grille_Exception3 return Boolean is
      G : Type_Grille;
      C : Type_Coordonnee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (Taille (G), Taille (G));
      G := ViderCase (G, C);
      return False;
   exception
      when VIDER_CASE_VIDE =>
         return True;
      when others =>
         return False;
   end Test_Grille_Exception3;

   ---------------------------
   -- Tests supplÃ©mentaires --
   ---------------------------

   -- Test remplir ligne
   function Test_Remplir_Ligne return Boolean is
      G     : Type_Grille;
      C     : Type_Coordonnee;
      Ligne : Integer := 2;
      E     : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (Ligne, 2);
      G := FixerChiffre (G, C, ZERO);
      C := ConstruireCoordonnees (Ligne, 3);
      G := FixerChiffre (G, C, ZERO);
      C := ConstruireCoordonnees (Ligne, 5);
      G := FixerChiffre (G, C, ZERO);
      C := ConstruireCoordonnees (Ligne, 6);
      G := FixerChiffre (G, C, ZERO);
      E := extraireLigne (G, Ligne);
      return
        nombreChiffresConnus (E) = 4 and nombreChiffresDeValeur (E, UN) = 0 and
        nombreChiffresDeValeur (E, ZERO) = 4 and
        nombreChiffresDeValeur (E, INCONNU) = Taille (E) - 4;
   end Test_Remplir_Ligne;

   -- Test remplir colonne
   function Test_Remplir_Colonne return Boolean is
      G       : Type_Grille;
      C       : Type_Coordonnee;
      Colonne : Integer := 2;
      E       : Type_Rangee;
   begin
      G := ConstruireGrille (TAILLE_GRILLE_TEST);
      C := ConstruireCoordonnees (2, Colonne);
      G := FixerChiffre (G, C, ZERO);
      C := ConstruireCoordonnees (3, Colonne);
      G := FixerChiffre (G, C, ZERO);
      C := ConstruireCoordonnees (5, Colonne);
      G := FixerChiffre (G, C, ZERO);
      C := ConstruireCoordonnees (6, Colonne);
      G := FixerChiffre (G, C, ZERO);
      E := extraireColonne (G, 2);
      return
        nombreChiffresConnus (E) = 4 and nombreChiffresDeValeur (E, UN) = 0 and
        nombreChiffresDeValeur (E, ZERO) = 4 and
        nombreChiffresDeValeur (E, INCONNU) = Taille (E) - 4;
   end Test_Remplir_Colonne;

begin
   null;
end A_Tester_Grille;
