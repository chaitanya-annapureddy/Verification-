module test;

  class packet;
    int size;

    // Constructor
    function new(int size);
      size = size;   // 'this' refers to class property
    endfunction

    // Method to display value
    function void display();
      $display("Packet size = %0d", this.size);
    endfunction
  endclass

  packet p;

  initial begin
    // Create object and pass argument
    p = new(128);

    // Display value
    p.display();
  end

endmodule
~
