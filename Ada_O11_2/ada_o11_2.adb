-- isama219: Arbetat enskilt
with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Text_Io;         use Ada.Text_Io;
  
procedure Ada_O11_2 is
begin
   
   if Argument_Count = 0 then
      Put("Inga argument angivna.");
   elsif Argument_Count /= 3 then
      Put("Fel antal argument angivna.");
   else
      Put("Första argumentet: " & Argument(1));
      New_Line;
      Put("Andra argumentet så många gånger som tredje argumentet anger:");
      New_Line;
      for I in 1..Integer'Value(Argument(3)) loop
	 Put(Argument(2));
      end loop;
      New_Line;
      Put("Programmet " & """" & Command_Name & """" & " avslutas.");
   end if;
   
end Ada_O11_2;
