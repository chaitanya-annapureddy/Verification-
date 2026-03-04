/*
   1 1 1
   1 0 1
   1 1 1
          */


class basic_matrix;

    rand bit a[3][3];

    //constraint a_size {a.size() inside [3,4];}
    constraint con1 {foreach(a[i,j]) {
                      if(i==1 && j==1)
                          a[i][j] == 0;
                      else
                          a[i][j] == 1;
                        }
                    }

    function void post_randomize();

        // foreach(a[i]) begin
          foreach(a[i,j])      //here we have to use the two loops  //foreach(a[i][j]) directly without the first row loop it will through a error like i is not defined
                                // if foreach(a[i,j]) this works but the output is everything is one line
         begin
           //$write(i,j," "); //a[i,j] i have to write here
            $write(a[i][j]," ");
         end

        $display("");
     //  end
    endfunction

endclass

module tb;
  basic_matrix han;

   initial begin

            han = new();
            assert(han.randomize);
                     assert(han.randomize);
   end

endmodule



// 4 * 4 matrix check the 2*2 how many check and only one 2*2 matrix can contain only the 1

/*
 class abc;
   rand int a [4][4];

   constraint con1 {foreach(a[i,k]) {

                          if(i == 1 && (k == 0 || k == 2))
                                 a[i][k] == 1;
                          else if(i == 3 && (k == 1 ||  k == 3))
                                 a[i][k] == 1;
                          /*else
                                 a[i][k] == 0;

                    }
              }

    function void post_randomize();

      foreach(a[i]) begin
       foreach(a[i][k]) begin
            $write(a[i][k]," ");
       end
           $display(" ");
      end
    endfunction

endclass

 module tb;

   abc han;

    initial
    
          begin
                han = new();
                assert(han.randomize());
          end

endmodule */





  // row 0 and 2 are should be same in the matrix
/*
   class abc;
          rand bit[2:0] a[][];

          constraint siz {a.size[i][j] == 3,4;}

          constraint loop {foreach(a[i][j])
                            {
                              if(a[i][0] &&  a[i][2])
                                  a[i][0] == a[i][2];
                            else
                                 a[i][j];
                           }
        function void post_randomize();

                foreach(a[i][j])
                 begin
                        $write(a[i][j]," ");
                 end
                     $display(" ");

        endfunction
endclass




module tb;

     abc han;

      initial
             initial
                begin
                        han = new();
                        assert(han.randomize());

                end

endmodule */

