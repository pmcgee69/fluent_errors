unit U_Maybe;

interface

type
  TMaybe<T> = record
       err  : boolean;
       val  : T;
  end;

const
  fail_int : TMaybe<integer> = (err: True; val: -2);

function print_maybe(ms:TMaybe<string>):boolean;


implementation

  function print_maybe(ms:TMaybe<string>):boolean;
  begin
     result := not ms.err;
     if result then  begin writeln(ms.val); writeln; end;
  end;


end.



