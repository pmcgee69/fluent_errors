# fluent_errors
Example of passing error condition in Fluent code.

An attempt at a simple example of passing a possible error condition in Fluent Code style, using a nullable (or pointed) type: `Maybe<T>`.

```
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
   ```
