package body rangee is

	function ConstruireRangee (T : in Integer) return Type_Rangee is
      tt : Type_Rangee;
      c : integer := 1;
	begin
      tt.taille := T;
      while c <= T loop
         tt.R(c) := INCONNU;
         c := c + 1;
      end loop;
		return tt;
	end ConstruireRangee;

	function EstVide (R : in Type_Rangee) return Boolean is
		c : integer := 1;
	begin
      while c <= R.Taille loop
         if not EstInconnue(R.R(c)) then
            return false;
         end if;
         c := c + 1;
      end loop;
      return True;
	end EstVide;

	function EstRemplie (R : in Type_Rangee) return Boolean is
		c : integer := 1;
	begin
		while c <= R.taille loop
			if EstInconnue(R.R(c)) then
				return false;
			end if;
			c := c + 1;
		end loop;
		return true;
	end EstRemplie;

	function Taille (R : in Type_Rangee) return Integer is
	begin
		return R.taille;
	end Taille;

	function ObtenirChiffre (R : in Type_Rangee; I : in Integer) return Type_Chiffre is
   begin
      --if I < 1 or I > R.taille then
		--	raise TRANCHE_INVALIDE;
		--end if;
		return R.R(I);
	end ObtenirChiffre;

	function nombreChiffresConnus (R : in Type_Rangee) return Integer is
		c : integer := 1;
		res : integer := 0;
	begin
		while c <=  R.taille loop
			if not EstInconnue(R.R(c)) then
				res := res + 1;
			end if;
			c := c + 1;
		end loop;
		return res;
	end nombreChiffresConnus;

	function nombreChiffresDeValeur (R : in Type_Rangee; V : in Type_Chiffre) return Integer is
		c : integer := 1;
		res : integer := 0;
	begin
		while c <= R.taille loop
			if R.R(c) = V then
				res := res + 1;
			end if;
			c := c + 1;
		end loop;
		return res;
	end nombreChiffresDeValeur;

   function chiffreDeDroite (R : in Type_Rangee; I : in Integer) return Type_Chiffre is
	begin
		if I < 1 or I > R.taille then
			raise TRANCHE_INVALIDE;
      end if;
      if I = R.taille then
         return INCONNU;
      end if;
      return R.R(I+1);
	end chiffreDeDroite;

	function chiffreDeGauche (R : in Type_Rangee; I : in Integer) return Type_Chiffre is
	begin
		if I < 1 or I > R.taille then
			raise TRANCHE_INVALIDE;
      end if;
      if I = 1 then
         return INCONNU;
      end if;
		return R.R(I-1);
	end chiffreDeGauche;

	function SontDeuxChiffresDeDroiteEgaux (R: in Type_Rangee; I : in Integer) return Boolean is
	begin
		--if I < 1 or I > R.taille then
		--	raise TRANCHE_INVALIDE;
      --end if;
      if I = R.Taille or I = R.taille-1 then
         return false;
      end if;
		if R.R(I+1) = R.R(I+2) then
			return true;
		end if;
		return false;
	end SontDeuxChiffresDeDroiteEgaux;

	function SontDeuxChiffresDeGaucheEgaux (R : in Type_Rangee; I : in Integer) return Boolean is
	begin
		if I < 1 or I > R.taille then
			raise TRANCHE_INVALIDE;
      end if;
      if I = 1 or I = 2 then
         return false;
      end if;
		if R.R(I-1) = R.R(I-2) then
			return true;
		end if;
		return false;
	end SontDeuxChiffresDeGaucheEgaux;

	function AjouterChiffre (R : in Type_Rangee; I : in Integer; C : in Type_Chiffre) return Type_Rangee is
		RR : Type_Rangee;
	begin
		--if I < 1 or I > R.taille then
		--	raise TRANCHE_INVALIDE;
      --end if;
      RR := R;
		RR.R(I) := C;
		return RR;
	end AjouterChiffre;

	function RetirerChiffre (R : in Type_Rangee; I : in Integer) return Type_Rangee is
		RR : Type_Rangee;
	begin
		RR := R;
		--if I < 1 or I > R.taille then
		--	raise TRANCHE_INVALIDE;
		--end if;
		RR.R(I) := INCONNU;
		return RR;
   end RetirerChiffre;

	function "=" (R1 : in Type_Rangee; R2 : in Type_Rangee) return Boolean is
      i : Integer := 1;
   begin
      if R1.Taille = R2.Taille then
         while i <= R1.Taille loop
            if R1.R(i) /= R2.R(i) then
               return False;
            end if;
            i := i + 1;
         end loop;
      else
         return False;
      end if;
      return True;
   end "=";

end rangee;
