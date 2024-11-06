with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
package body Date_Package is
   
   ------------------------------------------------------------------
   
   procedure Get_Correct_String (S : out String) is
      
      C : Character;
      
   begin
      
      loop
	 Get(C);
	 if C /= ' ' then
	    S(S'First) := C;
	    exit;
	 end if;
      end loop;
      
      
      for I in S'First+1..S'Last loop
	 if End_Of_Line then
	    raise Length_Error;
	 end if;
	 Get(S(I));
      end loop;
      
   end Get_Correct_String;
   
   ------------------------------------------------------------------
   
   function Leap_Year (Item : in Date_Type)
		      return Boolean is
   begin
      
      if (Item.Year mod 400 = 0) or (Item.Year mod 4 = 0 and Item.Year mod 100 /= 0) then
	 return True;
      else
	 return False;
      end if;
      
   end Leap_Year;

   ------------------------------------------------------------------
   
   function Control_Days (Item : in Date_Type)
			 return Boolean is
   begin
      
      -- Dag kan vara minst 1 och högst 31
      if Item.Day < 1 or Item.Day > 31 then
	 return False;
      end if;
	 
      case Item.Month is
	 when 1 | 3 | 5 | 7..8 | 10 | 12 =>
	    return Item.Day <= 31;
	 when 4 | 6 | 9 | 11 =>
	    return Item.Day <= 30;
	 when 2 =>
	    if not Leap_Year(Item) then
	       return Item.Day <= 28;
	    else
	       return Item.Day <= 29;
	    end if;
	 when others =>
	    raise Month_Error;
      end case;
      
   end Control_Days;

   ------------------------------------------------------------------
   
   procedure Control_Format (S : in String) is
   begin
      
      for I in 1..10 loop
	 case I is
	    when 1..4 | 6..7 | 9..10 =>
	       if S(I) not in '0'..'9' then
		  raise Format_Error;
	       end if;
	    when 5 | 8 =>
	       if S(I) /= '-' then
		  raise Format_Error;
	       end if;
	 end case;
      end loop;
      
   end Control_Format;
   
   ------------------------------------------------------------------
   
   procedure Get (Item : out Date_Type) is
      
      S : String(1..10);
      
   begin
      
      begin
	 Get_Correct_String(S);
      exception
	 when Length_Error =>
	    raise Format_Error;
      end;
      
      Control_Format(S);
      
      Item.Year := Integer'Value(S(1..4));
      Item.Month := Integer'Value(S(6..7));
      Item.Day := Integer'Value(S(9..10));
      
      if Item.Year < 1532 or Item.Year > 9000 then
	 raise Year_Error;
      end if;
      
      if Item.Month < 1 or Item.Month > 12 then
	 raise Month_Error;
      end if;
      
      if not Control_Days(Item) then
	 raise Day_Error;
      end if;
      
   end Get;
   
   ------------------------------------------------------------------
   
   procedure Put_NN (I : Integer) is
   begin
      
      Put('-');
      if I < 10 then
	 Put(0, Width => 0);
      end if;
      Put(I, Width => 0);
      
   end Put_NN;
   
   ------------------------------------------------------------------
   
   procedure Put (Item : in Date_Type) is
   begin
      
      Put(Item.Year, Width => 0);
      Put_NN(Item.Month);
      Put_NN(Item.Day);
      
   end Put;
   
   ------------------------------------------------------------------
   
   function Next_Date (Item : in Date_Type)
		      return Date_Type is
      New_Date : Date_Type;
      
   begin
      
      New_Date := Item;

      case New_Date.Month is
	 when 1 | 3 | 5 | 7..8 | 10 =>
	    if New_Date.Day = 31 then
	       New_Date.Month := New_Date.Month + 1;
	       New_Date.Day := 1;
	    else
	       New_Date.Day := New_Date.Day + 1;
	    end if;
	 when 4 | 6 | 9 | 11 =>
	    if New_Date.Day = 30 then
	       New_Date.Month := New_Date.Month + 1;
	       New_Date.Day := 1;
	    else
	       New_Date.Day := New_Date.Day + 1;
	    end if;
	 when 2 =>
	    if Leap_Year(New_Date) then
	       if New_Date.Day = 29 then
		  New_Date.Month := New_Date.Month + 1;
		  New_Date.Day := 1;
	       else
		  New_Date.Day := New_Date.Day + 1;
	       end if;
	    else
	       if New_Date.Day = 28 then
		  New_Date.Month := New_Date.Month + 1;
		  New_Date.Day := 1;
	       else
		  New_Date.Day := New_Date.Day + 1;
	       end if;
	    end if;
	 when 12 =>
	    if New_Date.Day = 31 then
	       if New_Date.Year = 9000 then
		  raise Year_Error;
	       end if;
	       New_Date.Year := New_Date.Year + 1;
	       New_Date.Month := 1;
	       New_Date.Day := 1;
	    else
	       New_Date.Day := New_Date.Day + 1;
	    end if;
	 when others =>
	    raise Month_Error;
      end case;
      
      return New_Date;
      
   end Next_Date;
   
end Date_Package;
