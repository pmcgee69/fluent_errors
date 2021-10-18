program Fluent_error;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,   rtti, U_StringTransform in 'U_StringTransform.pas', U_Maybe in 'U_Maybe.pas', U_Common in 'U_Common.pas';

const     arr_size = 100000;

type      arrT = array [1..arr_size] of Transformstring;
          arrI = array [1..arr_size] of TMaybe<integer>;

          Tvmi = array [1..arr_size] of TVirtualMethodInterceptor;

var       arr  : arrT;
          arr2 : arrI;

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
   (*
   vmi.OnBefore := procedure(  Instance  : TObject;        Method: TRttiMethod;
                               const Args: TArray<TValue>; out DoInvoke: Boolean;  out Result: TValue     )
                      begin
                        //Write('[before] ', Method.Name,'  ');
                        {if Transformstring(Instance).str.err then
                              write(' err  ');
                   }  end;
   *)
   (*
   var vmi : Tvmi;
   Timer( procedure
          begin  for var i := 1 to arr_size do  begin
                     vmi[i] := TVirtualMethodInterceptor.Create(Transformstring);
                     //vmi[i].Proxify( arr[i] )
                     end;
          end );
   writeln('prepped');
   *)
   Timer( procedure
          begin  for var i := 1 to arr_size do  begin
                         vmi.Proxify( arr[i] );
                         arr2[i] := arr[i].trunc(4).hextoint.int;
                 end;
          end );
   vmi.Free;
   quickcheck(arr, arr2);   writeln('-');
readln;
   //Timer( procedure begin  for var i := 1 to arr_size do  vmi[i].free;    end );
   Timer( procedure begin  for var i := 1 to arr_size do  arr[i].Free;    end );
   writeln('done.');
   readln;
end.



