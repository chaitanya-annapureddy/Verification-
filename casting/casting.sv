class casting;
   int a=10;
   real b=5.5;

   int result;
   real res;

 /*//result = real'(a-b); like this statements in the class aren't execuatble can't  be writen this one class contain only the functions,tasks,variables,constraits,typdef,struct ,it can't procedural code

//result = real'(a-b) when u wanna store in type of the int but u are converting into the real but not storing in the form of the real then it is no error comes  */


  function new();
    res = int'(a-b);
  endfunction

endclass

 module tb;

  casting han;

    initial
           begin
                 han=new();
                 $display("casting after the result is %d",han.res);
           end
endmodule
~
~
~
