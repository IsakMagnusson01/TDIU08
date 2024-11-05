-- isama219: Arbetat enskilt
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Exceptions is
   
   ----------------------------------------------------------------------
   -- Underprogram för att skriva ut meny och hantera menyval          --
   --                                                                  --
   -- Underprogrammet skriver ut de menyval som finns tillgängliga.    --
   -- Användaren får mata in menyval tills denne matat in ett          --
   -- korrekt menyval.                                                 --
   ----------------------------------------------------------------------
   
   Length_Error : exception;
   Format_Error : exception;
   Year_Error : exception;
   Month_Error : exception;
   Day_Error : exception;
   
   type Date_Type is record
      Year, Month, Day : Integer;
   end record;
   
   procedure Get_Safe (Value : out Integer;
		       Min, Max : in Integer) is
   begin
      
      loop
	 loop
	    Put("Mata in värde (");
	    Put(Min, Width => 0);
	    Put(" - ");
	    Put(Max, Width => 0);
	    Put("): ");
	    begin
	       Get(Value);
	       exit;
	    exception
	       when Data_Error =>
		  Put("Fel datatyp. ");
		  Skip_Line;
	    end;
	 end loop;
	 
	 if Value < Min then
	    Put("För litet värde. ");
	 elsif Value > Max then
	    Put("För stort värde. ");
	 else
	    exit;
	 end if;
      end loop;
      
   end Get_Safe;
   
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
	 Get(C);
	 S(I) := C;
      end loop;
      
   end Get_Correct_String;
   
   function Leap_Year (Item : in Date_Type)
		      return Boolean is
   begin
      
      if (Item.Year mod 400 = 0) or (Item.Year mod 4 = 0 and Item.Year mod 100 /= 0) then
	 return True;
      else
	 return False;
      end if;
      
   end Leap_Year;

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
   
   procedure Put (Item : in Date_Type) is
   begin
      
   -- Hittar inget sätt att iterera över en record, så kan inte lösa uppräkningen här
      Put(Item.Year, Width => 0);
      Put('-');
      if Item.Month < 10 then
	 Put(0, Width => 0);
      end if;
      Put(Item.Month, Width => 0);
      Put('-');
      if Item.Day < 10 then
	 Put(0, Width => 0);
      end if;
      Put(Item.Day, Width => 0);
      
   end Put;
   
   function Menu_Selection return Integer is
      
      N : Integer;
      
   begin
      Put_Line("1. Felkontrollerad heltalsinläsning");
      Put_Line("2. Längdkontrollerad stränginläsning");
      Put_Line("3. Felkontrollerad datuminläsning");
      Put_Line("4. Avsluta programmet");
      
      loop
	 Put("Mata in N: ");
	 Get(N);
	 exit when N in 1 .. 4;	 
	 Put_Line("Felaktigt N, mata in igen!");
      end loop;
      
      return N;
   end Menu_Selection;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 1: "felhantering av heltalsinmatning"   --
   --                                                                  --
   -- Underprogrammet låter användaren mata in ett intervall angivet   --
   -- med två heltal Min och Max. Get_Safe anropas                     --
   -- sedan med detta intervall och sköter felhanteringen av           --
   -- heltalsinläsningen där användaren får mata in värden tills       --
   -- korrekt värde matas in.                                          --
   ----------------------------------------------------------------------
   procedure Upg1 is
      
      Value, Min, Max : Integer;
      
   begin      
      Put("Mata in Min och Max: ");
      Get(Min);
      Get(Max);
      
      Get_Safe(Value, Min, Max);
      Skip_Line;
      
      Put("Du matade in heltalet ");
      Put(Value, Width => 0);
      Put_Line(".");      
   end Upg1;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 2: "felhantering av stränginmatning"    --
   --                                                                  --
   -- Underprogrammet skapar en sträng som är lika lång som parametern --
   -- Length. Underprogrammet skickar denna sträng till                --
   -- Get_Correct_String där felhanteringen av stränginmatningen sker. --
   -- Om användaren matar in en för kort sträng kommer                 --
   -- Get_Correct_String kasta/resa undantag vilket inte ska           --
   -- fångas här utan i huvudprogrammet.                               --
   ----------------------------------------------------------------------
   procedure Upg2(Length : in Integer) is
      
      S : String(1 .. Length);
      
   begin      
      Put("Mata in en sträng med exakt ");
      Put(Length, Width => 0);
      Put(" tecken: ");
      
      Get_Correct_String(S); 
      Skip_Line;
      
      Put_Line("Du matade in strängen " & S & ".");      
   end Upg2;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 3: "felhantering av datuminmatning"     --
   --                                                                  --
   -- Underprogrammet anropar Get som i sin tur kommer läsa in och     -- 
   -- kontrollera ett datums format och rimlighet. Om datumet är       --
   -- felaktigt kommer Get kasta/resa undantag vilket detta            --
   -- underprogram ska fånga, skriva ut felmeddelande för och sedan    --
   -- anropa Get igen.                                                 --
   ----------------------------------------------------------------------
   procedure Upg3 is
      
      Date : Date_Type;
      
   begin      
      loop
	 Put("Mata in ett datum: ");
	 begin
	    Get(Date);
	    exit;
	 exception
	    when Format_Error =>
	       Put("Felaktigt format! ");
	    when Year_Error =>
	       Put("Felaktigt år! ");
	    when Month_Error =>
	       Put("Felaktig månad! ");
	    when Day_Error =>
	       Put("Felaktig dag! ");
	 end;
      end loop;
      
      Skip_Line;
      
      Put("Du matade in ");
      Put(Date);
      New_Line;      
   end Upg3;
   
   ----------------------------------------------------------------------
   -- Huvudprogram                                                     --
   --                                                                  --
   -- Huvudprogrammet skriver ut och låter användaren välja val i en   --
   -- meny via underprogrammet Menu_Selection. Beroende på vilket      --
   -- menyval användaren valt kommer olika underprogram anropas.       --
   -- Observera att för menyval 2 kommer användaren få mata in längden -- 
   -- av en sträng vilket skickas vidare till underporgrammet Upg2 där --
   -- strängen i sig skapas.                                           --
   ----------------------------------------------------------------------
   Choice, Length : Integer;
   
begin 
   loop
      Choice := Menu_Selection;
      
      if Choice = 1 then
	 Upg1;
	 
      elsif Choice = 2 then
	 Put("Mata in en stränglängd: ");
	 Get(Length);
	 Skip_Line;
	 
	 begin
	    Upg2(Length);
	 exception
	    when Length_Error =>
	       Put("För få inmatade tecken!");
	       Skip_Line;
	       exit;
	 end;
	    
      elsif Choice = 3 then
	 Upg3;
	 
      else
	 Put_Line("Programmet avslutas.");
	 exit;
      end if;      
   end loop;
end Test_Exceptions;
