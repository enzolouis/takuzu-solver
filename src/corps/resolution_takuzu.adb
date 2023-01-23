with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Grille;              use Grille;
with Rangee;              use Rangee;
with Chiffre;             use Chiffre;
with Coordonnee;          use Coordonnee;
with Affichage;           use Affichage;
with Pile_TCC;            use Pile_TCC;
with Coord_Chiffres;      use Coord_Chiffres;

with Pile_TCC;use Pile_TCC;

package body Resolution_Takuzu is
   procedure RegleADoublonLigne(g: in out Type_Grille; L:  in Integer; maj : in out Boolean) is
        rangee:Type_rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireLigne(g,L);
        for i in 1..Taille(g) loop
            coord := ConstruireCoordonnees(L, i);
            if estCaseVide(G, coord) then
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
                if SontDeuxChiffresDeDroiteEgaux(rangee,i) and chiffreDeDroite(rangee, i) /= INCONNU then
				      rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i+1)));
                    g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I+1)));
                    maj := True;            
                elsif SontDeuxChiffresDeGaucheEgaux(rangee, i) and chiffreDeGauche(rangee, i) /= INCONNU then
                    rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
                    g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
                    maj := True;
                end if;
              -- end if;
            end if;
        end loop;
    end RegleADoublonLigne;

    procedure RegleADoublonColonne(g: in out Type_Grille; Col:  in Integer; maj : in out Boolean) is
        rangee:Type_rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireColonne(g,Col);
        for i in 1..Taille(g) loop
            coord := ConstruireCoordonnees(i,Col);
            if estCaseVide(G,coord) then
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
                    if SontDeuxChiffresDeDroiteEgaux(rangee,i) and chiffreDeDroite(rangee, i) /= INCONNU then
                      rangee := AjouterChiffre(Rangee,I,Complement(ObtenirChiffre(Rangee,I+1)));
                      g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I+1)));
                      maj := True;
                  elsif SontDeuxChiffresDeGaucheEgaux(rangee,i) and chiffreDeGauche(rangee, i) /= INCONNU then
                      rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
                      g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
                      maj := True;
                  end if;
                -- end if;
            end if;
        end loop;
    end RegleADoublonColonne;
	 
    procedure RegleBLigne(G : in out Type_Grille; L : in Integer; maj : in out Boolean) is
        rangee:Type_Rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireLigne(G, L);
        for i in 2..Taille(G)-1 loop
            coord := ConstruireCoordonnees(L, i);
            if estCaseVide(G, coord) then
                if chiffreDeDroite(rangee, i) = chiffreDeGauche(rangee, i) and chiffreDeGauche(rangee, i) /= INCONNU then -- ou chiffreDroite pareil
                    rangee := AjouterChiffre(rangee, i, Complement(ObtenirChiffre(rangee, i+1))); -- ou i-1
                    g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,i+1)));
                    maj := True;
					  
                end if;
            end if;
        end loop;
    end RegleBLigne;

    procedure RegleBColonne(G : in out Type_Grille; Col : in Integer; maj : in out Boolean) is
        rangee:Type_Rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireColonne(G, Col);
        for i in 2..Taille(G)-1 loop
            coord := ConstruireCoordonnees(i, Col);
            if estCaseVide(G, coord) then
                if chiffreDeDroite(rangee, i) = chiffreDeGauche(rangee, i) and chiffreDeGauche(rangee, i) /= INCONNU then
                    rangee := AjouterChiffre(rangee, i, Complement(ObtenirChiffre(rangee, i+1))); -- ou i-1
                    g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,i+1)));
                    maj := True;
                end if;
            end if;
        end loop;
    end RegleBColonne;

    -- cette fonction rempli les cases vides d'un Ligne d'une Grille par V de type_chiffre (1 ou 0)
    procedure RegleCCompleterLigne(G : in out Type_Grille; L : in Integer; V : in Type_Chiffre) is
        C : Type_Coordonnee; -- coordonee C
    begin
        for x in 1..Taille(G) loop -- tque il reste une case 
            C := ConstruireCoordonnees(L, x); -- maj de C
            if estCaseVide(G, C) then -- si la case courante est vide alors on lui donne la valeur V
                g := FixerChiffre(G, C, V);
            end if;
        end loop;
    end RegleCCompleterLigne;

    -- cette fonction rempli les cases vides d'une Colone d'une Grille par V de type_chiffre (1 ou 0)
    procedure RegleCCompleterColonne(G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre) is
        C : Type_Coordonnee; -- coordonee C
    begin
        for x in 1..Taille(G) loop
            C := ConstruireCoordonnees(x, Col); -- maj de C
            if estCaseVide(G, C) then -- si la case courante est vide alors on lui donne la valeur V
                g := FixerChiffre(G, C, V);
            end if;
        end loop;
    end RegleCCompleterColonne;
    
    function RegleDLigne (G : in Type_Grille) return Boolean is
    begin
        for x in 1..Taille(G) loop
            for y in x..Taille(G) loop
                if x /= y then
                    if extraireLigne(G, x) = extraireLigne(G, y) then
                        return False;
                    end if;
                end if;
            end loop;
        end loop;
        return True;
   end RegleDLigne;
   
    function RegleDColonne (G : in Type_Grille) return Boolean is
    begin
        for x in 1..Taille(G) loop
            for y in x..Taille(G) loop
                if x /= y then
                    if extraireColonne(G, x) = extraireColonne(G, y) then
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

   function Depiler_V2 (Pile : in Type_Pile) return Type_Pile is
      p1        : Type_Pile;
      different : Boolean;
      a         : Type_Coord_Chiffre;
   begin
      --levee d'exceptions
      if estVide (Pile) then
         raise PILE_VIDE;
      end if;
      --corps du sous-programme
      p1        := Pile;
      different := True;
      while dernier (p1).chiffre = UN and not estVide (p1) loop
         p1 := depiler (p1);
      end loop;
      -- complement du dernier
      if not estVide (p1) then
         a         := dernier (p1);
         a.chiffre := UN;
         p1        := empiler (depiler (p1), a);
      end if;
      return p1;
   end Depiler_V2;

   procedure ResoudreTakuzu (G : in out Type_Grille; trouve : out Boolean) is
        n:Integer;
        rangee_courante:Type_Rangee;
        maj:Boolean;
    begin
        trouve := false;
        n := Taille(G);
        maj := True;
        while not EstRemplie(G) and maj loop
		  maj := false;
            for x in 1..n loop
				rangee_courante := extraireLigne(G, x);
				if nombreChiffresConnus(rangee_courante) /= n then
					RegleADoublonLigne(G, x, maj);
					RegleBLigne(G, x, maj);
				
					if nombreChiffresDeValeur(rangee_courante, UN) = n / 2 then
						RegleCCompleterLigne(G, x, ZERO);
						Maj := True;
					elsif nombreChiffresDeValeur(rangee_courante, ZERO) = n / 2 then
				
						RegleCCompleterLigne(G, x, UN);
						Maj := True;
					end if;
				end if;
            end loop;
            
            for x in 1..n loop
				  rangee_courante := extraireColonne(G, x);
				  if nombreChiffresConnus(rangee_courante) /= n then
					RegleADoublonColonne(G, x, maj);
					RegleBColonne(G, x, maj);
                
					if nombreChiffresDeValeur(rangee_courante, UN) = n / 2 then
						RegleCCompleterColonne(G, x, ZERO);
						Maj := True;
					elsif nombreChiffresDeValeur(rangee_courante, ZERO) = n / 2 then
					 
						RegleCCompleterColonne(G, x, UN);
						Maj := True;
					end if;
				  end if;
            end loop;		
        end loop; 
        if EstRemplie(G) then
            trouve := true;
        end if;
        -- regle D 
        if not RegleDColonne(G) or not RegleDLigne(G) then
            trouve := false;
        end if;
        AfficherGrille(G);
    end ResoudreTakuzu;


end Resolution_Takuzu;
