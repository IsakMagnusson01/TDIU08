with Ada.Text_Io; use Ada.Text_Io;

procedure Test1 is
   
   function My_Func (I : in Integer)
		    return Boolean is
   begin
      
      return I > 10;
      
   end My_Func;
   
   B : Boolean;
   
begin
   
   B := My_Func(11);
   if B then
      Put("True");
   else
      Put("False");
   end if;
   
end Test1;
