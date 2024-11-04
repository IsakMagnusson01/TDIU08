-- isama219: Arbetat enskilt
with Ada.Text_IO;	    use Ada.Text_IO;
with Ada.Float_Text_IO;	    use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure In_Och_Utmatning is

	  I : Integer;
	  F : Float;
	  C : Character;
	  S : String(1..5);

begin

-- Heltal

	  Put("Skriv in ett heltal: ");
	  Get(I);
	  Skip_Line;
	  
	  Put("Du skrev in talet: ");
	  Put(I, Width => 0);
	  New_Line(2);

-- 5 Heltal

	  Put("Skriv in fem heltal: ");
	  Get(I);
	  
	  Put("Du skrev in talen: ");
	  Put(I, Width => 1);
	  Put(" ");
	  
	  Get(I);
	  Put(I, Width => 1);
	  Put(" ");
	  
	  Get(I);
	  Put(I, Width => 1);
	  Put(" ");
	  
	  Get(I);
	  Put(I, Width => 1);
	  Put(" ");
	  
	  Get(I);
	  Skip_Line;
	  Put(I, Width => 1);
	  New_Line(2);
	  
-- Flyttal

	  Put("Skriv in ett flyttal: ");
	  Get(F);
	  Skip_Line;
	  
	  Put("Du skrev in flyttalet: ");
	  Put(F, Fore => 1, Aft => 3, Exp => 0);
	  New_Line(2);

-- Heltal och flyttal

	  Put("Skriv in ett heltal och ett flyttal: ");
	  Get(I);
	  Get(F);
	  Skip_Line;
	  
	  Put("Du skrev in heltalet: ");
	  Put(I, Width => 9);
	  New_Line;
	  
	  Put("Du skrev in flyttalet:");
	  Put(F, Fore => 4, Aft => 4, Exp => 0);
	  New_Line(2);
	  
-- Tecken

	  Put("Skriv in ett tecken: ");
	  Get(C);
	  Skip_Line;
	  
	  Put("Du skrev in tecknet: ");
	  Put(C);
	  New_Line(2);
	  
-- Sträng med 5 tecken

	  Put("Skriv in en sträng med 5 tecken: ");
	  Get(S(1..5));
	  Skip_Line;
	  
	  Put("Du skrev in strängen: ");
	  Put(S(1..5));
	  New_Line(2);

-- Sträng med 3 tecken

	  Put("Skriv in en sträng med 3 tecken: ");
	  Get(S(1..3));
	  Skip_Line;
	  
	  Put("Du skrev in strängen: ");
	  Put(S(1..3));
	  New_Line(2);
	  
-- Heltal och sträng med 5 tecken

	  Put("Skriv in ett heltal och en sträng med 5 tecken: ");
	  Get(I);
	  Get(C);
	  Get(S(1..5));
	  Skip_Line;
	  
	  Put("Du skrev in talet |");
	  Put(I, Width => 1);
	  Put("| och strängen |");
	  Put(S(1..5));
	  Put("|.");
	  New_Line(2);
	  
-- Sträng med 3 tecken och ett flyttal

	  Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
	  Get(S(1..3));
	  Get(F);
	  Skip_Line;
	  
	  Put("Du skrev in """);
	  Put(F, Fore => 2, Aft => 3, Exp => 0);
	  Put(""" och """);
	  Put(S(1..3));
	  Put(""".");
	  New_Line(2);

-- Sträng max 5 tecken

	  Put("Skriv in en sträng som är maximalt 5 tecken: ");
	  Get_Line(S,I);
	  if I = 5 then
	     Skip_Line;
	  end if;
	  
	  Put("Du skrev in strängen: ");
	  Put_Line(S(1..I));
	  New_Line;

-- Sträng max 5 tecken

	  Put("Skriv in en sträng som är maximalt 5 tecken: ");
	  Get_Line(S,I);
	  if I = 5 then
	     Skip_Line;
	  end if;
	  Put("Du skrev in strängen: ");
	  Put_Line(S(1..I));
	  
end In_Och_Utmatning;
