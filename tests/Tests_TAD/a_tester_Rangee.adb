-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with Chiffre; use Chiffre;

package body A_Tester_Rangee is

   TAILLE_GRILLE_TEST : constant Integer := 8;

   -- creation Rangee
   -- verification est vide
   function Test_Rangee_P1 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return EstVide (R);
   end Test_Rangee_P1;
   
   -- creation Rangee
   -- verification n'est pas remplie
   function Test_Rangee_P2 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return not estRemplie(R);
   end Test_Rangee_P2;
   
   -- creation Rangee
   -- verification taille 
   function Test_Rangee_P3 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return taille(R) = TAILLE_GRILLE_TEST;
   end Test_Rangee_P3;
   
   -- creation Rangee
   -- verification tous les chiffres sont inconnus 
   function Test_Rangee_P4 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
	  for i in 1..TAILLE_GRILLE_TEST loop
		if obtenirChiffre(R,i) /= INCONNU then
			return FALSE;
		end if;
	  end loop;
      return true;
   end Test_Rangee_P4;

   -- creation Rangee
   -- verification nombre de chiffres connus = 0
   function Test_Rangee_P5 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return nombreChiffresConnus (R) = 0;
   end Test_Rangee_P5;
   
   -- creation Rangee
   -- verification nombre de chiffres inconnus = t
   function Test_Rangee_P6 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return nombreChiffresDeValeur (R, INCONNU) = TAILLE_GRILLE_TEST;
   end Test_Rangee_P6;

   -- creation Rangee
    -- verification nombre de chiffres UN = 0
   function Test_Rangee_P7 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return nombreChiffresDeValeur (R, UN) = 0;
   end Test_Rangee_P7;

   -- creation Rangee
   -- verification nombre de chiffres ZERO = 0
   function Test_Rangee_P8 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return nombreChiffresDeValeur (R, ZERO) = 0;
   end Test_Rangee_P8;

   -- creation Rangee
   -- verification nombre de chiffres de droite = INCONNU
   function Test_Rangee_P9 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
	  for i in 1..TAILLE_GRILLE_TEST loop
		if chiffreDeDroite(R,i) /= INCONNU then
			return FALSE;
		end if;
	  end loop;
      return true;
   end Test_Rangee_P9;

   -- creation Rangee
   -- verification nombre de chiffres de gauche = INCONNU
   function Test_Rangee_P10 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
	  for i in 1..TAILLE_GRILLE_TEST loop
		if chiffreDeGauche(R,i) /= INCONNU then
			return FALSE;
		end if;
	  end loop;
      return true;
   end Test_Rangee_P10;
   
   -- creation Rangee
   -- verification deux chiffres de droite différents
   function Test_Rangee_P11 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
	  for i in 1..TAILLE_GRILLE_TEST loop
		if SontDeuxChiffresDeDroiteEgaux(R,i) then
			return FALSE;
		end if;
	  end loop;
      return true;
   end Test_Rangee_P11;
   
   -- creation Rangee
   -- verification deux chiffres de gauche différents
   function Test_Rangee_P12 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
	  for i in 1..TAILLE_GRILLE_TEST loop
		if SontDeuxChiffresDeGaucheEgaux(R,i) then
			return FALSE;
		end if;
	  end loop;
      return true;
   end Test_Rangee_P12;
   
   -- creation Rangee
   -- retirer un chiffre ne change rien
   function Test_Rangee_P13 return Boolean is
      R1 : Type_Rangee;
	  R2 : Type_Rangee;
   begin
      R1 := ConstruireRangee (TAILLE_GRILLE_TEST);
      R2 := ConstruireRangee (TAILLE_GRILLE_TEST);
	  for i in 1..TAILLE_GRILLE_TEST loop
		R2 := retirerChiffre(R2,i); 
	  end loop;
      return R1 = R2;
   end Test_Rangee_P13;
   
   --------------------------------
   -- Test sur Rangee non vide --
   --------------------------------

   -- verification non vide si ajout de UN
   function Test_Rangee_P14 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      return not EstVide (R);
   end Test_Rangee_P14;

   -- verification non vide si ajout de ZERO
   function Test_Rangee_P15 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, ZERO);
      return not EstVide (R);
   end Test_Rangee_P15;

   -- verification vide si ajoute de INCONNU
   function Test_Rangee_P16 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, INCONNU);
      return EstVide (R);
   end Test_Rangee_P16;

   -- verification rangée non remplie
   -- si pas ajout de TAILLE_GRILLE_TEST chiffres
   function Test_Rangee_P17a return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, ZERO);
      return not EstRemplie (R);
   end Test_Rangee_P17a;

   -- verification rangée  remplie
   -- si ajout de TAILLE_GRILLE_TEST chiffres
  function Test_Rangee_P17b return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 1, ZERO);
      R := AjouterChiffre (R, 2, ZERO);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 4, UN);
      R := AjouterChiffre (R, 5, ZERO);
      R := AjouterChiffre (R, 6, ZERO);
      R := AjouterChiffre (R, 7, UN);
      R := AjouterChiffre (R, 8, UN);
      return EstRemplie (R);
   end Test_Rangee_P17b;
   
   -- verification de la taille
   function Test_Rangee_P18 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
       R := AjouterChiffre (R, Taille (R), ZERO);
      return
        taille(R) = TAILLE_GRILLE_TEST;
   end Test_Rangee_P18;

   -- verification obtenirChiffre
   function Test_Rangee_P19 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, Taille (R), ZERO);
      return
        ObtenirChiffre (R, 3) = UN and ObtenirChiffre (R, 1) = INCONNU and
        ObtenirChiffre (R, Taille (R)) = ZERO;
   end Test_Rangee_P19;

   -- verification obtenir nombre de chiffres 
   -- change si on met des ZERO ou de UN 
   -- mais pas de INCONNU
   function Test_Rangee_P20 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, Taille (R), ZERO);
	  R := AjouterChiffre (R, 1, INCONNU);
      return nombreChiffresConnus (R) = 2;
   end Test_Rangee_P20;

   -- obtenir le nombre de chiffres d'une valeur change
   -- change si on met des ZERO, des UN ou des INCONNU
  function Test_Rangee_P21 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 4, UN);
      R := AjouterChiffre (R, 1, UN);
	  R := AjouterChiffre (R, 1, INCONNU);
      R := AjouterChiffre (R, Taille (R), ZERO);
      return
        nombreChiffresDeValeur (R, UN) = 2 and
        nombreChiffresDeValeur (R, ZERO) = 1 and
        nombreChiffresDeValeur (R, INCONNU) = 5;
   end Test_Rangee_P21;
   
   -- obtenir le chiffre de droite
   -- si l'indice = TAILLE_GRILLE_TEST
  function Test_Rangee_P22a return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, Taille (R), ZERO);
      return
        chiffreDeDroite (R, TAILLE(R)) = INCONNU;
   end Test_Rangee_P22a;
   
   -- obtenir le chiffre de droite
   -- si l'indice < TAILLE_GRILLE_TEST
  function Test_Rangee_P22b return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 4, ZERO);
      return
        chiffreDeDroite (R, 3) = ZERO;
   end Test_Rangee_P22b;  
   
   -- obtenir le chiffre de gauche
   -- si l'indice = TAILLE_GRILLE_TEST
  function Test_Rangee_P23a return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 1, ZERO);
      return
        chiffreDeGauche (R, 1) = INCONNU;
   end Test_Rangee_P23a;
   
   -- obtenir le chiffre de gauche
   -- si l'indice < TAILLE_GRILLE_TEST
  function Test_Rangee_P23b return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 2, ZERO);
      return
        chiffreDeGauche (R, 3) = ZERO;
   end Test_Rangee_P23b;  
   
   -- verification deux chiffres de droite égaux
   function Test_Rangee_P24 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 1, ZERO);
      R := AjouterChiffre (R, 2, ZERO);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 4, UN);
      R := AjouterChiffre (R, 5, ZERO);
      R := AjouterChiffre (R, 6, ZERO);
      R := AjouterChiffre (R, 7, UN);
      R := AjouterChiffre (R, 8, UN);
      return SontDeuxChiffresDeDroiteEgaux(R,2) and
			 sontDeuxChiffresDeDroiteEgaux(R,4) and
			 sontDeuxChiffresDeDroiteEgaux(R,6) and
			 not sontDeuxChiffresDeDroiteEgaux(R,1) and
			 not sontDeuxChiffresDeDroiteEgaux(R,3) and
			 not sontDeuxChiffresDeDroiteEgaux(R,5) and
			 not sontDeuxChiffresDeDroiteEgaux(R,7);
   end Test_Rangee_P24;
   
   -- verification deux chiffres de gauche égaux
   function Test_Rangee_P25 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 1, ZERO);
      R := AjouterChiffre (R, 2, ZERO);
      R := AjouterChiffre (R, 3, UN);
      R := AjouterChiffre (R, 4, UN);
      R := AjouterChiffre (R, 5, ZERO);
      R := AjouterChiffre (R, 6, ZERO);
      R := AjouterChiffre (R, 7, UN);
      R := AjouterChiffre (R, 8, UN);
      return SontDeuxChiffresDeGaucheEgaux(R,3) and
			 sontDeuxChiffresDeGaucheEgaux(R,5) and
			 sontDeuxChiffresDeGaucheEgaux(R,7) and
			 not sontDeuxChiffresDeGaucheEgaux(R,2) and
			 not sontDeuxChiffresDeGaucheEgaux(R,4) and
			 not sontDeuxChiffresDeGaucheEgaux(R,6) and
			 not sontDeuxChiffresDeGaucheEgaux(R,8);
   end Test_Rangee_P25;
   
   -- verification retirer chiffre
   function Test_Rangee_P26 return Boolean is
      R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := AjouterChiffre (R, 1, ZERO);
      R := AjouterChiffre (R, 7, UN);
  	  R := retirerChiffre (R,1);
	  R := retirerChiffre (R,7);
      return 	obtenirChiffre(R,1) = INCONNU and 
				obtenirChiffre(R,7) = INCONNU ;
   end Test_Rangee_P26;
   
   -------------------------
   -- Test des exceptions --
   -------------------------
   
   -- Exception 1a : obtenirChiffre (r,i) est defini i>0
   function Test_Rangee_Exception_1a return Boolean is
      R : Type_Rangee;
      C : Type_Chiffre;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      C := obtenirChiffre(R, 0);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_1a;
   
   -- Exception 1b : obtenirChiffre (r,i) est defini i<TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_1b return Boolean is
      R : Type_Rangee;
      C : Type_Chiffre;     
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      C := obtenirChiffre(R, TAILLE_GRILLE_TEST + 1);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_1b;
   
   -- Exception 2a : chiffreDeDroite est defini i>0
   function Test_Rangee_Exception_2a return Boolean is
     R : Type_Rangee;
      C : Type_Chiffre;     
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      C := chiffreDeDroite(R, 0);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_2a;
   
   -- Exception 2b : chiffreDeDroite est defini i<= TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_2b return Boolean is
     R : Type_Rangee;
      C : Type_Chiffre;     
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      C := chiffreDeDroite(R, TAILLE_GRILLE_TEST+1);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_2b;
   
   -- Exception 3a : chiffreDeGauche est defini i>0
   function Test_Rangee_Exception_3a return Boolean is
     R : Type_Rangee;
      C : Type_Chiffre;     
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      C := chiffreDeGauche(R, 0);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_3a;
   
   -- Exception 3b : chiffreDeGauche est defini i<= TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_3b return Boolean is
     R : Type_Rangee;
      C : Type_Chiffre;     
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      C := chiffreDeGauche(R, TAILLE_GRILLE_TEST+1);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_3b;
   
   -- Exception 4a : sontDeuxChiffresDeDroiteEgaux est defini i>0
   function Test_Rangee_Exception_4a return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return sontDeuxChiffresDeDroiteEgaux(R, 0);
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_4a;
   
   -- Exception 4b : sontDeuxChiffresDeDroiteEgaux est defini i< TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_4b return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return sontDeuxChiffresDeDroiteEgaux(R, TAILLE_GRILLE_TEST + 1);
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_4b;
   
   -- Exception 5a : sontDeuxChiffresDeGaucheEgaux est defini i>1
   function Test_Rangee_Exception_5a return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return sontDeuxChiffresDeGaucheEgaux(R, 0);
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_5a;
   
   -- Exception 5b : sontDeuxChiffresDeGaucheEgaux est defini i<= TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_5b return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      return sontDeuxChiffresDeGaucheEgaux(R, TAILLE_GRILLE_TEST+1);
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_5b;
   
     -- Exception 6a : ajouterChiffre (r,i,c) est defini i>0
   function Test_Rangee_Exception_6a return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := ajouterChiffre(R, 0, UN);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_6a;
   
   -- Exception 6b : ajouterChiffre (r,i) est defini i<TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_6b return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := ajouterChiffre(R, TAILLE_GRILLE_TEST + 1, ZERO);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_6b;
   
   -- Exception 7a : retirerChiffre (r,i) est defini i>0
   function Test_Rangee_Exception_7a return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := retirerChiffre(R, 0);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_7a;
   
   -- Exception 7b : retirerChiffre (r,i) est defini i<TAILLE_GRILLE_TEST
   function Test_Rangee_Exception_7b return Boolean is
     R : Type_Rangee;
   begin
      R := ConstruireRangee (TAILLE_GRILLE_TEST);
      R := retirerChiffre(R, TAILLE_GRILLE_TEST + 1);
	  return FALSE ;
   exception
      when TRANCHE_INVALIDE =>
		return True;
	  when others =>
		return False;
   end Test_Rangee_Exception_7b;

begin
   null;
end A_Tester_Rangee;
