unit U_StringTransform;

interface
uses U_Maybe;

type
  Transformstring = class
     str      : TMaybe<ansistring>;
     int      : TMaybe<integer>;
     function   clear(s:ansistring)       : Transformstring;
     function   trunc(i:integer)          : Transformstring;
     function   hextoint                  : Transformstring;
     function   id                        : Transformstring;
     function   sprint                    : ansistring;
     function   iprint                    : ansistring;
  end;


implementation
uses
  System.StrUtils, System.SysUtils, U_Common;


  function  Transformstring.clear(s:ansistring) : Transformstring;
  begin
    Self.str.err   := false;
    Self.str.val   := s;
    result := Self;
  end;


  function    Transformstring.trunc(i:integer) : Transformstring;
  begin
     var ts := Transformstring.Create;
     ts := Self;
     if not str.err then ts.str.val := leftstr(str.val,4);
     result := ts;
  end;


  function   Transformstring.hextoint : Transformstring;
  begin
    if not Self.str.err then begin
         int := hextomaybeint(str.val);    // internal error G15090
         if int.err then str.err := true;
    end;
    result := Self;
  end;


  function  Transformstring.id : Transformstring;
  begin
    result := Self;
  end;


  function  Transformstring.sprint: ansistring;
  begin
    if not Self.str.err then result := Self.str.val
                        else result := '';
  end;

  function  Transformstring.iprint: ansistring;
  begin
    if not Self.str.err then result := Self.int.val.ToString
                        else result := '';
  end;


end.
