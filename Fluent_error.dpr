program Fluent_error;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  U_InternetString in 'U_InternetString.pas';

begin
   var _is : Internetstring;

   if not _is.clear
             .get_res_name('google')
             .get_res_type('source')
             .get_res_next('cdn')
             .print
   then writeln('data 1 retrieval error');

   if not _is.clear
             .get_res_name('apple')
             .get_res_type('')
             .get_res_next('cdn')
             .print
   then writeln('data 2 retrieval error');

   readln;
end.


