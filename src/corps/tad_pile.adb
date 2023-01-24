package body TAD_Pile is

   --------------------
   -- construirePile --
   --------------------

   function construirePile return Type_Pile is
      p : Type_Pile;
   begin
      p.nb_elements := 0;
      return p;
   end construirePile;

   -------------
   -- estVide --
   -------------

   function estVide (pile : in Type_Pile) return Boolean is
   begin
      return pile.nb_elements = 0;
   end estVide;

   -------------
   -- dernier --
   -------------

   function dernier (pile : in Type_Pile) return T is
   begin
      --levee d'exceptions
      if estVide(pile) then
         raise PILE_VIDE;
      end if;
      --corps du sous-programme
      return pile.elements(pile.nb_elements);
   end dernier;

   -------------
   -- empiler --
   -------------

   function empiler (pile : in Type_Pile; e : in T) return Type_Pile is
      p1 : Type_Pile;
   begin
      --levee d'exceptions
      if pile.nb_elements = TAILLE_MAX then
         raise PILE_PLEINE;
      end if;
      --corps du sous-programme
      p1 := pile;
      p1.nb_elements := p1.nb_elements + 1;
      p1.elements(p1.nb_elements) := e;
      return p1;
   end empiler;


   -------------
   -- depiler --
   -------------

   function depiler (pile : in Type_Pile) return Type_Pile is
      p1 : Type_Pile;
   begin
      --levee d'exceptions
      if pile.nb_elements = 0 then
         raise PILE_VIDE;
      end if;
      --corps du sous-programme
      p1 := pile;
      p1.nb_elements := p1.nb_elements - 1;
      return p1;
   end depiler;

end TAD_Pile;
