-- isama219: Arbetat enskilt
with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;	    	use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;		    	use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;	use Ada.Numerics.Elementary_Functions;
with Ada.Numerics;			use Ada.Numerics;

procedure ada_o11_1 is

-- Calculate Hypotenuse

   function Calculate_Hypotenuse (A, B : in Integer)
   	    return Float is
   
	 H : Float;
	     
   begin

	 H := sqrt(Float(A**2)+Float(B**2));

	 return H;

   end Calculate_Hypotenuse;

-- Hypotenuse Program

   procedure Hypotenuse_Program is

   	 A, B : Integer;
   	 H : Float;
	 
   begin
	 Put("Mata in kateternas längder: ");
	 Get(A);
         Get(B);
         Skip_Line;

	 H := Calculate_Hypotenuse(A,B);
	 Put("Hypotenusan är ");
	 Put(H, Fore => 1, Aft => 2, Exp => 0);
	 New_Line(2);

   end Hypotenuse_Program;

-- Calculate Angles

   procedure Calculate_Angles (Hc, Sa : in Float;
   	     		   Va, Vb, Vc : out Float) is
   begin
	Va := arcsin(Sa/Hc)*(180.0/Pi);
	Vb := arccos(Sa/Hc)*(180.0/Pi);
	Vc := 180.0 - (Va + Vb);

   end Calculate_Angles;


-- Angle Program

   procedure Angle_Program is
   
	 Va, Vb, Vc, Hc, Sa : Float;
	 
   begin
	 Put("Mata in hypotenusans längd: ");
	 Get(Hc);
	 Put("Mata in vertikala katetens längd: ");
         Get(Sa);
         Skip_Line;

	 Calculate_Angles(Hc, Sa, Va, Vb, Vc);
	 Put("Va: ");
         Put(Va, Fore => 1, Aft => 1, Exp => 0);
         Put(" grader");
         New_Line;
      
	 Put("Vb: ");
         Put(Vb, Fore => 1, Aft => 1, Exp => 0);
	 Put(" grader");
         New_Line;
      
	 Put("Vc: ");
	 Put(Vc, Fore => 1, Aft => 1, Exp => 0);
	 Put(" grader");
	 New_Line(2);

	 

   end Angle_Program;

-- Calculate Factorial

   function Calculate_Factorial (N : in Integer)
   	    return Integer is
	Result : Integer;
   begin
	Result := 1;
	for I in 1..N loop
	    Result := Result*I;
	end loop;

	return Result;

   end Calculate_Factorial;

-- Factorial Program

   procedure Factorial_Program is

   	N, Factorial : Integer;

   begin

	Put("Mata in N: ");
        Get(N);
        Skip_Line;
      
	Factorial := Calculate_Factorial(N);
	Put(N, Width => 0);
	Put("-fakultet = ");
	Put(Factorial, Width => 0);
	New_Line(2);

   end Factorial_Program;

-- Menu Selection

   procedure Menu_Selection (Selection : out Integer) is

   begin
   	Put_Line("=== HUVUDMENY ===");
   	Put_Line("1. Beräkna hypotenusa");
   	Put_Line("2. Beräkna triangelvinklar");
   	Put_Line("3. Beräkna N-fakultet");
	Put_Line("4. Avsluta programmet");
      
      loop
	 Put("Val: ");
	 Get(Selection);
	 Skip_Line;
	 if Selection >= 1 and Selection <= 4 then
	    exit;
	 end if;
	 Put_Line("Felaktigt val!");
      end loop;

   end Menu_Selection;

----------------------------------------------------

   Selection : Integer;
	  
begin
	      
   Put_Line("Välkommen till miniräknaren!");
   
   loop
      
      Menu_Selection(Selection);
      if Selection = 1 then
	 Hypotenuse_Program;
      elsif Selection = 2 then
	 Angle_Program;
      elsif Selection = 3 then
	 Factorial_Program;
      else
	 Put_Line("Ha en bra dag!");
	 exit;
      end if;
      
   end loop;

end ada_o11_1;
