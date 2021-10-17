program Fluent_error;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  rtti,
  U_StringTransform in 'U_StringTransform.pas',
  U_Maybe in 'U_Maybe.pas',
  U_Common in 'U_Common.pas';

const     arr_size = 1000000;

type      arrT = array [1..arr_size] of Transformstring;
          arrI = array [1..arr_size] of TMaybe<integer>;

var       arr  : arrT;
          arr2 : arrI;
          X    : Transformstring;

begin
   //ReportMemoryLeaksOnShutdown := true;

   for var i := 1 to arr_size do
       begin arr [i] := Transformstring.Create;
             arr [i].clear(rand_str);
             arr2[i].val :=0;
             arr2[i].err := false;
       end;

   Timer( procedure begin  for var i := 1 to arr_size do
                               arr2[i] := arr[i].trunc(4).hextoint.int;   end );

   //for var i := 1 to 15 do begin  writeln(arr[i].sprint, '  ', arr2[i].val);   end;
   writeln('-');

   var vmi := TVirtualMethodInterceptor.Create(Transformstring);
   (*
   vmi.OnBefore := procedure(  Instance  : TObject;        Method: TRttiMethod;
                               const Args: TArray<TValue>; out DoInvoke: Boolean;  out Result: TValue     )
                      begin
                        //Write('[before] ', Method.Name,'  ');
                      end;
   *)
   Timer( procedure
          begin  for var i := 1 to arr_size do  begin   //
                        vmi.Proxify( arr[i] );
                        arr2[i] := arr[i].trunc(4).hextoint.int;
                    end;
          end );
   vmi.Free;
   writeln('-');

   Timer( procedure begin  for var i := 1 to arr_size do  arr[i].Free;    end );
   writeln('done.');
   readln;
end.



