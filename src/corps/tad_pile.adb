package body TAD_Pile is

   function construirePile return Type_Pile is
      p : Type_Pile;
   begin
      return p;
   end construirePile;

   -------------
   -- estVide --
   -------------

   function estVide (pile : in Type_Pile) return Boolean is
   begin
      pragma Compile_Time_Warning (Standard.True, "estVide unimplemented");
      return raise Program_Error with "Unimplemented function estVide";
   end estVide;

   -------------
   -- dernier --
   -------------

   function dernier (pile : in Type_Pile) return T is
   begin
      pragma Compile_Time_Warning (Standard.True, "dernier unimplemented");
      return raise Program_Error with "Unimplemented function dernier";
   end dernier;

   -------------
   -- empiler --
   -------------

   function empiler (pile : in Type_Pile; e : in T) return Type_Pile is
   begin
      pragma Compile_Time_Warning (Standard.True, "empiler unimplemented");
      return raise Program_Error with "Unimplemented function empiler";
   end empiler;

   -------------
   -- depiler --
   -------------

   function depiler (pile : in Type_Pile) return Type_Pile is
   begin
      pragma Compile_Time_Warning (Standard.True, "depiler unimplemented");
      return raise Program_Error with "Unimplemented function depiler";
   end depiler;

end TAD_Pile;
