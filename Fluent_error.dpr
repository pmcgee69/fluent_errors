program Fluent_error;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  U_InternetString in 'U_InternetString.pas',
  U_StringTransform in 'U_StringTransform.pas',
  U_Maybe in 'U_Maybe.pas',
  U_Common in 'U_Common.pas';

const     arr_size = 10000000;

type      arrT = array [1..arr_size] of Transformstring;
          arrI = array [1..arr_size] of TMaybe<integer>;

var       arr  : arrT;
          arr2 : arrI;

begin
   ReportMemoryLeaksOnShutdown := true;
   for var i := 1 to arr_size do
       begin arr [i] := Transformstring.Create;
             arr [i].clear(rand_str);
             arr2[i].val :=0;
             arr2[i].err := false;
       end;

   Timer( procedure begin  for var i := 1 to arr_size do
                               arr2[i] := arr[i].trunc(4).hextoint.int;   end );

   for var i := 1 to 15 do begin
       writeln(arr[i].sprint, '  ', arr2[i].val);
   end;

   Timer( procedure begin  for var i := 1 to arr_size do  arr[i].Free;    end );

   writeln('done.');
   readln;
end.



