unit U_foo;

interface

type
  TFoo = class
    // Frob doubles x and returns the new x + 10
    function Frob(var x: Integer): Integer; virtual;
    function one                 : integer; virtual;
    class function two                 : integer; virtual;
  end;

procedure WorkingWithFoo(Foo:TFoo);


implementation

function TFoo.Frob(var x: Integer): Integer;
begin
  x := x * 2;
  Result := x + 10;
end;

function tfoo.one: Integer;  begin result := 1; end;
class function tfoo.two: Integer;  begin result := 2; end;

procedure WorkingWithFoo(Foo:TFoo);
var
  a, b: Integer;
begin
    a := 10;
    Writeln('  first : a = ', a);
    b := Foo.Frob(a);
    Writeln('  end   : a = ', a);
    Writeln('  result:   = ', b);
    foo.one;
    foo.two;
end;

end.
