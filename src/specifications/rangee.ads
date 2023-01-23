with Chiffre; use Chiffre;

package Rangee is

   type Type_Rangee is private;

   TRANCHE_INVALIDE       : exception;
   TAILLE_INVALIDE        : exception;

   -- retourne une rangee vide de t elements
   -- necessite 0 < t <= 100
   -- leve l'exception TAILLE_INVALIDE si t < 4 ou 100 < t
   function ConstruireRangee (T : in Integer) return Type_Rangee;

   -- retourne VRAI si la rangee r est vide ; FAUX sinon
   function EstVide (R : in Type_Rangee) return Boolean;

   -- retourne VRAI si aucune case de la rangee n'est vide ; FAUX sinon
   function EstRemplie (R : in Type_Rangee) return Boolean;

   -- retourne la taille de la rangee r
   function Taille (R : in Type_Rangee) return Integer;

   -- retourne le chiffre place aƒ l'indice i de la rangee r
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou taille(r) < i
   function ObtenirChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Chiffre;

   -- retourne le nombre de chiffres non nuls de la rangee r
   function nombreChiffresConnus (R : in Type_Rangee) return Integer;

   -- retourne le nombre de chiffres de valeur v de la rangee r
   function nombreChiffresDeValeur
     (R : in Type_Rangee; V : in Type_Chiffre) return Integer;

   -- retourne le chiffre de droite de coordonnee c de la Rangee r
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i >= taille(r)
   function chiffreDeDroite
     (R : in Type_Rangee; I : in Integer) return Type_Chiffre;

   -- retourne le chiffre de gauche de coordonnee c de la Rangee r
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function chiffreDeGauche
     (R : in Type_Rangee; I : in Integer) return Type_Chiffre;

   -- retourne VRAI si les chiffre de droite de coordonnee c
   -- de la Rangee r sont egaux et FAUX sinon
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
  function SontDeuxChiffresDeDroiteEgaux (R : in Type_Rangee; I : in Integer) return Boolean;

   -- retourne VRAI si les chiffre de gauche de coordonnee c
   -- de la Rangee r sont egaux et FAUX sinon
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function SontDeuxChiffresDeGaucheEgaux (R : in Type_Rangee; I : in Integer) return Boolean;

   -- remplit la case i de la rangee r avec le chiffre c
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function AjouterChiffre (R : in Type_Rangee; I : in Integer; C : in Type_Chiffre) return Type_Rangee;

   -- positionne la case i de la rangee r avec le chiffre INCONNU
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
  function RetirerChiffre (R : in Type_Rangee; I : in Integer) return Type_Rangee;

   -- retourne VRAI si la rangee R1 est egale a la rangee R2
   function "=" (R1 : in Type_Rangee; R2 : in Type_Rangee) return Boolean;

private
   TAILLE_MAX_GRILLE : constant Integer := 100;
   type Type_Tableau_Rangee is array (1 .. TAILLE_MAX_GRILLE) of Type_Chiffre;
   type Type_Rangee is record
      R      : Type_Tableau_Rangee;
      Taille : Integer;
   end record;

end Rangee;
