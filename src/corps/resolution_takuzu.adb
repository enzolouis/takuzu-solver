with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Grille;              use Grille;
with Rangee;              use Rangee;
with Chiffre;             use Chiffre;
with Coordonnee;          use Coordonnee;
with Affichage;           use Affichage;
with Pile_TCC;            use Pile_TCC;
with Coord_Chiffres;      use Coord_Chiffres;

with Pile_TCC; use Pile_TCC;

package body Resolution_Takuzu is
   procedure RegleADoublonLigne
     (g : in out Type_Grille; L : in Integer; maj : in out Boolean)
   is
      rangee : Type_Rangee;
      coord  : Type_Coordonnee;
   begin
      rangee := extraireLigne (g, L);
      for i in 1 .. Taille (g) loop
         coord := ConstruireCoordonnees (L, i);
         if estCaseVide (g, coord) then
            --if i <= 2 then
            --    if SontDeuxChiffresDeDroiteEgaux(rangee, i) and chiffreDeDroite(rangee, i) /= INCONNU then
            --        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee, i+1)));
--        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(rangee, i+1)));
            --        maj := True;
            --    end if;
            --elsif i > Taille(g)-2 then
            --    if SontDeuxChiffresDeGaucheEgaux(rangee,i) and chiffreDeGauche(rangee, i) /= INCONNU then
            --        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
   --        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
            --        maj := True;
            --    end if;
            --else
            if SontDeuxChiffresDeDroiteEgaux (rangee, i) and
              chiffreDeDroite (rangee, i) /= INCONNU
            then
               rangee :=
                 AjouterChiffre
                   (rangee, i, Complement (ObtenirChiffre (rangee, i + 1)));
               g :=
                 FixerChiffre
                   (g, coord, Complement (ObtenirChiffre (rangee, i + 1)));
               maj := True;
            elsif SontDeuxChiffresDeGaucheEgaux (rangee, i) and
              chiffreDeGauche (rangee, i) /= INCONNU
            then
               rangee :=
                 AjouterChiffre
                   (rangee, i, Complement (ObtenirChiffre (rangee, i - 1)));
               g :=
                 FixerChiffre
                   (g, coord, Complement (ObtenirChiffre (rangee, i - 1)));
               maj := True;
            end if;
            -- end if;
         end if;
      end loop;
   end RegleADoublonLigne;

   procedure RegleADoublonColonne
     (g : in out Type_Grille; Col : in Integer; maj : in out Boolean)
   is
      rangee : Type_Rangee;
      coord  : Type_Coordonnee;
   begin
      rangee := extraireColonne (g, Col);
      for i in 1 .. Taille (g) loop
         coord := ConstruireCoordonnees (i, Col);
         if estCaseVide (g, coord) then
            --if i <= 2 then
            --    if SontDeuxChiffresDeDroiteEgaux(rangee,i) and chiffreDeDroite(rangee, i) /= INCONNU then
            --        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i+1)));
   --        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I+1)));
            --        maj := True;
            --    end if;
            --elsif i > Taille(g)-2 then
            --    if SontDeuxChiffresDeGaucheEgaux(rangee,i) and chiffreDeGauche(rangee, i) /= INCONNU then
            --        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
   --        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
            --        maj := True;
            --    end if;
            --else
            if SontDeuxChiffresDeDroiteEgaux (rangee, i) and
              chiffreDeDroite (rangee, i) /= INCONNU
            then
               rangee :=
                 AjouterChiffre
                   (rangee, i, Complement (ObtenirChiffre (rangee, i + 1)));
               g :=
                 FixerChiffre
                   (g, coord, Complement (ObtenirChiffre (rangee, i + 1)));
               maj := True;
            elsif SontDeuxChiffresDeGaucheEgaux (rangee, i) and
              chiffreDeGauche (rangee, i) /= INCONNU
            then
               rangee :=
                 AjouterChiffre
                   (rangee, i, Complement (ObtenirChiffre (rangee, i - 1)));
               g :=
                 FixerChiffre
                   (g, coord, Complement (ObtenirChiffre (rangee, i - 1)));
               maj := True;
            end if;
            -- end if;
         end if;
      end loop;
   end RegleADoublonColonne;

   procedure RegleBLigne
     (G : in out Type_Grille; L : in Integer; maj : in out Boolean)
   is
      rangee : Type_Rangee;
      coord  : Type_Coordonnee;
   begin
      rangee := extraireLigne (G, L);
      for i in 2 .. Taille (G) - 1 loop
         coord := ConstruireCoordonnees (L, i);
         if estCaseVide (G, coord) then
            if chiffreDeDroite (rangee, i) = chiffreDeGauche (rangee, i) and
              chiffreDeGauche (rangee, i) /= INCONNU
            then -- ou chiffreDroite pareil
               rangee :=
                 AjouterChiffre
                   (rangee, i,
                    Complement
                      (ObtenirChiffre
                         (rangee, i + 1))); -- ou i-1
               G :=
                 FixerChiffre
                   (G, coord, Complement (ObtenirChiffre (rangee, i + 1)));
               maj := True;

            end if;
         end if;
      end loop;
   end RegleBLigne;

   procedure RegleBColonne
     (G : in out Type_Grille; Col : in Integer; maj : in out Boolean)
   is
      rangee : Type_Rangee;
      coord  : Type_Coordonnee;
   begin
      rangee := extraireColonne (G, Col);
      for i in 2 .. Taille (G) - 1 loop
         coord := ConstruireCoordonnees (i, Col);
         if estCaseVide (G, coord) then
            if chiffreDeDroite (rangee, i) = chiffreDeGauche (rangee, i) and
              chiffreDeGauche (rangee, i) /= INCONNU
            then
               rangee :=
                 AjouterChiffre
                   (rangee, i,
                    Complement
                      (ObtenirChiffre
                         (rangee, i + 1))); -- ou i-1
               G :=
                 FixerChiffre
                   (G, coord, Complement (ObtenirChiffre (rangee, i + 1)));
               maj := True;
            end if;
         end if;
      end loop;
   end RegleBColonne;

   -- cette fonction rempli les cases vides d'un Ligne d'une Grille par V de type_chiffre (1 ou 0)
   procedure RegleCCompleterLigne
     (G : in out Type_Grille; L : in Integer; V : in Type_Chiffre)
   is
      C : Type_Coordonnee; -- coordonee C
   begin
      for x in 1 .. Taille (G) loop -- tque il reste une case
         C := ConstruireCoordonnees (L, x); -- maj de C
         if estCaseVide (G, C)
         then -- si la case courante est vide alors on lui donne la valeur V
            G := FixerChiffre (G, C, V);
         end if;
      end loop;
   end RegleCCompleterLigne;

   -- cette fonction rempli les cases vides d'une Colone d'une Grille par V de type_chiffre (1 ou 0)
   procedure RegleCCompleterColonne
     (G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre)
   is
      C : Type_Coordonnee; -- coordonee C
   begin
      for x in 1 .. Taille (G) loop
         C := ConstruireCoordonnees (x, Col); -- maj de C
         if estCaseVide (G, C)
         then -- si la case courante est vide alors on lui donne la valeur V
            G := FixerChiffre (G, C, V);
         end if;
      end loop;
   end RegleCCompleterColonne;

   function RegleDLigne (G : in Type_Grille) return Boolean is
   begin
      for x in 1 .. Taille (G) loop
         for y in x .. Taille (G) loop
            if x /= y then
               if extraireLigne (G, x) = extraireLigne (G, y) then
                  return False;
               end if;
            end if;
         end loop;
      end loop;
      return True;
   end RegleDLigne;

   function RegleDColonne (G : in Type_Grille) return Boolean is
   begin
      for x in 1 .. Taille (G) loop
         for y in x .. Taille (G) loop
            if x /= y then
               if extraireColonne (G, x) = extraireColonne (G, y) then
                  return False;
               end if;
            end if;
         end loop;
      end loop;
      return True;
   end RegleDColonne;

   function is_valid_ligne
     (g : in Type_Grille; L : Integer; n : in Integer) return Boolean
   is
      rangee : Type_Rangee;
      coord  : Type_Coordonnee;
   begin
      rangee := extraireLigne (g, L);
      for i in 1 .. Taille (g) loop
         coord := ConstruireCoordonnees (L, i);
         if SontDeuxChiffresDeDroiteEgaux (rangee, i) and
           ObtenirChiffre (rangee, i) = chiffreDeDroite (rangee, i) and
           not EstInconnue (ObtenirChiffre (rangee, i))
         then
            return False;
         elsif SontDeuxChiffresDeGaucheEgaux (rangee, i) and
           ObtenirChiffre (rangee, i) = chiffreDeGauche (rangee, i) and
           not EstInconnue (ObtenirChiffre (rangee, i))
         then
            return False;
         end if;

         if nombreChiffresDeValeur (rangee, UN) > n / 2 or
           nombreChiffresDeValeur (rangee, ZERO) > n / 2
         then
            return False;
         end if;
      end loop;

      return True;
   end is_valid_ligne;

   function is_valid_colonne
     (g : in Type_Grille; Col : Integer; n : in Integer) return Boolean
   is
      rangee : Type_Rangee;
      coord  : Type_Coordonnee;
   begin
      rangee := extraireColonne (g, Col);
      for i in 1 .. Taille (g) loop
         coord := ConstruireCoordonnees (i, Col);
         if SontDeuxChiffresDeDroiteEgaux (rangee, i) and
           ObtenirChiffre (rangee, i) = chiffreDeDroite (rangee, i) and
           not EstInconnue (ObtenirChiffre (rangee, i))
         then
            return False;
         elsif SontDeuxChiffresDeGaucheEgaux (rangee, i) and
           ObtenirChiffre (rangee, i) = chiffreDeGauche (rangee, i) and
           not EstInconnue (ObtenirChiffre (rangee, i))
         then
            return False;
         end if;

         if nombreChiffresDeValeur (rangee, UN) > n / 2 or
           nombreChiffresDeValeur (rangee, ZERO) > n / 2
         then
            return False;
         end if;
      end loop;

      return True;
   end is_valid_colonne;

   function Is_Valid (G : in Type_Grille) return Boolean is
      N : Integer := Taille (G);
   begin
      for X in 1 .. N loop
         if not is_valid_ligne (G, X, N) then
            return False;
         end if;
      end loop;
      for Y in 1 .. N loop
         if not is_valid_colonne (G, Y, N) then
            return False;
         end if;
      end loop;
		
		
			
      return True;
   end Is_Valid;

   procedure Depiler_V2 (pile : in out Type_Pile; g : in out Type_Grille) is
   -- coord_chiffres : Type_Coord_Chiffre;
   begin
      while dernier (pile).chiffre = UN loop
         --AfficherGrille(g);
         --put("viderCase 1" & Integer'Image(ObtenirLigne(dernier(pile).coord)) & Integer'Image(ObtenirColonne(dernier(pile).coord)) & "|" & Integer'Image(ValeurChiffre(dernier(pile).chiffre)));
         g :=
           ViderCase
             (g,
              ConstruireCoordonnees
                (ObtenirLigne (dernier (pile).coord),
                 ObtenirColonne (dernier (pile).coord)));
         pile := depiler (pile);
      end loop;
      -- on depile le dernier 0 pour le remplacant ensuite par un 1
      pile := depiler (pile);
      --put("viderCase 2" & Integer'Image(ObtenirLigne(dernier(pile).coord)) & Integer'Image(ObtenirColonne(dernier(pile).coord)) & "|" & Integer'Image(ValeurChiffre(dernier(pile).chiffre)));
      g :=
        ViderCase
          (g,
           ConstruireCoordonnees
             (ObtenirLigne (dernier (pile).coord),
              ObtenirColonne (dernier (pile).coord)));
      g :=
        FixerChiffre
          (g,
           ConstruireCoordonnees
             (ObtenirLigne (dernier (pile).coord),
              ObtenirColonne (dernier (pile).coord)),
           UN); -- c'est forcement un 1 mais on peut mettre dernier(pile).chiffre
      -- pas besoin de re empiler il y a deja un 1 enregistre normalement avant le 0 au meme coordonnees  
	   -- complement du dernier
      --coord_chiffres := dernier (pile);
      --coord_chiffres.chiffre := UN;
      --pile := empiler (pile, coord_chiffres);
   end Depiler_V2;

   procedure ResoudreTakuzu (g : in out Type_Grille; trouve : out Boolean) is
      -- algorithme naif
      n               : Integer;
      rangee_courante : Type_Rangee;
      maj             : Boolean;

      -- algorithme backtracking
      pile           : Type_Pile;
      coord_chiffres : Type_Coord_Chiffre;
      i              : Integer;
      j              : Integer;

   begin
      -- algorithme naif
      trouve := False;
      n      := Taille (g);
      maj    := True;
      while not EstRemplie (g) and maj loop
         maj := False;
         for x in 1 .. n loop
            rangee_courante := extraireLigne (g, x);
            if nombreChiffresConnus (rangee_courante) /= n then
               RegleADoublonLigne (g, x, maj);
               RegleBLigne (g, x, maj);
               if nombreChiffresDeValeur (rangee_courante, UN) = n / 2 then
                  RegleCCompleterLigne (g, x, ZERO);
                  maj := True;
               elsif nombreChiffresDeValeur (rangee_courante, ZERO) = n / 2
               then
                  RegleCCompleterLigne (g, x, UN);
                  maj := True;
               end if;
            end if;
         end loop;

         for x in 1 .. n loop
            rangee_courante := extraireColonne (g, x);
            if nombreChiffresConnus (rangee_courante) /= n then
               RegleADoublonColonne (g, x, maj);
               RegleBColonne (g, x, maj);
               if nombreChiffresDeValeur (rangee_courante, UN) = n / 2 then
                  RegleCCompleterColonne (g, x, ZERO);
                  maj := True;
               elsif nombreChiffresDeValeur (rangee_courante, ZERO) = n / 2
               then
                  RegleCCompleterColonne (g, x, UN);
                  maj := True;
               end if;
            end if;
         end loop;
      end loop;
	
      if EstRemplie (g) then -- and <conditionRegleD>
         trouve := True;
      end if;

      -- algorithme de backtracking (IMPLEMENTATION TAD_PILE iterative, moins opti que la recursive)
      if not trouve then
         pile := construirePile;
         -- les deux while sont equivalent a
         -- for i in 1..Taille(G) loop
         -- for j in 1..Taille(G) loop
         -- mais dans les tests on modifie i et j donc on laisse while pour l'instant

         i := 0;
         while i < Taille (g) loop
            i := i + 1;
            j := 0;
            while j < Taille (g) loop
               j := j + 1;
               if estCaseVide (g, ConstruireCoordonnees (i, j)) then
                  coord_chiffres.coord   := ConstruireCoordonnees (i, j);
                  coord_chiffres.chiffre := UN;
                  pile                   := empiler (pile, coord_chiffres);
                  coord_chiffres.chiffre := ZERO;
                  pile                   := empiler (pile, coord_chiffres);
                  if Is_Valid
                      (FixerChiffre (g, ConstruireCoordonnees (i, j), ZERO))
                  then
                     --coord_chiffres.chiffre := UN;
                     --pile                   := empiler (pile, coord_chiffres);
                     --coord_chiffres.chiffre := ZERO;
                     --pile                   := empiler (pile, coord_chiffres);
                     g := FixerChiffre (g, ConstruireCoordonnees (i, j), ZERO);
                  elsif Is_Valid
                      (FixerChiffre (g, ConstruireCoordonnees (i, j), UN))
                  then
                     pile := depiler (pile);
                     --coord_chiffres.chiffre := UN;
						--pile                   := empiler (pile, coord_chiffres);
                     --coord_chiffres.chiffre := ZERO
						--pile                   := empiler (pile, coord_chiffres);
                     g := FixerChiffre (g, ConstruireCoordonnees (i, j), UN);
                  else
                     pile := depiler (pile);
                     pile := depiler (pile);
                     Depiler_V2 (pile, g);
                     i := ObtenirLigne (dernier (pile).coord);
                     j := ObtenirColonne (dernier (pile).coord);
                  end if;
               end if;
            end loop;
         end loop;
         if EstRemplie (g) then
            trouve := True;
         end if;
      end if;

      AfficherGrille (g);
   end ResoudreTakuzu;

end Resolution_Takuzu;
