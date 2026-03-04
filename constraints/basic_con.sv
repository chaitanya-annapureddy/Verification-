/*


        class abc;
          rand  bit[7:0] arr[];

        // constraint summ {arr.size inside {[5:10]};}
          constraint summ {arr.size == 5;}


         constraint summ_con {arr.sum with (int'(item))<1000;}
      endclass

         module tb;
            abc han;


                initial
                        begin
                                //abc han;
                                han = new();
                                repeat(10) begin
                                assert(han.randomize());
                                $display("inside the arr sum is %0p",han);
                                end
                        end
      endmodule
        */

   /*  class abc;
        rand bit[4:0] arr[4][4];

        constraint cond {foreach(arr[i,j])
                           {
                             if(i == j || i-j == (2||-2))
                                arr[i][j] % 2 != 0;
                             else
                                arr[i][j]%2 == 0;
                           }
                        }

      function void post_randomize();

          foreach(arr[i]) begin
                foreach(arr[i][j]) begin
                        $write(arr[i][j]," ");
                                $write(arr[i][j]," ");
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

  endmodule


 */

    class abc;
      rand bit [127:0]a;

       constraint chec{foreach(a[i])
                          if(i>0 && a[i] == 1)
                                a[i] == a[i-1];
                          else
                                a[i] == 0;
                        }

      function void post_randomize();
            $display("a is %0d",a);
      endfunction

 endclass
 module tb;
        abc han;

        initial
                begin
                        han = new();
                        assert(han.randomize());

                end

  endmodule


 */

 class abc;
      rand bit [127:0]a;

       constraint chec{foreach(a[i])
                          if(i>0 && a[i] == 1)
                                a[i] == a[i-1];
                          else
                                a[i] == 0;
                        }

      function void post_randomize();
            $display("a is %0d",a);
      endfunction

 endclass

module tb;
    abc han;
      initial
        begin
              han =  new();
             assert(han.randomize());
       end
endmodule

                                

