pragma Ada_2012;
package body Chiffre is

   -------------------
   -- ValeurChiffre --
   -------------------

   function ValeurChiffre (C : in Type_Chiffre) return Integer is

   begin

      return Integer(C);

   end ValeurChiffre;

   -----------------
   -- EstInconnue --
   -----------------

   function EstInconnue (C : in Type_Chiffre) return Boolean is

   begin

      return Integer(C) = -1;

   end EstInconnue;

   ----------------
   -- Complement --
   ----------------

   function Complement (C : in Type_Chiffre) return Type_Chiffre is

   begin

      if EstInconnue(C) then
         raise VALEUR_INCONNUE;
      end if;

      if Integer(C) = 0 then
         return UN;
      elsif Integer(C) = 1 then
         return ZERO;
      else
         return INCONNU;
      end if;

   end Complement;

   ---------
   -- "=" --
   ---------

   function "=" (c1 : in Type_Chiffre; c2 : in Type_Chiffre) return Boolean is

   begin

      return Integer(c1) = Integer(c2);

   end "=";

end Chiffre;
