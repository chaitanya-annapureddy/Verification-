      module log(logic a,logic b);

        //      assign b = a + 1 ;

                always @(*)
                  begin
                        b = a + 1;
                  end

                //      initial
                // begin
                //      a = 1;

        //      $display("b is %0d",b);
                //end

        endmodule


       module tb;

      logic a ,b;

        log duv (a,b);

                initial
                 begin
                        a = 1;
                        #5;

                $display("b is %0d",b);
                end

   endmodule

