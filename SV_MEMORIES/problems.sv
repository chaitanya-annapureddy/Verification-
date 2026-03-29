
/*module sor();
int da[]={34,56,3,421,78};
int i,j;
initial
begin
da.sort();
$display("the sorted elements are %p",da);
for (i=0;i<$size(da);i++)begin
for(j=1;j<$size(da);j++)begin
if(da[i]>da[j])
da[i]=da[j];
end
end
$display("the elements without array methods are %p",da[i]);
end
endmodule */


    /*  module tb;
                int q[$:2] = {55,44,33};

       initial
         begin
                $display("/////////////////////////////////");

                //foreach(q[i])
                 for(int i=0;i<3;i++)
                  begin
                       $display("1111111111111111111111111111111");
                //      q[i] = i;
                        q.sort();
                        $display("q is %p",q);
                  end

         end
        endmodule
*/


     module tb;
           int q[$] = {1,2,3};
           int q2[$] = {4,5,6};
            int result;
        /*initial

            q = {q,q2}; */
        initial
                $display("q is %p",q);


        initial
                begin
                    // for(int i=0;i<3;i++)
                        foreach(q[i])
                        begin
                              //  q.push_front(q2[i]);
                                  q.pop_back(q2[i]);
                                $display("q is %p",q);

                        end

                end
   endmodule
        /*      initial
                begin
                     for(int i=2;i<5;i++)
                        begin
                                result = q2.pop_front();
                                q.insert(i,result);
                                $display("q is %p",q);

                        end

                end
       */
/*
module tb;

         int arr[$] = '{1,0,2,3,0,4,0};
         int q[$];
         int result[$];
          initial
        begin
         for(int i=0;i<7;i++)
          begin
                if(arr[i]!=0)
                 begin
                          //result = arr.pop_front();
                          q.push_front(arr[i]);
                 end

                else

                         result.push_front(arr[i]);


          end

             q = {q,result};

                    $display("q is %p",q);

     end


 endmodule
*/
/*
  module tb;

        int dyn_arr[] = {1,2,3,0,5,0,6,0,8};
         int result[];
         int zeroes[];

     initial
     begin


         result = dyn_arr.find with (item != 0);
         zeroes= dyn_arr.find() with (item == 0);


         dyn_arr =  {result,zeroes};
         $display("result is %0p",dyn_arr);

   enfirstd

    /*  foreach(dyn_arr[i])
          begin

          end *//*
  endmodule*/

/*
module top;
        int da[];
        initial
                begin
                da=new[20];
                foreach(da[i])
                        da[i] = ((i/5)+1) *5;
                $display("the array elements are %p",da);
                end
endmodule
        */



                                     

