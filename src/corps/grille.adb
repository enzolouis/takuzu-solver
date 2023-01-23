pragma Ada_2012;
package body Grille is

	----------------------
	-- ConstruireGrille --
	----------------------

	function ConstruireGrille (T : Integer) return Type_Grille is
		grille : Type_Grille;
	begin
		--levee des exceptions
		if T > TAILLE_MAX or T < 4 or T mod 2 /= 0 then
			raise TAILLE_GRILLE_INVALIDE;
		end if;
		--construction de la grille
		grille.Taille := T;
		for l in 1 .. T loop
			for c in 1 .. T loop
				grille.G(l,c) := INCONNU;
			end loop;
		end loop;
		return grille;
	end ConstruireGrille;

	------------
	-- Taille --
	------------

	function Taille (G : in Type_Grille) return Integer is
	begin
		return G.Taille;
	end Taille;

	 -----------------
	 -- estCaseVide --
	 -----------------

	function estCaseVide (G : in Type_Grille; C : in Type_Coordonnee) return Boolean is
	begin
		return G.G(ObtenirLigne(C),ObtenirColonne(C)) = INCONNU;
	end estCaseVide;

	--------------------
	-- ObtenirChiffre --
	--------------------

	function ObtenirChiffre (G : in Type_Grille; C : in Type_Coordonnee) return Type_Chiffre is
	begin
		--levee des exceptions
		if estCaseVide(G,C) then
			raise CASE_VIDE;
	      	end if;
		--obtentition du chiffre
	      	return G.G(ObtenirLigne(C),ObtenirColonne(C));
	end ObtenirChiffre;

	--------------------------
 	-- NombreChiffresConnus --
	--------------------------

	function NombreChiffresConnus (G : in Type_Grille) return Integer is
		comp : Integer;
	begin
		comp := 0;
	     	for l in 1 .. G.Taille loop
			for c in 1 .. G.Taille loop
		    		if not EstInconnue(G.G(l,c)) then
		       			comp := comp + 1;
		    		end if;
		 	end loop;
	      end loop;
	      return comp;
	end NombreChiffresConnus;

	----------------
	-- EstRemplie --
	----------------

	function EstRemplie (G : in Type_Grille) return Boolean is
	begin
		return NombreChiffresConnus(G) = G.Taille * G.Taille;
	end EstRemplie;

	-------------------
	-- extraireLigne --
	-------------------

	function extraireLigne (G : in Type_Grille; L : in Integer) return Type_Rangee is
		R : Type_Rangee;
	begin
		R := ConstruireRangee(Taille(G));
		for i in 1..G.Taille loop
			R := AjouterChiffre(R,i,G.G(L,i));
		end loop;
	     	return R;
	end extraireLigne;

	---------------------
	-- extraireColonne --
	---------------------

	function extraireColonne (G : in Type_Grille; C : in Integer) return Type_Rangee is
		R : Type_Rangee;
	begin
		R := ConstruireRangee(Taille(G));
		for i in 1..G.Taille loop
			R := AjouterChiffre(R,i,G.G(i,C));
		end loop;
		return R;
	end extraireColonne;

	------------------
	-- FixerChiffre --
	------------------

	function FixerChiffre (G : in Type_Grille; C : in Type_Coordonnee; V : in Type_Chiffre) return Type_Grille is
		G2 : Type_Grille;
	begin
		--levee d'exceptions
		if not estCaseVide(G,C) then
			raise FIXER_CHIFFRE_NON_NUL;
		end if;
		--corps du sous programme
		G2 := G;
		G2.G(ObtenirLigne(C),ObtenirColonne(C)) := V;
	      	return G2;
	   end FixerChiffre;

	---------------
	-- ViderCase --
	---------------

	function ViderCase (G : in Type_Grille; C : in Type_Coordonnee) return Type_Grille is
		G2 : Type_Grille;
	begin
		--levee d'exceptions
		if estCaseVide(G,C) then
			raise VIDER_CASE_VIDE;
		end if;
		--vider case
	      	G2 := G;
	      	G2.G(ObtenirLigne(C),ObtenirColonne(C)) := INCONNU;
	      	return G2;
	end ViderCase;

end Grille;
