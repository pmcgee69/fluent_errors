unit U_InternetString;

interface
uses U_Maybe;

type
  Internetstring = record
     str : maybe<string>;
     function   clear                     : Internetstring;
     function   print                     : boolean;
     function   get_res_name(path:string) : Internetstring;
     function   get_res_type(path:string) : Internetstring;
     function   get_res_next(path:string) : Internetstring;
  end;


implementation

  function   Internetstring.get_res_name(path:string) : Internetstring;
  begin
     if not str.err then Self.str.val := Self.str.val + 'aaa.';
     result := Self;
  end;

  function   Internetstring.get_res_type(path:string) : Internetstring;
  begin
     if not str.err then
        if path=''  then Self.str.err := true
                    else Self.str.val := Self.str.val + 'bbb.';
     result := Self;
  end;

  function   Internetstring.get_res_next(path:string) : Internetstring;
  begin
     if not str.err then Self.str.val := Self.str.val + 'ccc';
     result := Self;
  end;

  function Internetstring.Clear : Internetstring;
  begin
    Self.str.err := false;
    Self.str.val := '';
    result := Self;
  end;

  function Internetstring.print: Boolean;
  begin
    result := print_maybe(Self.str);
  end;


end.
