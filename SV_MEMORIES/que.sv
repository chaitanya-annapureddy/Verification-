 /* module tb;
         int q[$] = '{1,2,3,4};
         int k;

          initial
                begin
                        foreach(q[i])
                        //for(int i=0;i<4;i++)
                         begin
                                k = q.pop_front();
                                $display("k is %d",k);

                         end
                        $display("q is %p",q);

                end
        endmodule */

   /*
        module tb;
                 int q[$] = {1,2,3};
                 int q2[$];

                 initial
                        begin
                                q = {};
                                $display("q is %P",q);
                                q = {1,2,3};
                                   $display("q is %P",q);
                                q2 = q[0:2];
                                 $display("q2 is %P",q2);

                        end
       endmodule */



        ///////////////////////// ARRAY SEARCHING METHODS ///////////////////////
        module tb;

                int dyn_arr[];
                int result;
                int q[$];

              
                initial
                        begin
                                dyn_arr = new[10];
                                 foreach(dyn_arr[i])
                                   begin
                                         dyn_arr[i] = i+1;
                                          $display("dyn_arr is  %p",dyn_arr);
                                   end

                                  //q  = dyn_arr.find with (item>4);
                                    q = dyn_arr.find_index with (item==0);
                                 $display("finding output is %P",q);
                        end

        endmodule


                                                                                 
