with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Types_Tests is

   type Pt_Fonction is access function return Boolean;

   type Test_Unitaire is limited record
      Function_Of_Test : Pt_Fonction;
      Error_Test       : Unbounded_String;
   end record;

end Types_Tests;
