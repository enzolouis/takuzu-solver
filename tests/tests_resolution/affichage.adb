with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Affichage is

   procedure AfficherLigneTirets (Taille : in Integer) is
   begin
      Put ("  ");
      for I in 1 .. NB_POSITIONS * Taille loop
         Put ('-');
      end loop;
      New_Line;
   end AfficherLigneTirets;

   --------------------
   -- AfficherValeur --
   --------------------

   procedure AfficherValeur (V : in Type_Chiffre) is
   begin
      Put ("  ");
      if V = ZERO then
         --         Put (0, NB_POSITIONS);
         Put ('O');
      elsif V = UN then
         --         Put (1, NB_POSITIONS);
         Put ('1');
      else
         --Put (2, NB_POSITIONS);
         Put ('-');
      end if;
      Put ("  ");
   end AfficherValeur;

   ------------------
   -- AfficherCase --
   ------------------

   procedure AfficherCase (G : in Type_Grille; C : in Type_Coordonnee) is
      Valeur : Type_Chiffre;
   begin
      if estCaseVide (G, C) then
         Valeur := INCONNU;
      else
         Valeur := (ObtenirChiffre (G, C));
      end if;
      AfficherValeur (Valeur);
   end AfficherCase;

   --------------------
   -- AfficherGrille --
   --------------------

   procedure AfficherGrille (G : in Type_Grille) is
   begin
      New_Line;
      AfficherLigneTirets (Taille (G));
      for i in 1 .. Taille (G) loop
         AfficherLigne (G, i);
         AfficherLigneTirets (Taille (G));
      end loop;
      New_Line;
   end AfficherGrille;

   ----------------------
   -- AfficherResultat --
   ----------------------

   procedure AfficherResultat
     (G : in Type_Grille; Trouve : in Boolean; NbChiffresDepart : in Integer)
   is
   begin
      if Trouve then
         Put_Line ("Takuzu résolu");
      else
         Put_Line ("Résultat non trouvé");
         Put ("Nombre de chiffres trouvés : ");
         Put (NombreChiffresConnus (G) - NbChiffresDepart, 0);
         Put (" sur ");
         Put (Taille (G)**2, 0);
         New_Line;
      end if;
      --AfficherGrille (G);
   end AfficherResultat;

   ------------------------
   -- AfficherCoordonnee --
   ------------------------

   procedure AfficherCoordonnee (C : in Type_Coordonnee) is
   begin
      Put ("(");
      Put (ObtenirLigne (C), 0);
      Put (",");
      Put (ObtenirColonne (C), 0);
      Put (")");
   end AfficherCoordonnee;

   -------------------
   -- AfficherLigne --
   -------------------

   procedure AfficherLigne (G : in Type_Grille; Lig : in Integer) is
      C : Type_Coordonnee;
   begin
      Put (" |");
      for J in 1 .. Taille (G) loop
         C := ConstruireCoordonnees (Lig, J);
         AfficherCase (G, C);
      end loop;
      Put (" | ");
      Put (Lig, 0);
      New_Line;
   end AfficherLigne;

   ---------------------
   -- AfficherColonne --
   ---------------------

   procedure AfficherColonne (G : in Type_Grille; Col : in Integer) is
      C : Type_Coordonnee;
   begin
      Put (" |");
      for i in 1 .. Taille (G) loop
         C := ConstruireCoordonnees (i, Col);
         AfficherCase (G, C);
      end loop;
      Put ("    |");
      New_Line;
   end AfficherColonne;

   --------------------
   -- AfficherRangee --
   --------------------

   procedure AfficherRangee (E : in Type_Rangee) is
   begin
      Put (" |");
      for I in 1 .. Taille (E) loop
         AfficherValeur (ObtenirChiffre (E, I));
      end loop;
      Put ("    |");
      New_Line;
   end AfficherRangee;

end Affichage;
