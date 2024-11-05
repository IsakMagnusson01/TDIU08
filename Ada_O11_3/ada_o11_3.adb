-- isama219: Arbetat enskilt
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Numerics.Discrete_Random;

procedure Ada_O11_3 is
   
   subtype Int_Interval is
     Integer range 1..6;
   
   subtype Char_Interval is
     Character range 'A'..'Z';
   
   package Random_Number is
     new Ada.Numerics.Discrete_Random(Int_Interval);
   
   package Random_Character is
      new Ada.Numerics.Discrete_Random(Char_Interval);
   
   
   procedure Random_Numbers (G : in Random_Number.Generator) is
      
      Number_Of_Integers : Integer;
      
   begin
      
      Put("Mata in antalet heltal som ska slumpas: ");
      Get(Number_Of_Integers);
      Skip_Line;
      Put(Number_Of_Integers, Width => 0);
      if Number_Of_Integers = 1 then
	 Put(" slumpat heltal:");
      else
	 Put(" slumpade heltal:");
      end if;
   
      for I in 1..Number_Of_Integers loop
	 Put(' ');
	 Put(Random(G), Width => 0);
      end loop;
      
   end Random_Numbers;
   
   procedure Random_Characters (G : in Random_Character.Generator) is
      
      Number_Of_Characters : Integer;
      
   begin
      
      Number_Of_Characters := Random(G);
      
   end Random_Characters;
   
   G1 : Random_Number.Generator;
   G2 : Random_Character.Generator;
   
begin
   
   Reset(G1);
   Reset(G2);
   Random_Numbers(G1);
   Random_Characters(G2);
   
end Ada_O11_3;
