 /* class sem;

        task sem_prac(input string name);

            $display("displaying fisrt time from the sem %s",name);

        endtask


   endclass

    module tb;

        sem han;

          initial
                begin
                    han = new();
                   // $display("han is %0p",han.sem_prac());
             // end

         // initial
         //     begin
                  fork
                       han.sem_prac("first call");
                       han.sem_prac("second call");
                  join
                end
   endmodule */





   class sem;

        semaphore sem_han;

        task sem_prac(input string name);

            sem_han.get(1);
            $display("displaying fisrt time from the sem %s",name);
            sem_han.put(1);

              sem_han.put(1);

        endtask


   endclass

    module tb;

        sem han;

          initial
                begin
                    han = new(1);
                   // $display("han is %0p",han.sem_prac());
             // end

         // initial
         //     begin
                  fork
                       han.sem_prac("first call");
                       han.sem_prac("second call");
                  join
                end
   endmodule

"semaphore.sv" [readonly] 75L, 922C             
