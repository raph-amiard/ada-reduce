package body Generic_Reduce is
   function Reduce (Self : Container) return Accum is
      C : Cursor := First (Self);
      Res : Accum := Initial_Value;
   begin
      while Has_Element (Self, C) loop
         declare
            E : El_Type := Element (Self, C);
         begin
            Res := Accumulate (Res, E);
         end;
         C := Next (Self, C);
      end loop;
      return Res;
   end Reduce;

   function Array_Reduce (Self : Array_Type) return Accum is
      function First (Self : Array_Type) return Index_Type is (Self'First);
      function Next (Self : Array_Type; I : Index_Type) return Index_Type is (Index_Type'Succ (I));
      function Has_Element (Self : Array_Type; I : Index_Type) return Boolean is (I <= Self'Last);
      function Element (Self : Array_Type; I : Index_Type) return El_Type is (Self (I));

      function Reduce_Inst is new Reduce
        (Container => Array_Type,
         Cursor => Index_Type,
         El_Type => El_Type,
         First => First,
         Next => Next,
         Element => Element,
         Has_Element => Has_Element,
         Accum => Accum,
         Initial_Value => Initial_Value,
         Accumulate => Accumulate);
   begin
      return Reduce_Inst (Self);
   end Array_Reduce;
end Generic_Reduce;
