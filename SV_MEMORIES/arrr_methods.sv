/////////////////////////////////////////////////////////////////////////
// product.method() it will product all the elements in the array
// sum.method() it will sum the all the elements
// and.method   it will perform the bitwise and operation
// or.method    it will perfrom the bitwise or operation
// xor.method   it will perform the bitwise xor operation





/////////////////////////////////////////////////////////////////////////////////////
        // item > 40 this is boolean exp so it will return only the 0 or 1  ,it will iterate through all the elements and sum
      //dyn_arr.sum() with (int'(item>40));  it will check this item with respect to the condition given and it will convert into the int type, it will
                                        // add those values if true 1 again ture 1 and 1 + 1 = 2

        // if i want only the particualr items greater than to be added then i have to use ternary operator
        // dyn_arr.sum() with (int'(item>40) ? item : 0);


  // the sum will iterate through the all the items in the array ,and it will check the condition it will those items


///////////////////////////////////////////////////////////////////////////////////////////////
// the problem with only the array reduction methods
// all other will work fine array loactor,array ordering methods


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



        module tb;

           int  dyn_arr[];
           int result;
           int  que[$];


           initial
                  begin
                        dyn_arr = new[10];
                        foreach(dyn_arr[i]) begin
                                dyn_arr[i] = $urandom_range(20,50);
                         end
                        $display("dyn_arr inside %0p",dyn_arr);
                 end
            initial
                begin
                       result = dyn_arr.sum();
                       $display("result is after sum is %0d",result);


                       result = dyn_arr.sum() with (item>40);
                         $display("result is after sum with item greater than 40  is %0d",result);

                        result = dyn_arr.sum() with (int'(item>40));
                         $display("result is after sum with item greater than 40 with int   is %0d",result);


                        result = dyn_arr.sum() with (int'(item>40) ? item:0);
                         $display("result is after sum with item greater than 40 with int   is %0d",result);


            //   result = data_da.sum with (int'((item==8)||(item==7))?item:0);




                        result = dyn_arr.product();
                         $display("result of product is %0d",result);


                         result = dyn_arr.product() with (int'(item > 40));   // it wil check boolean exp it will product those numbers
                          $display("product of some particular numbers is %0d",result);

                         result = dyn_arr.product() with (int'(item > 40) ? item : 1);
                           $display("product of only the particualr numbers is %0d",result);


                        result = dyn_arr.and();
                          $display("and after method is %0d",result);


                        // ordering methods  it won't return anything it will return in the array itself

                          $display("dyn_arr inside %0p",dyn_arr);

                          dyn_arr.sort();
                          $display("dyn_arr after sorting %0p",dyn_arr);

                          dyn_arr.rsort();
                          $display("dyn_arr after rsort descending order is %0p",dyn_arr);

                          dyn_arr.reverse();
                          $display("dyn_arr after reverse is %0p",dyn_arr);

                         dyn_arr.shuffle();
                          $display("dyn_arr after shuffle is %0p",dyn_arr);

  // ARRAY LOCATOR METHODS FOR WITH CALUSE IS MANDATORY FOR SOME METHODS ie for starting with "F" no need the int casting
                        // array locator method it will retrun in the unpacked type ,so it will return in the queue format to store that it
                        // need the result to be in queue format
                        // it will return only the "f" only one elements based on the condition

                          que = dyn_arr.find() with (item>5);

                          // dyn arr is unsigned and que is signed when u are assinging it should be both signed or unsigned otherwise error

                          $display("after finding items greater than 5 is %0p",que);

                          que =  dyn_arr.find_first with (item<40);   // nothing is there item less than 5 so it won't return anything then que is empty
                           $display("after finding find first than 5 is %0p",que);


                        que = dyn_arr.find_first_index with (item>46);
                        $display("find fisrt index after que is %0p",que);

                //      $display("find fisrt index after que is %0p",dyn_arr.find_first_index with (item>46);

                        que = dyn_arr.min();
                        $display("que is %0p",que);

                //// "for min and max unique and unique_index for u can print display ,no need to store it  check this return,and what to keep in the display methods"
                        //      que = dyn_arr.min();

                          que = dyn_arr.min() with (item < 30);

                        $display("min valuue with caluse is %0p",que);

                        $display("minimum value  is %0p",dyn_arr.min());

                        $display("minimum value  is %0p",dyn_arr.max());

                        $display("minimum value  is %0p",dyn_arr.unique());
                      $display("minimum value  is %0p",dyn_arr.unique_index());



















                end

        endmodule

                                                              133,0-1       80%

                                                              97,1-8        51%
                          
"arr_methods.sv" [readonly] 163L, 4943C                             
