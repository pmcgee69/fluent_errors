program Fluent_error;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  U_InternetString in 'U_InternetString.pas';

  procedure err(s:string);   begin  writeln(s+#10+#13);  end;

begin
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

   readln;
end.


