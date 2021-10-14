unit U_Maybe;

interface

type
  maybe<T> = record
      err  : boolean;
      val  : T;
  end;


function print_maybe(ms:maybe<string>):boolean;


implementation

  function print_maybe(ms:maybe<string>):boolean;
  begin
     result := not ms.err;
     if result then  begin writeln(ms.val); writeln; end;
  end;


end.



