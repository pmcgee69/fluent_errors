unit U_Intercept;

interface
uses rtti, U_StringTransform, System.SysUtils;

type
Cept = class
   class procedure Intercept_tstring<T:constructor,class>( p : TProc<T> );                         overload;
   class procedure Intercept_tstring<T:constructor,class>( p : TProc<T,integer>; foo:T; i : integer );     overload;
end;


implementation


class procedure Cept.Intercept_tstring<T>( p : TProc<T> );
var
  foo: T; //Transformstring;
  vmi: TVirtualMethodInterceptor;
begin
  vmi := nil;
  foo := T.create;  //Transformstring.Create;
  try
      Writeln('Before hackery:');
      p(Foo);

      vmi := TVirtualMethodInterceptor.Create(T);  //foo.ClassType);

      vmi.OnBefore := procedure(  Instance: TObject;          Method: TRttiMethod;
                                const Args: TArray<TValue>; out DoInvoke: Boolean;
                                                            out Result: TValue     )
                      var
                        i: Integer;
                      begin
                        Write('[before] Calling ', Method.Name, ' with args: ');
                        for i := 0 to Length(Args) - 1 do
                            Write(Args[i].ToString, ' ');
                        Writeln;
                      end;
      // Change foo's metaclass pointer to our new dynamically derived
      // and intercepted descendant
      vmi.Proxify(foo);
      writeln;
      Writeln('After interception:');
      p(Foo);
      writeln;
      writeln;
  finally
    foo.Free;
    vmi.Free;
  end;
end;



class procedure Cept.Intercept_tstring<T>( p : TProc<T,integer>; foo:T; i : integer );
var
  //foo: T; //Transformstring;
  vmi: TVirtualMethodInterceptor;
begin
  vmi := nil;
  //foo := T.create;  //Transformstring.Create;
  try
      //Writeln('Before hackery:');
      //p(Foo, i);

      vmi := TVirtualMethodInterceptor.Create(T);  //foo.ClassType);
(*
      vmi.OnBefore := procedure(  Instance: TObject;          Method: TRttiMethod;
                                const Args: TArray<TValue>; out DoInvoke: Boolean;
                                                            out Result: TValue     )
                      var
                        i: Integer;
                      begin
                        Write('[before] Calling ', Method.Name, ' with args: ');
                        for i := 0 to Length(Args) - 1 do
                            Write(Args[i].ToString, ' ');
                        Writeln;
                      end;
*)
      // Change foo's metaclass pointer to our new dynamically derived
      // and intercepted descendant
      vmi.Proxify(foo);
      //writeln;
      //Writeln('After interception:');
      p(Foo, i);
      //writeln;
      //writeln;
  finally
    //foo.Free;
    vmi.Free;
  end;
end;


(*
procedure Intercept_tstring( p : TProc );
var
  foo: Transformstring;
  vmi: TVirtualMethodInterceptor;
begin
  vmi := nil;
  foo := Transformstring.Create;
  try
      Writeln('Before hackery:');
      p;

      vmi := TVirtualMethodInterceptor.Create(foo.ClassType);

      vmi.OnBefore := procedure(  Instance: TObject;          Method: TRttiMethod;
                                const Args: TArray<TValue>; out DoInvoke: Boolean;
                                                            out Result: TValue     )
                      var
                        i: Integer;
                      begin
                        Write('[before] Calling ', Method.Name, ' with args: ');
                        for i := 0 to Length(Args) - 1 do
                            Write(Args[i].ToString, ' ');
                        Writeln;
                      end;
      // Change foo's metaclass pointer to our new dynamically derived
      // and intercepted descendant
      vmi.Proxify(foo);
      writeln;
      Writeln('After interception:');
      p;
      writeln;
      writeln;
  finally
    foo.Free;
    vmi.Free;
  end;
end;
*)


end.