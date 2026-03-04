// PARAMTERS CAN CHANGE THE SIZE OR DATA TYPE

  // TWO TYPES OF PARAMTER
  // PARAMETERZEID BY VALUE  // FOR CHANGING THE VALUE
  // PARAMETERZIED BY TYPE;  // FOR CHANGING THE DATA TYPE

  // WHERE TO OVERRIDE AFTER WRITING CLASS WHILE CREATING THE OBJECT AND HANDLE,THERE I CAN CHANGE THE VALUE OR DATA TYPES

  // PARAMTER KEYWORD IS OPTIONAL IN THE CLASS HEADER  LIKE CLASS ABC #(PARAMTER SIZE == 8); OR CLASS ABC #(SIZE == 8);

        // Declare parameterized class
     /*   class <name_of_class> #(<parameters>);
         class Trans #(addr = 32);

         // Override class parameter
         <name_of_class>  #(<parameters>) <name_of_inst>;
          Trans #(.addr(16)) obj;
           OR
          TRANS #(16) OBJ;

        typedef something #(4) td_nibble;      // create an alias for a class with "size" = 4 as "nibble"
         td_nibble nibble;*/

  //$sbits will give the no of bits

        /*class abc #(parameter t=4);
          bit[t-1:0] a;
        endclass*/
/*
  class abc #(type T = int);
      T a;
  endclass

        module tb;
         // abc #(6) over_han;
          abc    han;  // size i am not changing  or data type also not changing
    //abc   #(string) han2;
    typedef abc #(string) han;
    han handle ;

          initial
                begin
                     han = new();
                    // over_han = new();
          han2 = new();
                    // han.a = 15;
                    // over_han.a = 32;
         handle = new();
        // han2.a = "huuuu";
         handle = "gufuff";
                     $display("a value is %0d",$bits(han.a));
                     $display("a value after changing the size is %0d",han2.a);
                 end
        endmodule */


   class abc #(size = 2,type T = bit);
      T [size-1:0] a;
  endclass

        module tb;
         // abc #(6) over_han;
          abc #(.size(4),.T(real))   han;  // size i am not changing  or data type also not changing
    //abc   #(string) han2;



          initial
                begin
                     han = new();

                         // over_han = new();
        //  han = new();
                    // han.a = 15;
                    // over_han.a = 32;
        /// han = new();
        // han2.a = "huuuu";
         han.a= "gufuff";
                     $display("a value is %0d",$bits(han.a));
                     $display("a value after changing the size is %0d",han.a);
                 end
        endmodule





                                     
                                     
