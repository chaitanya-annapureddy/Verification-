/*
module tb;

//typedef xyz;
//or
typedef class xyz;


class abc;
    xyz vvar;
endclass

class xyz;
     abc var2;
endclass

endmodule */


//typedef for casting
/*
module tb;

        logic [1:0]a;

        int c;

            initial begin

                        a = 2'b11;

                        c = int'(a);

                        $display("c is %0d",c);
            end



endmodule

*/

interface bit_check;

  bit a;
  bit b;

  modport dut (input a,output b);

  modport tb (output b,input a);


endinterface


module rtl_bit(bit_check inf_inst);

    //bit a ;

   // assign inf_inst.b = 1;

    always @(*)
     begin
          inf_inst.b =  0;

     end

endmodule


module tb;


    // crete the interface object

      bit_check ins();

    // instataion along with the modport connection passing here

     // here the instance name will use across the tb;

      rtl_bit duv (ins.dut);

  
      //inf.TB.en = 1;  interface .dot with the modport. signal
       // modport is the optional



      initial
         begin
                $display(" b is %0d",ins.b);

         end

  initial
    begin

        #10000 $finish;

    end




endmodule
           
                                
