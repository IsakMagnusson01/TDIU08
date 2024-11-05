-- isama219: Arbetat enskilt
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Ada_O11_3 is
   
   subtype Int_Interval is
     Integer range 1..6;
   
   subtype Char_Interval is
     Character range 'A'..'Z';
   
   package Rand_Int is
     new Ada.Numerics.Discrete_Random(Int_Interval);
   
   package Rand_Char is
     new Ada.Numerics.Discrete_Random(Char_Interval);
     
   use Rand_Int;
   use Rand_Char;
   
   function Random_Int (G : in Rand_Int.Generator)
		       return Integer is
   begin
      
      return Rand_Int.Random(G);
      
   end Random_Int;
   
   function Random_Char (G : in Rand_Char.Generator)
			 return Character is
   begin
      
      return Rand_Char.Random(G);
      
   end Random_Char;
   
   function Random_Float (G : in Ada.Numerics.Float_Random.Generator;
			  Min, Max : in Float)
			 return Float is
   begin
      
      return Ada.Numerics.Float_Random.Random(G) * ((Min+Max)/Float(2));
      
   end Random_Float;
   
   G1 : Rand_Int.Generator;
   G2 : Rand_Char.Generator;
   G3 : Ada.Numerics.Float_Random.Generator;
   Number_Of_Integers, Number_Of_Characters : Integer;
   Min, Max : Float;
   
begin
   
   Reset(G1);
   Reset(G2);
   Reset(G3);
   
   -- Del 1
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
      Put(Random_Int(G1), Width => 0);
   end loop;
   New_Line;
   
   -- Del 2
   Number_Of_Characters := Random_Int(G1);
   Put(Number_Of_Characters, Width => 0);
   if Number_Of_Characters = 1 then
      Put(" slumpat tecken:");
   else
      Put(" slumpade tecken:");
   end if;
   for I in 1..Number_Of_Characters loop
      Put(' ');
      Put(Random_Char(G2));
   end loop;
   New_Line;
   
   -- Del 3
   Put("Mata in två flyttal: ");
   Get(Min);
   Get(Max);
   Put("Slumpat flyttal mellan ");
   Put(Min, Fore => 1, Aft => 2, Exp => 0);
   Put(" och ");
   Put(Max, Fore => 1, Aft => 2, Exp => 0);
   Put(": ");
   Put(Random_Float(G3, Min, Max), Fore => 1, Aft => 2, Exp => 0);
   
end Ada_O11_3;
