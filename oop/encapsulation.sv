
   // public by default ,we can define or not no problem

   // local if we declared the local property and method ,we can't acess in the other classes  and extended classes also and module aslo

  // normal classes without the any encap by default public
  // can acces to the all other classes and extended classes and module also acess

    /// from all methods if i try to acess those it will through the compile time error

   // PROTECTED KEYWORD CAN DEFINE PROPERITES OR METHODS ,I CAN USE IN THE EXTENDED CLASS AND NOT IN THE MODULE

    class abc;

      int a=10;

     endclass

    class zzz extends abc;

         function void display();

                $display("a is value in extended class is %0d",a);
         endfunction
    endclass

     module tb;

        abc han;
        zzz han2 = new();

        initial
           begin
                han  = new();
        //      han2 = new();

                han.a = 100;
                han2.display();

                $display("a value is %0d",han.a);

         end
  endmodule

  // LOCAL KEYWORD CAN ONLY ACCESS TO THE THAT PARTICUALR CLASSES NOT TO EXTENDED CLS AND MODULE ASLO

/*  class abc;

        local int a;

     endclass


    class zzz extends abc;

         function void display();

        //      $display("a is value in extended class is %0d",a); // error i  am using exteneded classs ,in the exttend cls all properites and metods                  will inhertis but in the compile time only ,if i change in the runtime it won't reflect;
         endfunction
    endclass

     module tb;

        abc han;
        zzz han2;

        initial
           begin
                han  = new();
                han2 = new();

                han.a = 10;   // error because i am usign this outside the class
                han2.display();

                $display("a value is %0d",han.a);

         end
  endmodule */


 // local with method,i can assign
 /*  class abc;

        local int a;

        local function void display_local();
           $display("base with local");
              endfunction

     endclass


    class zzz extends abc;

      local function void display();

                display_local(); //i can't acess the local method in the extended class
        //      $display("a is value in extended class is %0d",a); // error i  am using exteneded classs
         endfunction
    endclass

     module tb;

        abc han;
        zzz han2;

        initial
           begin
                han  = new();
                han2 = new();

                han.a = 10;
                han.display();  // error because i am accessing in outside module

                $display("a value is %0d",han.a);

         end
  endmodule
*/

  // PROTECED CAN BE USED IN EXTENDED CLASSS BUT NOT IN THE MODULE

   /* class abc;

        protected int a;
     endclass


    class zzz extends abc;

         function void display();

        $display("a is value in extended class is %0d",a);
         endfunction
    endclass

     module tb;

        abc han;
        zzz han2;

        initial
           begin
                han  = new();
                han2 = new();

                han.a = 10;   // error because i am usign this outside the class
                han2.display();

                $display("a value is %0d",han.a);

         end
  endmodule  */

// PROTECTED WITH METHODS can't access in the module ,i can access in the extended classes

 /*   class abc;

        protected int a;

        protected function void display_proct_bc();
                $display("protected in display_base class");
        endfunction

     endclass


    class zzz extends abc;

        protected function void display();
                display_proct_bc();  // here i can call this;
                $display("protected in display from extended");
        endfunction
    endclass

     module tb;

        abc han;
        zzz han2;

        initial
           begin
                han  = new();
                han2 = new();

                han.a = 10;      // error because i am usign this outside the class
                han2.display(); //error because i am usign this outside the class


                $display("a value is %0d",han.a);

         end
  endmodule */



                                 
                                                   
