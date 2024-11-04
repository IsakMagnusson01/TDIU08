-- isama219: Arbetat enskilt

with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;   use Ada.Float_Text_Io;
  
procedure Ada_O3_2 is
   
   type Data1 is
     array (31..35) of Float;
   
   type Data2_Sub is
     array (Character range '5'..'9') of String(1..5);
   
   type Data2 is
     array (Boolean) of Data2_Sub;
   
   type Data3 is
     array (73..74, Character range '4'..'8') of Integer;
   
   -- Get Data1 ----------
   procedure Get (Data : out Data1) is
   begin
      
      for I in reverse Data'Range loop
	 Get(Data(I));
      end loop;
      
   end Get;
   
   -- Put Data1 ----------
   procedure Put (Data : in Data1) is
   begin
      
      for I in reverse Data'Range loop
	 Put(Data(I), Fore => 2, Aft => 3, Exp => 0);
	 
	 if I /= Data'First then
	    Put(' ');
	 end if;
	 
      end loop;
      
   end Put;
   
   -- Get Data2_Sub ----------
   procedure Get (Sub_Data : out Data2_Sub) is

      L : Character;
      
   begin
      
      for I in reverse Sub_Data'Range loop
	 Get(Sub_Data(I));
	 
	 if I /= Sub_Data'First then
	    Get(L);
	 end if;
	 
      end loop;
      
      
   end Get;
   
   -- Put Data2_Sub ----------
   procedure Put (Sub_Data : in Data2_Sub) is
   begin
      
      for I in reverse Sub_Data'Range loop
	 Put(Sub_Data(I));
	 
	 if I /= Sub_Data'First then
	    Put(' ');
	 end if;
	 
      end loop;
      
   end Put;
   
   -- Get Data2 ----------
   procedure Get (Data : out Data2) is
      
      L : Character;
      
   begin
      
      Get(Data(False));
      Get(L);
      Get(Data(True));
      
   end Get;
   
   -- Put Data2 ----------
   procedure Put (Data : in Data2) is
   begin
      
      Put(Data(False));
      Put(' ');
      Put(Data(True));
      
   end Put;
   
   -- Get Data3 ----------
   procedure Get (Data : out Data3) is
   begin
      
      for N in Data'Range(1) loop
	 for M in Data'Range(2) loop
	    Get(Data(N,M));
	 end loop;
      end loop;
      
   end Get;
   
   -- Put Data3 ----------
   procedure Put (Data : in Data3) is
   begin
      
      for N in Data'Range(1) loop
	 for M in Data'Range(2) loop
	    Put(Data(N,M), Width => 0);
	    
	    if M /= Data'Last(2) then
	       Put(' ');
	    end if;
	    
	 end loop;
	 
	 if N /= Data'Last(1) then
	    Put(' ');
	 end if;
	 
      end loop;
      
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
   New_Line(2);
   
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
   
end Ada_O3_2;
