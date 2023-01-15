package body A_Tester_Chiffre is

   -----------------------
   -- tests Chiffre --
   -----------------------

   -- test INCONNU
   function Test_Chiffre_P1 return Boolean is
   begin
      return (ValeurChiffre (INCONNU) = -1);
   end Test_Chiffre_P1;

   -- test ZERO
   function Test_Chiffre_P2 return Boolean is
   begin
      return (ValeurChiffre (ZERO) = 0);
   end Test_Chiffre_P2;

   -- test UN
   function Test_Chiffre_P3 return Boolean is
   begin
      return (ValeurChiffre (UN) = 1);
   end Test_Chiffre_P3;

   -- test est_INCONNU
   function Test_Chiffre_P4 return Boolean is
   begin
      return EstInconnue (INCONNU);
   end Test_Chiffre_P4;

   -- test est_INCONNU
   function Test_Chiffre_P5 return Boolean is
   begin
      return not EstInconnue (ZERO);
   end Test_Chiffre_P5;

   -- test est_INCONNU
   function Test_Chiffre_P6 return Boolean is
   begin
      return not EstInconnue (UN);
   end Test_Chiffre_P6;

   -- test Complement
   function Test_Chiffre_P7 return Boolean is
   begin
      return Complement (ZERO) = UN;
   end Test_Chiffre_P7;

   -- test Complement
   function Test_Chiffre_P8 return Boolean is
   begin
      return Complement (UN) = ZERO;
   end Test_Chiffre_P8;

   -- Exception : test Complement
   function Test_Chiffre_Complement_Exception return Boolean is
      N : Integer;
   begin
      N := ValeurChiffre (Complement (INCONNU));
      return False;
   exception
      when VALEUR_INCONNUE =>
         return True;
      when others =>
         return False;
   end Test_Chiffre_Complement_Exception;

   -- Test égalité
   function Test_Chiffre_P9a return Boolean is
   begin
      return ZERO = ZERO;
   end Test_Chiffre_P9a;

   function Test_Chiffre_P9b return Boolean is
   begin
      return UN = UN;
   end Test_Chiffre_P9b;

   function Test_Chiffre_P9c return Boolean is
   begin
      return INCONNU = INCONNU;
   end Test_Chiffre_P9c;

   function Test_Chiffre_P9d return Boolean is
   begin
      return not (ZERO = UN);
   end Test_Chiffre_P9d;

   function Test_Chiffre_P9e return Boolean is
   begin
      return not (ZERO = INCONNU);
   end Test_Chiffre_P9e;

   function Test_Chiffre_P9f return Boolean is
   begin
      return not (UN = ZERO);
   end Test_Chiffre_P9f;

   function Test_Chiffre_P9g return Boolean is
   begin
      return not (UN = INCONNU);
   end Test_Chiffre_P9g;

   function Test_Chiffre_P9h return Boolean is
   begin
      return not (INCONNU = ZERO);
   end Test_Chiffre_P9h;

   function Test_Chiffre_P9i return Boolean is
   begin
      return not (INCONNU = UN);
   end Test_Chiffre_P9i;

end A_Tester_Chiffre;
