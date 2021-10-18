program Fluent_error;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,   rtti, U_StringTransform in 'U_StringTransform.pas', U_Maybe in 'U_Maybe.pas', U_Common in 'U_Common.pas';

const     arr_size = 1000;

type      arrT = array [1..arr_size] of Transformstring;
          arrI = array [1..arr_size] of TMaybe<integer>;

var       arr  : arrT;
          arr2 : arrI;
          X    : Transformstring;
begin
   //ReportMemoryLeaksOnShutdown := true;
   for var i := 1 to arr_size do  arr [i] := Transformstring.Create;
   cleararray(arr, arr2, arr_size);
   quickcheck(arr, arr2);

   Timer( procedure begin  for var i := 1 to arr_size do begin
                               try
                                 arr2[i] := arr[i].trunc(4).hextoint.int;
                               except
                                 arr2[i] := fail_int;
                               end;
                           end;
                    end );

   quickcheck(arr, arr2);   writeln('-');   cleararray(arr, arr2, arr_size);
   quickcheck(arr, arr2);

   var vmi := TVirtualMethodInterceptor.Create(Transformstring);
   X := Transformstring.Create;
   vmi.Proxify( X );

   (**)
   vmi.OnBefore := procedure(  Instance  : TObject;        Method: TRttiMethod;
                               const Args: TArray<TValue>; out DoInvoke: Boolean;  out Result: TValue     )
                      begin
                        Write('[before] ', Method.Name,'  ');
                        //if Transformstring(Instance).str.err then
                              //write(' err  ');
                      end;
   (**)
   Timer( procedure
          begin  for var i := 1 to arr_size do  begin
                         //X := arr[i];
                         //arr2[i] := X.trunc(4).hextoint.int;
   var vmi := TVirtualMethodInterceptor.Create(Transformstring);
                         vmi.Proxify( arr[i] );
                         arr2[i] := arr[i].trunc(4).hextoint.int;
   vmi.Free;
                 end;
          end );
   //vmi.Free;
   quickcheck(arr, arr2);   writeln('-');

   Timer( procedure begin  for var i := 1 to arr_size do  arr[i].Free;    end );
   writeln('done.');
   readln;
end.



