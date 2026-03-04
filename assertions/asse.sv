
   /*   module tb;

                bit a,b,clock;

                property ppt;
                    @(posedge clock) $rose(a) |=> $fell(b);
                endproperty

                assert property (ppt);

                cover property (ppt);

        endmodule
    */




   module tb;
           bit a,b,c,d,clk;


           property ppt;
                 @(posedge clk) (a) |-> (first_match(b) ##0 (d==1)) or  (first_match(c) ##0 (c==1));
          endproperty

          assert property (ppt);

          cover property(ppt);

   endmodule

