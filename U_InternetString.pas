unit U_InternetString;

interface
uses U_Maybe;
(*
type
  TFailMode = (fail,succeed);

  Internetstring = record
     str      : maybe<string>;
     fail_mode: TFailMode;
     function   clear(fm:TFailMode)       : Internetstring;
     function   print                     : boolean;
     function   get_res_name(path:string) : Internetstring;
     function   get_res_type(path:string) : Internetstring;
     function   get_res_next(path:string) : Internetstring;
  end;

*)
implementation
(*
  function   Internetstring.get_res_name(path:string) : Internetstring;
  begin
     if not str.err then Self.str.val := Self.str.val + 'aaa.';
     result := Self;
  end;

  function   Internetstring.get_res_type(path:string) : Internetstring;
  begin
     if not str.err then
        case Self.fail_mode of
           Fail :
              if path=''  then Self.str.err := true
                          else Self.str.val := Self.str.val + 'bbb.';
           Succeed :
              if path<>'' then Self.str.val := Self.str.val + 'bbb.';
        end;
     result := Self;
  end;

  function   Internetstring.get_res_next(path:string) : Internetstring;
  begin
     if not str.err then Self.str.val := Self.str.val + 'ccc';
     result := Self;
  end;

  function Internetstring.Clear(fm:TFailMode) : Internetstring;
  begin
    Self.fail_mode := fm;
    Self.str.err   := false;
    Self.str.val   := '';
    result := Self;
  end;

  function Internetstring.print: Boolean;
  begin
    result := print_maybe(Self.str);
  end;
*)

end.


(*
   var _is : Internetstring;

   if not _is.clear(Fail)
             .get_res_name('google.com')
             .get_res_type('source')
             .get_res_next('cdn')
             .print
   then  err('data 1 retrieval error');

   if not _is.clear(Fail)
             .get_res_name('apple.com')
             .get_res_type('')
             .get_res_next('cdn')
             .print
   then  err('data 2 retrieval error');

          _is.clear(Succeed)
             .get_res_name('hp.com')
             .get_res_type('')
             .get_res_next('cdn')
             .print;

*)

