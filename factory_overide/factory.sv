//import uvm_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

/* new class also has to be extends from the old class and 
  to which class we have to overide that class need to create object
  and first overide then only we should create the object;
  for set_type/inst_override_by_name need factory.set_type/inst_override_by_name(); */

 class old_driver extends uvm_driver;
   `uvm_component_utils(old_driver)
    
     function new(string name="",uvm_component  parent);
        super.new(name,parent);
     endfunction

    task send_ol_drv();
        `uvm_info("from the old dirver","printing",UVM_LOW)
    endtask
     
 endclass

 class new_driver extends old_driver; //new dirver also shold extend from the old diver 
     `uvm_component_utils(new_driver)

      function new(string name="",uvm_component parent);
          super.new(name,parent);
      endfunction 

      task send_new_drv();
       
        `uvm_info("from new driver","from new printing",UVM_LOW)
      endtask

 endclass

 class env_v extends uvm_env;
   `uvm_component_utils(env_v)
  
    old_driver odl_dr_han[5];

    function new(string name="",uvm_component parent);
       super.new(name,parent);
    endfunction 

    function void build_phase (uvm_phase phase);
         super.build_phase(phase);
         
	 foreach(odl_dr_han[i])
         odl_dr_han[i] = old_driver::type_id::create($sformatf("odl_dr_han[%0d]*",i),this); //object should create for the only the orginal class
    endfunction 
 endclass

class test_t extends uvm_test;
  `uvm_component_utils(test_t)
    
     env_v env_han;
   
    function new(string name="",uvm_component parent);
      super.new(name,parent);
    endfunction 
 
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      //nv_han = env_v::type_id::create("env_han",this); first i should overide and then only the create the class

      //set_type_override_by_type(old_driver::get_type(),new_driver::get_type());

      //this.set_type_override_by_name("old_driver","new_driver"); // without the factory it will throw the error

    //factory.set_type_override_by_name("old_driver","new_driver");

     //  set_inst_override_by_type("env_han.odl_dr_han[3]*",old_driver::get_type(),new_driver::get_type());

    factory.set_inst_override_by_name("old_driver","new_driver","env_han.*");



      env_han = env_v::type_id::create("env_han",this);

    endfunction 

    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction 

endclass

module tb;
  
    `include "uvm_macros.svh"
    
    initial
        begin
             run_test("test_t");
        end

endmodule
