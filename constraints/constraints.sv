
              //CONSTRAINTS PROBLEMS

//0101010101
/*
class con;

   rand bit a[];  /// bit if u don't declare the dim's it can take only 1 or 0 can't take the 12etc

   constraint con1 {a.size == 10;}
   constraint con2 {foreach(a[i])
                        if(i%2 == 0)
                          a[i] == 0;
                        else
                          a[i] == 1 ;}

  endclass

  module top;
    con han;

        initial
                begin
                      han = new();
                      assert(han.randomize());
                      $display(" a is %p",han.a);

                end
  endmodule
 */

//mirror pattern
   class mirror_pattern;
      rand bit[2:0] a[];
        int sz;
    /*// constraint aaaa {a.size inside {[5:9]};}
     constraint LOOP {foreach(a[i])
                      // int sz = $size(a); // u can't declare inside loop
                       if(i >=$size(a)/2)
                         a[i] == a[$size(a) - 1 -i]    all comments lines may give the floating number chance of getting 5 and 5 / 2 = 2.5 may lead to error 2.5 to 3 by int casting implictly
                       ;}*/


         constraint LOOP {foreach(a[i]) {
                sz == $size(a);
                        if(i >= sz)
                        a[i] == a[sz -1-i];
                        }
                        }
  endclass


  module top;
   mirror_pattern han;
    initial
      begin

              han = new();
              repeat(4)
              assert(han.randomize());
              $display("a is %p",han.a);
       end
 endmodule





/*
class abc;

    rand int a[];
   //f i declare bit as a datatype for rand variable i am getting error because of the bit is a it can accept the 0 or 1 by default u cannot //re size to it to slove this bit[2:0] or declare it as a int by default size is 32 bit



        constraint con1 {a.size() == 10;}
        constraint con2  {foreach(a[i])
                           if(i<5)
                                a[i] == i+1;
                           else
                                a[i] == 10-i;}

        function void pre_randmonize();
                    a[0] = 1;
        endfunction

        function void post_randmonize();

                $display("a is %p",a);
        endfunction
endclass

module top;
   abc han;

        initial
                begin
                     han= new();
                     assert(han.randomize());
                end


endmodule*/

/* class con;

   int matrix[3][3];

   constraint ab {foreach (matrix[i ,j]) {
                   matrix[i][j] == 1
                                         }
                 ;}
 endclass

        module top;

          con han;

         initial
            begin
              han = new();
              assert(han.randomize());
              foreach(han.matrix[i,j])
              // $display("matrix[%0d][%0d]",i,j,han.matrix[i][j]);
                $write("%d",han.matrix[i][j]);
                $display("");
         end
        endmodule


// Filename: constrained_array_test.sv

class my_class;
  rand bit [7:0] a[];  // Random dynamic array of 8-bit values

  // Constraint on size of array
  constraint con1 {
    a.size inside {[9:15]};
  }

  // Value constraints on specific indices
  constraint con2 {
    foreach (a[i]) {
      if (i == 0 || i == 5)
        a[i] == 9;
      else if (i == 2 || i == 7)
        a[i] == 7;
      else if (i == 4 || i == 9)
        a[i] == 5;
      else if (i == 6)
        a[i] % 3 == 0 && a[i] != 6;
      else if (i == 1)
        a[i] == 13;
      else if (i == 3)
        a[i] == 11;
    }
  }

endclass
  module top;

          con han;

         initial
            begin
              han = new();
              assert(han.randomize());
              foreach(han.matrix[i,j])
              // $display("matrix[%0d][%0d]",i,j,han.matrix[i][j]);
                $write("%d",han.matrix[i][j]);
                $display("");
         end
        endmodule


class my_class;
  rand bit [7:0] a[];  // Random dynamic array of 8-bit values

  // Constraint on size of array
  constraint con1 {
    a.size inside {[9:15]};
  }

  // Value constraints on specific indices
  constraint con2 {
    foreach (a[i]) {
      if (i == 0 || i == 5)
        a[i] == 9;
      else if (i == 2 || i == 7)
        a[i] == 7;
      else if (i == 4 || i == 9)
        a[i] == 5;
      else if (i == 6)
        a[i] % 3 == 0 && a[i] != 6;
      else if (i == 1)
        a[i] == 13;
      else if (i == 3)
        a[i] == 11;
    }
  }

endclass

// Testbench
module tb;

  initial begin
    my_class obj = new();

    // Randomize the object
    if (!obj.randomize())
      $display("Randomization failed!");
    else begin
      $display("Randomized array size = %0d", obj.a.size());
      foreach (obj.a[i])
        $display("a[%0d] = %0d", i, obj.a[i]);
    end
  end

endmodule*/


-- VISUAL LINE --                                                                                                                          211       211,2-16      Bot
