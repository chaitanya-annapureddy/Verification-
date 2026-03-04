
        class abc;

         int a;

         covergroup cg;
             cp1: coverpoint a {
                                bins b = {0,1};
                                bins c[] = default;}
         endgroup

        function new();
                cg= new();
        endfunction

        endclass

        module tb;
                abc han;

         initial
                begin

                        han = new();
                        //cg = new();

                        han.a = $urandom;
                        han.cg.sample();

                        $display("a is %d",han.a);
                end

      endmodule
~
~
