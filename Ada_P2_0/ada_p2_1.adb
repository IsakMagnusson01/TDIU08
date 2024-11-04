-- isama219: Arbetat enskilt
with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;   use Ada.Float_Text_Io;
with Ada.Numerics;        use Ada.Numerics;
procedure Ada_P2_1 is
   
   function Biggest (F1, F2, F3 : in Float)
		    return Float is
     
   begin
      
      if F1 >= F2 then
	 if F1 >= F3 then
	    return Float'Ceiling(F1);
	 else
	    return Float'Ceiling(F3);
	 end if;
      else
	 if F2 >= F3 then
	    return Float'Ceiling(F2);
	 else
	    return Float'Ceiling(F3);
	 end if;
      end if;
      
   end Biggest;
   
   
   
   procedure Subtract (F1 : out Float;
		       C : out Character;
		       F2 : out Float) is
      
      Place_Holder : Integer;
      
   begin
      
      Put("Mata in ett flyttal: ");
      Get(F1);
      Put("Mata in ett tecken: ");
      Get(C);
      Skip_Line;
      
      Place_Holder := Character'Pos(C) - Character'Pos('0');
      F2 := Float'Ceiling(F1 - Float(Place_Holder));
      
   end Subtract;
   
   
   
   function "*" (Left : in Integer;
		 Right : in Float)
		return Integer is
   begin
      
      return Integer(Float'Floor(Float(Left) * Right));
      
   end "*";
   
   I, Result_I : Integer;
   F1, F2, F3, Result_F : Float;
   C : Character;
   
begin
   
   -- Deluppgift 1 ----------
   
   Put("Mata in tre flyttal: ");
   Get(F1);
   Get(F2);
   Get(F3);
   Skip_Line;
   
   Result_F := Biggest(F1, F2, F3);
   Put("Det största värdet av dessa är: ");
   Put(Result_F, Fore => 1, Aft => 1, Exp => 0);
   New_Line(2);
   
   
   -- Deluppgift 2 ----------
   
   Subtract(F1, C, F2);
   Put("Du matade in flyttalet: ");
   Put(F1, Fore => 1, Aft => 1, Exp => 0);
   Put(" och tecknet: " & C & " och differensen blev ");
   Put(F2);
   New_Line(2);
   
   
   -- Deluppgift 3 ----------
   
   Put("Mata in ett heltal: ");
   Get(I);
   Put("Mata in ett flyttal: ");
   Get(F1);
   Skip_Line;
   
   Result_I := I * F1;
   Put("Den beräknade produkten av ");
   Put(I, Width => 0);
   Put(" och ");
   Put(F1, Fore => 1, Aft => 1, Exp => 0);
   Put(" blir ");
   Put(Result_I, Width => 0);
   
   
end Ada_P2_1;
