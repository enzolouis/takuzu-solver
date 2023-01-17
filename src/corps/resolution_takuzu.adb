with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with ada.Text_IO; use ada.Text_IO;
with Grille; use Grille;
with Rangee; use Rangee;
with Chiffre; use Chiffre;
with Coordonnee; use Coordonnee;
with Affichage; use Affichage;

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
               -- else
                    if SontDeuxChiffresDeDroiteEgaux(rangee,i) and chiffreDeDroite(rangee, i) /= INCONNU then
                        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i+1)));
                        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I+1)));
                        maj := True;            
                    elsif SontDeuxChiffresDeGaucheEgaux(rangee, i) and chiffreDeGauche(rangee, i) /= INCONNU then
                        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
                        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
                        maj := True;
                    end if;
                end if;
            --end if;
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
                end if;
            --end if;
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
		  rangee:Type_Rangee;
    begin
		rangee := extraireLigne(G, L);
        for x in 1..Taille(G) loop -- tque il reste une case 
            C := ConstruireCoordonnees(L, x); -- maj de C
            if estCaseVide(G, C) then -- si la case courante est vide alors on lui donne la valeur V
                g := FixerChiffre(G, C, V);
				  rangee := AjouterChiffre(rangee, x, V);
            end if;
        end loop;
    end RegleCCompleterLigne;

    -- cette fonction rempli les cases vides d'une Colone d'une Grille par V de type_chiffre (1 ou 0)
    procedure RegleCCompleterColonne(G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre) is
        C : Type_Coordonnee; -- coordonee C
		  rangee:Type_Rangee;
    begin
	 rangee := extraireColonne(G, Col);
        for x in 1..Taille(G) loop
            C := ConstruireCoordonnees(x, Col); -- maj de C
            if estCaseVide(G, C) then -- si la case courante est vide alors on lui donne la valeur V
                g := FixerChiffre(G, C, V);
					 rangee := AjouterChiffre(rangee, x, V);
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
   
    
	 
	 function is_valid_ligne(g: in Type_Grille; L: Integer; n : in Integer) return Boolean is
	     rangee:Type_rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireLigne(g,L);
        for i in 1..Taille(g) loop
            coord := ConstruireCoordonnees(L, i);				  
                if SontDeuxChiffresDeDroiteEgaux(rangee,i) and ObtenirChiffre(rangee, i) = chiffreDeDroite(rangee, i) and not EstInconnue(ObtenirChiffre(rangee, i)) then
                    return false;
                elsif SontDeuxChiffresDeGaucheEgaux(rangee,i) and ObtenirChiffre(rangee, i) = chiffreDeGauche(rangee, i) and not EstInconnue(ObtenirChiffre(rangee, i)) then
                    return false;
                end if;
            
			 
			 if nombreChiffresDeValeur(rangee, UN) > n / 2 or nombreChiffresDeValeur(rangee, ZERO) > n / 2 then
				return false;
			 end if;
        end loop;
		  
		  return true;
    end is_valid_ligne;
	 
	 function is_valid_colonne(g: in Type_Grille; Col: Integer; n : in Integer) return Boolean is
	     rangee:Type_rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireColonne(g,Col);
        for i in 1..Taille(g) loop
            coord := ConstruireCoordonnees(i, Col);
                if SontDeuxChiffresDeDroiteEgaux(rangee,i) and ObtenirChiffre(rangee, i) = chiffreDeDroite(rangee, i) and not EstInconnue(ObtenirChiffre(rangee, i)) then
                    return false;
                elsif SontDeuxChiffresDeGaucheEgaux(rangee,i) and ObtenirChiffre(rangee, i) = chiffreDeGauche(rangee, i) and not EstInconnue(ObtenirChiffre(rangee, i)) then
                    return false;
                end if;
			 
			 if nombreChiffresDeValeur(rangee, UN) > n / 2 or nombreChiffresDeValeur(rangee, ZERO) > n / 2 then
				return false;
			 end if;
        end loop;
		  
		  return true;
    end is_valid_colonne;
	 
	 function Is_Valid(G:in Type_Grille) return Boolean is
          N:Integer:=Taille(G);
    begin
          for X in 1..N loop
                if not Is_Valid_Ligne(G,X,N) then
                    Put("NON VALIDE");
                    return False;
				  end if;
         end loop;
            for Y in 1..N loop
                if not Is_Valid_Colonne(G,Y,N) then
                    Put("Non valide colonne");
                    return False;
				   end if;
        end loop;
        return True;
    end Is_Valid;
	 
	
	 
	 
	 procedure ResoudreTakuzu (G : in out Type_Grille, trouve : out Boolean; P : in out Type_Pile) return Boolean is
          Coo:Type_Coordonnee;
			 
    begin

		while not EstRemplie(G) and Is_Valid(G) loop
			if estCaseVide(G, C) then
			empile();
			G := FixerChiffre(G, C, ZERO)
		end loop;
		
		if not EstRemplie(G) then
			depiler();
			ResoudreTakuzu(G);
		end if;
        
	end ResoudreTakuzu;

end Resolution_Takuzu;
