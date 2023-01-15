-- TAD
with Affichage;                     use Affichage;
-- Entrées_sorties
with Ada.Strings.Unbounded;         use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Text_IO;                   use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;

package body Remplir_Grille_Takuzu is

   function Lire_Grille (Nom : String) return Type_Grille is
      F     : File_Type;
      Sline : Unbounded_String;
      G     : Type_Grille;
      T     : Integer;
      C     : Character;
      I     : Integer;
      Co    : Type_Coordonnee;
   begin
      Open (F, In_File, "grilles/" & Nom);

      Get (F, T);
      Get_Line (F, Sline);

      G := ConstruireGrille (T);

      I := 1;
      while I <= T loop
         Get_Line (F, Sline);
         if Length (Sline) /= T then
            raise PROBLEME_TAILLE_GRILLE with Nom;
         end if;
         for J in 1 .. Length (Sline) loop
            C  := Element (Sline, J);
            Co := ConstruireCoordonnees (I, J);
            if C = '0' then
               G := FixerChiffre (G, Co, ZERO);
            elsif C = '1' then
                G := FixerChiffre (G, Co, UN);
            else
                G := FixerChiffre (G, Co, INCONNU);
            end if;
         end loop;
         I := I + 1;
      end loop;
      Close (F);
      return G;
   end Lire_Grille;

end Remplir_Grille_Takuzu;
