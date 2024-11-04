-- isama219: Arbetat enskilt

with Ada.Text_Io;          use Ada.Text_Io;
with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;    use Ada.Float_Text_Io;
with Ada.Numerics;         use Ada.Numerics;

procedure Ada_P2 is
   
   function Multiply (S : in String)
		     return Float is
   begin
      
      return Float'Ceiling(Float'Value(S) * 32.7);
      
   end Multiply;
   
   
   
   function "*" (Left : in Float;
		 Right : in Integer)
		return Float is
   begin
      
      return Float'Rounding(Left * Float(Right));
      
   end "*";
   
   
   
   procedure Add (I : out Integer;
		  F, Result : out Float) is
   begin
      
      Put("Mata in ett heltal: ");
      Get(I);
      Put("Mata in ett flyttal: ");
      Get(F);
      Skip_Line;
      
      Result := Float'Rounding(Float(I) + F);
      
   end Add;
   
   F, Result : Float;
   I : Integer;
   S : String(1..3);
   
begin
   -- Deluppgift 1 ----------
   
   Put("Mata in en sträng: ");
   Get(S);
   Skip_Line;
   
   Result := Multiply(S);
   Put("produkten av " & S & " och 32.7 blir ");
   Put(Result, Fore => 1, Aft => 1, Exp => 0);
   New_Line(2);
   
   -- Deluppgift 2 ----------
   
   Put("Mata in ett flyttal: ");
   Get(F);
   Put("Mata in ett heltal: ");
   Get(I);
   Skip_Line;
   
   Result := F * I;
   Put("Den beräknade produkten av ");
   Put(F, Fore => 1, Aft => 1, Exp => 0);
   Put(" och ");
   Put(I, Width => 0);
   Put(" blir ");
   Put(Result, Fore => 1, Aft => 1, Exp => 0);
   New_Line(2);
   
   -- Deluppgift 3 ----------
   
   Add(I, F, Result);
   Put("Du matade in heltalet: ");
   Put(I, Width => 0);
   Put(" och flyttalet: ");
   Put(F, Fore => 1, Aft => 1, Exp => 0);
   Put(" och summan blev ");
   Put(Result, Fore => 2);
   
end Ada_P2;
