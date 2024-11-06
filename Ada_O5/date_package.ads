package Date_Package is
   
   type Date_Type is private;
   
   procedure Get(Item : out Date_Type);
   procedure Put(Item : in Date_Type);
   
   function Next_Date(Item : in Date_Type)
		     return Date_Type;
   --function Previous_Date(Item : in Date_Type)
			 --return Date_Type;
   
   -- Definition of exceptions which can be raised
   Length_Error : exception;
   Format_Error : exception;
   Year_Error : exception;
   Month_Error : exception;
   Day_Error : exception;
   
private
   
   type Date_Type is record
      Year, Month, Day : Integer;
   end record;
   
end Date_Package;
