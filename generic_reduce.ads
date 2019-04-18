package Generic_Reduce is
   generic
      type Container (<>) is private;
      type Cursor is private;
      type El_Type is private;

      with function First (Self : Container) return Cursor;
      with function Next (Self : Container; C : Cursor) return Cursor;
      with function Element (Self : Container; C : Cursor) return El_Type;
      with function Has_Element (Self : Container; C : Cursor) return Boolean;

      type Accum is private;
      Initial_Value : Accum;
      with function Accumulate (Current : Accum; El : El_Type) return Accum;
   function Reduce (Self : Container) return Accum;

   generic
      type Index_Type is (<>);
      type El_Type is private;
      type Array_Type is array (Index_Type range <>) of El_Type;

      type Accum is private;
      Initial_Value : Accum;
      with function Accumulate (Current : Accum; El : El_Type) return Accum;
   function Array_Reduce (Self : Array_Type) return Accum;

end Generic_Reduce;
