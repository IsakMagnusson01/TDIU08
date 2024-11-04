-- isama219: Arbetat enskilt
with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;   use Ada.Float_Text_Io;
with Ada.Numerics;        use Ada.Numerics;

procedure Ada_O2_0 is
   
   function Deluppgift_1(S : in String)
			return Integer is
      
      X : Integer;
      
   begin
      
      
      X := Integer(Float'Floor(Float'Value(S)*32.7));
      
      return X;
      
      
   end Deluppgift_1;
   

   
   function Deluppgift_2(I : in Integer; F : in Float)
			return Integer is
      
      X : Integer;
      
   begin
      
      X := Integer(Float'Floor(Float(I)*F));
      
      return X;
      
   end Deluppgift_2;
   
   function Deluppgift_3(I : in Integer; S : in String)
			return Integer is
      
      X : Integer;
      
   begin
      
      X := Integer(Float'Floor(Float(I) - Float'Value(S)));
      
      return X;
      
   end Deluppgift_3;
   
   I, Result : Integer;
   F : Float;
   S : String(1..3);
   
begin
   
   Put("Mata in en sträng: ");
   Get(S);
   Result := Deluppgift_1(S);
   Put("produkten av ");
   Put(S);
   Put(" och 32.7 blir ");
   Put(Result, Width => 0);
   New_Line(2);
   
   Put("Mata in ett heltal: ");
   Get(I);
   Put("Mata in ett flyttal: ");
   Get(F);
   Result := Deluppgift_2(I, F);
   Put("Den beräknade produkten av ");
   Put(I, Width => 0);
   Put(" och ");
   Put(F, Fore => 1, Aft => 1, Exp => 0);
   Put(" blir ");
   Put(Result, Width => 0);
   New_Line(2);
   
   Put("Mata in ett heltal: ");
   Get(I);
   Put("Mata in en sträng med exakt 3 tecken: ");
   Get(S);
   Result := Deluppgift_3(I, S);
   Put("Du matade in heltalet: ");
   Put(I, Width => 0);
   Put(" och strängen: ");
   Put(S);
   Put(" och differensen blev");
   Put(Result, Width => 12);
   New_Line(2);
   
   
   
   
end Ada_O2_0;


