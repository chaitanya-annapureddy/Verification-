class wr_drv extends uvm_driver;
   `uvm_component_utils(wr_drv)
 
   function new(string name= "wr_drv",uvm_component parent=null);
       super.new(name,parent);
   endfunction 
 
endclass
