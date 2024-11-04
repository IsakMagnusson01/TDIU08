-- isama219: Arbetat enskilt
with Ada.Text_Io;       use Ada.Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;

procedure Ada_P3_0 is
   
   type Data_Array is
     array (-23..-21) of Float;
   
   type Sub_Data is
     array (-50..-47, Boolean) of Data_Array;
   
   type Data is
      record
	 M, K : Sub_Data;
      end record;
   
   -- Get Data_Array
   procedure Get (Inner_Array : out Data_Array) is
   begin
      
      for I in Inner_Array'Range loop
	 Get(Inner_Array(I));
      end loop;
      
   end Get;
   
   
   -- Get Sub_Data ----------
   procedure Get (Data_Matrix : out Sub_Data) is
   begin
      
      for M in reverse Data_Matrix'Range(1) loop
	 for N in reverse Data_Matrix'Range(2) loop
	    Get(Data_Matrix(M, N));
	 end loop;
      end loop;
      
   end Get;
   
   
   -- Get Data ----------
   procedure Get (Data_Structure : out Data) is
   begin
      
      Get(Data_Structure.M);
      Get(Data_Structure.K);
      
   end Get;
   
   
   -- Put Data_Array ----------
   procedure Put (Inner_Array : in Data_Array) is
   begin
      
      for I in reverse Inner_Array'Range loop
	 Put(Inner_Array(I), Fore => 1, Aft => 2, Exp => 0);
	 if I /= Inner_Array'First then
	    Put(' ');
	 end if;
      end loop;
      
   end Put;
   
   
   -- Put Sub_Data ----------
   procedure Put (Data_Matrix : in Sub_Data) is
   begin
      
      for M in reverse Data_Matrix'Range(1) loop
	 for N in reverse Data_Matrix'Range(2) loop
	    Put(Data_Matrix(M, N));
	    if N /= Data_Matrix'First(2) then
	       Put(' ');
	    end if;
	 end loop;
	 if M /= Data_Matrix'First(1) then
	    Put(' ');
	 end if;
      end loop;
      
   end Put;
   
   
   -- Put Data ----------
   procedure Put (Data_Structure : in Data) is
   begin
      
      Put(Data_Structure.M);
      Put(' ');
      Put(Data_Structure.K);
      
   end Put;


   T : Data;


begin
   
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   Put("Inmatad datamängd: ");
   Put(T);
   
end Ada_P3_0;
