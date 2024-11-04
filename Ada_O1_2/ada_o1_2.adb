-- isama219: Arbetat enskilt
with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;   	use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;		use Ada.Float_Text_IO;

procedure ada_o1_2 is

	  First, Last, Step, Percent : Float;
	  Base, Tax, Final : Float;
	  Step_Count : Integer;

begin

-- Första pris

	loop
		Put("Första pris: ");
		Get(First);
		if First < 0.0 then
		   Put("Felaktigt värde!");
		   New_Line;
		else
		   exit;
		end if;
	end loop;
	
-- Sista pris

	loop
		Put("Sista pris: ");
		Get(Last);
		if Last < First then
		   Put("Felaktigt värde!");
		   New_Line;
		else
		   exit;
		end if;
	end loop;

-- Steglängd

	loop
		Put("Steg: ");
		Get(Step);
		if Step <= 0.0 then
		   Put("Felaktigt värde!");
		   New_Line;
		else
		   exit;
		end if;
	end loop;

-- Momsprocent

	loop
		Put("Momsprocent: ");
		Get(Percent);
		if Percent < 0.0 or Percent > 100.0 then
		   Put("Felaktigt värde!");
		   New_Line;
		else
		   exit;
		end if;
	end loop;
	New_Line;

-- Utskriften

	Put("============ Momstabell ============");
	New_Line;
	Put("Pris utan moms  Moms   Pris med moms");
	
	Step_Count := Integer(Float'Floor(((Last - First)/Step)) + 1.0);
	
	New_Line;
	
	for I in 1..Step_Count loop
	    Base := First + Float((I-1))*Step;
	    Put(Base, Fore => 6, Aft => 2, Exp => 0);
	    Tax := Base*(Percent/Float(100));
	    Put(Tax, Fore => 8, Aft => 2, Exp => 0);
	    Final := Base + Tax;
	    Put(Final, Fore => 9, Aft => 2, Exp => 0);
	    New_Line;
	end loop;


end ada_o1_2;