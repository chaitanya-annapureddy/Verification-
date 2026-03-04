

module tb;
   int arr[10];
   int arr2;

   initial
         begin
                foreach(arr2[i])
         arr[i] = $random%10;

                        $display("arr is %0p",arr);
         end



 /*        initial
         begin
               arr = {1,2,3,4,5};
                                         {} if we use the {} we must provide the all the values ,it expects very values
                        $display("arr is %0p",arr);
         end  */

endmodule

~
~
~
~
~
~
~
