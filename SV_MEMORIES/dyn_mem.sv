  module tb;
           int da1[],da2[];

           initial
                begin
                       da2=new[10];
                //      da1=new[10];
                        foreach(da1[i])
                         begin
                                da1[i] =i;
                        ///     da2[i] =da1[i];

                           //    da2[i]=i;
                         end
                                da2 = da1;

                        $display("da1 is %p,da2 is %p",da1,da2);
                end
        endmodule
~
