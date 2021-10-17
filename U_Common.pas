unit U_Common;

interface
uses      U_Maybe, System.SysUtils;

procedure err(s:string);
function  rand_str:ansistring;
function  hextomaybeint(s:ansistring) : TMaybe<integer>;
procedure Timer( p : TProc);

implementation
uses
  System.Diagnostics;


procedure err(s:string);   begin  writeln(#10+#13+s+#10+#13);  end;


function  rand_str:ansistring;
begin
   var s:ansistring :='';
   for var i:=1 to 8 do begin
       var c:= Random(20);
       case c of
             0.. 9 : s := s + ansichar(c+48);  //  '0'..'9'
            10..19 : s := s + ansichar(c+55);  //  'A'..'J'
       end;
   end;
   result := s;
end;

function hextomaybeint(s:ansistring) : TMaybe<integer>;
var    i : TMaybe<integer>;
begin
       var l := length(s);
       var p := 1;
       i.err := false;
       i.val := 0;
       while (not i.err) and (p<=l) do begin
           var  ch := s[p];
           case ch of
                '0'..'9' :  i.val := i.val*16 + ord(ch)-ord('0');
                'A'..'F' :  i.val := i.val*16 + ord(ch)-ord('A') + 10;
                'G'..'J' :  begin i.err := true;
                                  i.val := 0;
                            end;
           end;
           inc(p);
       end;
       result := i;
end;

procedure Timer( p : TProc);
begin
   var Tm := TStopwatch.Create;
   Tm.Start;
   p;
   Tm.Stop;
   err( 'ms : ' + Tm.ElapsedMilliseconds.ToString );
end;


end.
