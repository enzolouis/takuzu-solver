package Chiffre is

   type Type_Chiffre is private;

   VALEUR_INCONNUE : exception;

   -- crée le chiffre UN
   UN : constant Type_Chiffre;

   -- crée le chiffre ZERO
   ZERO : constant Type_Chiffre;

   -- crée le chiffre INCONNU
   INCONNU : constant Type_Chiffre;

   -- retourne la valeur du chiffre c
   function ValeurChiffre (C : in Type_Chiffre) return Integer;

   -- retourne VRAI si la valeur du chiffre c est inconnu
   function EstInconnue (C : in Type_Chiffre) return Boolean;

   -- retourne le complément du chiffre c
   -- necessite la valeur de c est connue
   -- leve l'exception VALEUR_INCONNUE si la valeur de c est inconnue
   function Complement (C : in Type_Chiffre) return Type_Chiffre;
   
   -- retourne VRAI si le chiffre c1 est égal au chiffre c2
   function "=" (c1 : in Type_Chiffre; c2: in Type_Chiffre) return Boolean;

private
   type Type_Chiffre is range -1 .. 1;
   UN      : constant Type_Chiffre := 1;
   ZERO    : constant Type_Chiffre := 0;
   INCONNU : constant Type_Chiffre := -1;
end Chiffre;
