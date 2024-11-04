with Ada.Text_Io;         use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io;   use Ada.Float_Text_Io;

procedure Lektion is
   
   type Koordinat is
      record
	 X : Integer;
	 Y : Integer;
      end record;
   
   X_Y : Koordinat;
   I1, I2 : Integer;
   
begin
   
   Put("Mata in koordinater här: ");
   Get(I1);
   Get(I2);
   X_Y := (I1, I2);
   Put("Du skrev in koordinaterna: (");
   Put(X_Y.X, Width => 0);
   Put(", ");
   Put(X_Y.Y, Width => 0);
   Put(')');
   
end Lektion;
