# fluent_errors
Example of passing error condition in Fluent code.

An attempt at a simple example of passing a possible error condition in Fluent Code style, using a nullable (or pointed) type: `Maybe<T>`.

```Delphi
   var _is : Internetstring;

   if not _is.clear(Fail)
             .get_res_name('google.com')
             .get_res_type('source')
             .get_res_next('cdn')
             .print
   then  err('data 1 retrieval error');                //  aaa.bbb.ccc

   if not _is.clear(Fail)
             .get_res_name('apple.com')
             .get_res_type('')
             .get_res_next('cdn')
             .print
   then  err('data 2 retrieval error');                //  data 2 retrieval error

          _is.clear(Succeed)
             .get_res_name('hp.com')
             .get_res_type('')
             .get_res_next('cdn')
             .print;                                   // aaa.ccc
   ```
