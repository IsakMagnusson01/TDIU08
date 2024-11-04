-- isama219: Arbetat enskilt
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;   use Ada.Float_Text_Io;
with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Numerics;        use Ada.Numerics;
procedure Ada_P2_0 is
   
   procedure Deluppgift_1 (C : out Character;
			   F : out Float;
			   I : out Integer) is
      
      Place_Holder : Integer;
      
   begin
      
      Put("Mata in ett tecken: ");
      Get(C);
      Put("Mata in ett flyttal: ");
      Get(F);
      Skip_Line;
      
      Place_Holder := Character'Pos(C) - Character'Pos('0');
      I := Integer(Float'Floor(Float(Place_Holder) - F));
      
      Put("Du matade in tecknet: " & C
	    & " och flyttalet: ");
      
      Put(F, Fore => 2, Aft => 1, Exp => 0);
      Put(" och differensen blev");
      Put(I, Width => 12);
      
   end Deluppgift_1;
   
   function Deluppgift_2 (F1, F2, F3 : in Float)
			 return Float is
      
      Mid : Float;
      
   begin
      
      Mid := (F1 + F2 + F3)/3.0;
      return Mid;
      
   end Deluppgift_2;
   
   function "-" (S : in String;
			  C : in Character)
			 return Float is
      
      Diff : Float;
      Place_Holder : Integer;
      
   begin
      
      Place_Holder := Character'Pos(C) - Character'Pos('0');
      Diff := Float'Value(S) - Float(Place_Holder);
      
      return Diff;
      
   end Deluppgift_3;
   
   C : Character;
   F, J, K, L : Float;
   I : Integer;
   S : String(1..3);
   
begin
   
   Deluppgift_1(C, F, I);
   New_Line(2);
   
   Put("Mata in tre flyttal: ");
   Get(J);
   Get(K);
   Get(L);
   Skip_Line;
   
   F := Deluppgift_2(J, K, L);
   Put("Medelvärdet av dessa är: ");
   Put(F, Fore => 1, Aft => 1, Exp => 0);
   New_Line(2);
   
   Put("Mata in en sträng: ");
   Get(S);
   Put("Mata in ett tecken: ");
   Get(C);
   Skip_Line;
   
   F := Deluppgift_3(S, C);
   Put("Den beräknade differensen mellan " & S
	 & " och " & C & " blir ");
   Put(F, Fore => 2, Aft => 1, Exp => 0);
   
   
end Ada_P2_0;

