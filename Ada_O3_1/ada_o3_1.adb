-- isama219: Arbetat enskilt

with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Float_Text_Io;   use Ada.Float_Text_Io;


procedure Ada_O3_1 is
   
   type Data2_Sub is 
      record
	 S : Float;
	 Z : String(1..4);
      end record;
   
   type Data3_Sub1 is
      record
	 Y : Character;
	 Q : Character;
      end record;
   
   type Data3_Sub2 is
      record
	 T : Boolean;
	 L : Character;
      end record;
   
   type Data1 is 
      record
	 W : Character;
	 P : String(1..4);
      end record;
   
   type Data2 is 
      record
	 
	 D : Data2_Sub;
	 U : Data2_Sub;
	 
      end record;
   
   type Data3 is
      record
	 
	 J : Data3_Sub1;
	 B : Data3_Sub1;
	 O : Data3_Sub2;
	 
      end record;
   
   -- Get Boolean
   
   procedure Get (B : out Boolean) is
      
      C : Character;
      
   begin
      
      Get(C);
      if C = 'T' then
	 B := True;
      else
	 B := False;
      end if;
      
   end Get;
   
   -- Put Boolean
   
   procedure Put (B : in Boolean) is
   begin
      
      if B then
	 Put("True");
      else
	 Put("False");
      end if;
      
   end Put;
   
   -- Get Data2_Sub
   
   procedure Get (Sub_Data : out Data2_Sub) is
      
      L : Character;
      
   begin
      
      Get(Sub_Data.S);
      Get(L);
      Get(Sub_Data.Z);
      
   end Get;
   
   -- Put Data2_Sub
   
   procedure Put (Sub_Data : in Data2_Sub) is
   begin
      
      Put(Sub_Data.S, Fore => 1, Aft => 3, Exp => 0);
      Put(' ');
      Put(Sub_Data.Z);
      
   end Put;
   
   -- Get Data3_Sub1
   
   procedure Get (Sub_Data : out Data3_Sub1) is
      
      L : Character;
      
   begin
      
      Get(Sub_Data.Y);
      Get(L);
      Get(Sub_Data.Q);
      
   end Get;
   
   -- Put Data3_Sub1
   
   procedure Put (Sub_Data : in Data3_Sub1) is
   begin
      
      Put(Sub_Data.Y);
      Put(' ');
      Put(Sub_Data.Q);
      
   end Put;
   
   -- Get Data3_Sub2
   
   procedure Get (Sub_Data : out Data3_Sub2) is
      
      L : Character;
      
   begin
      
      Get(Sub_Data.T);
      Get(L);
      Get(Sub_Data.L);
      
   end Get;
   
   -- Put Data3_Sub2
   
   procedure Put (Sub_Data : in Data3_Sub2) is
   begin
      
      Put(Sub_Data.T);
      Put(' ');
      Put(Sub_Data.L);
      
   end Put;
   
   -- Get Data1
   
   procedure Get (Data : out Data1) is
      
      L : Character;
      
   begin
      
      Get(Data.W);
      Get(L);
      Get(Data.P);
      
   end Get;
   
   -- Put Data1
   
   procedure Put (Data : in Data1) is
   begin
      
      Put_Line(Data.W & ' ' & Data.P);
      
   end Put;
   
   -- Get Data2
   
   procedure Get (Data : out Data2) is
      
   begin
      
      Get(Data.D);
      Get(Data.U);
      
   end Get;
   
   -- Put Data2
   
   procedure Put (Data : in Data2) is
   begin
      
      Put(Data.D);
      Put(' ');
      Put(Data.U);
      
   end Put;
   
   -- Get Data3
   
   procedure Get (Data : out Data3) is
      
      L : Character;
      
   begin
      
      Get(Data.J);
      Get(L);
      Get(Data.B);
      Get(L);
      Get(Data.O);
      
   end Get;
   
   -- Put Data3
   
   procedure Put (Data : in Data3) is
   begin
      
      Put(Data.J);
      Put(' ');
      Put(Data.B);
      Put(' ');
      Put(Data.O);
      
   end Put;
   
   
   Ds1 : Data1;
   Ds2 : Data2;
   Ds3 : Data3;
   
   
begin
   
   -- DS1 ----------
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(Ds1);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(Ds1);
   New_Line;
   
   -- DS2 ----------
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(Ds2);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(Ds2);
   New_Line(2);
   
   -- DS3 ----------
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(Ds3);
   Skip_Line;
   
   Put("Inmatad datamängd: ");
   Put(Ds3);
   
end Ada_O3_1;
