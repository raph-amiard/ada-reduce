with Ada.Text_IO; use Ada.Text_IO;
with Generic_Reduce;

procedure Main is
   type My_Array is array (Positive range <>) of Integer;
   Inst : My_Array := (1, 2, 3, 4);

   function Red is new Generic_Reduce.Array_Reduce (Positive, Integer, My_Array, Integer, 0, "+");
begin
   Put_Line (Red (Inst)'Image);
end Main;
