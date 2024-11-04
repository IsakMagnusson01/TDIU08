-- isama219: Arbetat enskilt
with Ada.Text_Io; use Ada.Text_Io;
  
procedure Ada_P3 is
   
   type Inner_Record is
      record
	 V, S : String(1..2);
      end record;
   
   type Data_Array is
     array (Boolean) of Inner_Record;
   
   type Data_Matrix is
     array (Character range 'O'..'P', -89..-88) of Data_Array;
   
   -- Get Inner_Record
   procedure Get (Item_Record : out Inner_Record) is
      
      C : Character;
      
   begin
      
      Get(Item_Record.V);
      Get(C);
      Get(Item_Record.S);
      
   end Get;
   
   -- Get Data_Array ----------
   procedure Get (Item_Array : out Data_Array) is
      
      C : Character;
      
   begin
      
      for B in reverse Item_Array'Range loop
	 Get(Item_Array(B));
	 if B /= Item_Array'First then
	    Get(C);
	 end if;
      end loop;
      
   end Get;
   
   -- Get Data_Matrix ----------
   procedure Get (Item_Matrix : out Data_Matrix) is
      
      C : Character;
      
   begin
      
      for M in Item_Matrix'Range(1) loop
	 for N in reverse Item_Matrix'Range(2) loop
	    Get(Item_Matrix(M, N));
	    if N /= Item_Matrix'First(2) then
	       Get(C);
	    end if;
	 end loop;
	 if M /= Item_Matrix'Last(1) then
	    Get(C);
	 end if;
      end loop;
      
   end Get;
   
   -- Put Inner_Record
   procedure Put (Item_Record : in Inner_Record) is
   begin
      
      Put(Item_Record.V);
      Put(' ');
      Put(Item_Record.S);
      
   end Put;
   
   -- Put Data_Array
   procedure Put (Item_Array : in Data_Array) is
   begin
      
      for B in reverse Item_Array'Range loop
	 Put(Item_Array(B));
	 if B /= Item_Array'First then
	    Put(' ');
	 end if;
      end loop;
      
   end Put;
   
   -- Put Data_Matrix ----------
   procedure Put (Item_Matrix : in Data_Matrix) is
   begin
      
      for M in reverse Item_Matrix'Range(1) loop
	 for N in Item_Matrix'Range(2) loop
	    Put(Item_Matrix(M, N));
	    if N /= Item_Matrix'Last(2) then
	       Put(' ');
	    end if;
	 end loop;
	 if M /= Item_Matrix'First(1) then
	    Put(' ');
	 end if;
      end loop;
      
   end Put;
   
   T : Data_Matrix;
   
begin
   
   Put("Mata in datamängd: ");
   Get(T);
   Skip_Line;
   Put("Inmatad datamängd: ");
   Put(T);
   
end Ada_P3;
