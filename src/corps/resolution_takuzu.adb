with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with ada.Text_IO; use ada.Text_IO;
with Grille; use Grille;
with Rangee; use Rangee;
with Chiffre; use Chiffre;
with Coordonnee; use Coordonnee;
with Affichage; use Affichage;

package body Resolution_Takuzu is
    procedure RegleADoublonLigne(g: in out Type_Grille; L:  in Integer; maj : out Boolean) is
        rangee:Type_rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireLigne(g,L);
        for i in 1..Taille(g) loop
            coord := ConstruireCoordonnees(L, i);
            if estCaseVide(G, coord) then
                if i <= 2 then
                    if SontDeuxChiffresDeDroiteEgaux(rangee, i) and chiffreDeDroite(rangee, i) /= INCONNU then
                        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee, i+1)));
                        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(rangee, i+1)));
                        maj := True;
                    end if;
                elsif i > Taille(g)-2 then
                    if SontDeuxChiffresDeGaucheEgaux(rangee,i) and chiffreDeGauche(rangee, i) /= INCONNU then
                        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
                        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
                        maj := True;
                    end if;
                else
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
            end if;
        end loop;
    end RegleADoublonLigne;

    procedure RegleADoublonColonne(g: in out Type_Grille; Col:  in Integer; maj : out Boolean) is
        rangee:Type_rangee;
        coord:Type_Coordonnee;
    begin
        rangee := extraireColonne(g,Col);
        for i in 1..Taille(g) loop
            coord := ConstruireCoordonnees(i,Col);
            if estCaseVide(G,coord) then
                if i <= 2 then
                    if SontDeuxChiffresDeDroiteEgaux(rangee,i) and chiffreDeDroite(rangee, i) /= INCONNU then
                        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i+1)));
                        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I+1)));
                        maj := True;
                    end if;
                elsif i > Taille(g)-2 then
                    if SontDeuxChiffresDeGaucheEgaux(rangee,i) and chiffreDeGauche(rangee, i) /= INCONNU then
                        rangee := AjouterChiffre(rangee,i,Complement(ObtenirChiffre(rangee,i-1)));
                        g := FixerChiffre(G,Coord,Complement(ObtenirChiffre(Rangee,I-1)));
                        maj := True;
                    end if;
                else
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
            end if;
        end loop;
    end RegleADoublonColonne;
   
    procedure RegleBLigne(G : in out Type_Grille; L : in Integer; maj : out Boolean) is
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

    procedure RegleBColonne(G : in out Type_Grille; Col : in Integer; maj : out Boolean) is
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
   
    procedure ResoudreTakuzu (G : in out Type_Grille; trouve : out Boolean) is
        n:Integer;
        rangee2:Type_Rangee;
        maj:Boolean;
    begin
        trouve := false;
        n := Taille(G);
        maj := True;
        while not EstRemplie(G) loop -- ajouter le and maj (marche pas le systeme actuellement)
            for x in 1..n loop
				RegleADoublonLigne(G, x, maj);
				RegleBLigne(G, x, maj);
				rangee2 := extraireLigne(G, x);
				
				if nombreChiffresDeValeur(rangee2, UN) = n / 2 then
					RegleCCompleterLigne(G, x, ZERO);
					Maj := True;
				elsif nombreChiffresDeValeur(rangee2, ZERO) = n / 2 then
					RegleCCompleterLigne(G, x, UN);
					Maj := True;
				end if;
            end loop;
            
            for x in 1..n loop
                RegleADoublonColonne(G, x, maj);
                RegleBColonne(G, x, maj);
                rangee2 := extraireColonne(G, x);
                
                if nombreChiffresDeValeur(rangee2, UN) = n / 2 then
                    RegleCCompleterColonne(G, x, ZERO);
                    Maj := True;
                elsif nombreChiffresDeValeur(rangee2, ZERO) = n / 2 then
                    RegleCCompleterColonne(G, x, UN);
                    Maj := True;
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
