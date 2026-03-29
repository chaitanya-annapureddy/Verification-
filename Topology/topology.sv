import uvm_pkg::*;
`include "uvm_macros.svh"

class config_1 extends uvm_object;
 `uvm_object_utils(config_1)

  uvm_active_passive_enum is_active;

 function new(string name = "config_1");
   super.new(name);
 endfunction
endclass

class config_2 extends uvm_object;
`uvm_object_utils(config_2)

  uvm_active_passive_enum is_active;

 function new(string name = "config_2");
   super.new(name);
 endfunction
endclass

class config_3 extends uvm_object;
`uvm_object_utils(config_3)

  uvm_active_passive_enum is_active;

 function new(string name = "config_3");
   super.new(name);
 endfunction
endclass


class env_config extends uvm_object;
`uvm_object_utils(env_config)

  config_1 config_h1[];
  config_2 config_h2[];
  config_3 config_h3[];
  uvm_active_passive_enum is_active = UVM_PASSIVE;
    int  no_of_config_1;
     int    no_of_config_2;
     int no_of_config_3;

 function new(string name = "env_config");
   super.new(name);
endfunction
endclass


class env_config extends uvm_object;
`uvm_object_utils(env_config)

  config_1 config_h1[];
  config_2 config_h2[];
  config_3 config_h3[];
  uvm_active_passive_enum is_active = UVM_PASSIVE;
    int  no_of_config_1;
     int    no_of_config_2;
     int no_of_config_3;

 function new(string name = "env_config");
   super.new(name);
 endfunction
endclass

 class wr_sqr extends uvm_sequencer;
   `uvm_component_utils(wr_sqr)

  function new(string name = "wr_sqr",uvm_component parent);
   super.new(name,parent);
 endfunction
 endclass

class wr_mon extends uvm_monitor;
   `uvm_component_utils(wr_mon)

  function new(string name = "wr_mon",uvm_component parent);
   super.new(name,parent);
 endfunction

 endclass

class wr_drv extends uvm_driver;
   `uvm_component_utils(wr_drv)
   function new(string name = "wr_drv",uvm_component parent);
   super.new(name,parent);
 endfunction

 endclass

class agt_1 extends uvm_agent;
   `uvm_component_utils(agt_1)
config_1 config_h1;
   wr_mon mon_h;
  wr_drv   drv_h;
  wr_sqr   sqr_h;

  function new(string name = "agt_1",uvm_component parent);
   super.new(name,parent);
 endfunction
 function void build_phase(uvm_phase phase);
   super.build_phase(phase);
  if(!uvm_config_db #(config_1)::get(this,"","config_1",config_h1))
  `uvm_info(get_full_name(),"ag1 is faling",UVM_LOW)

   mon_h = wr_mon::type_id::create("mon_h",this);

   if(config_h1.is_active) begin
   drv_h = wr_drv::type_id::create("drv_h",this);
   sqr_h = wr_sqr ::type_id::create("sqr_h",this);
  end
  endfunction
  endclass

  class agt_2 extends uvm_agent;
   `uvm_component_utils(agt_2)
   config_2 config_h2;
   wr_mon mon_h;
  wr_drv   drv_h;
  wr_sqr   sqr_h;

  function new(string name = "agt_2",uvm_component parent);
   super.new(name,parent);
 endfunction
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(config_2)::get(this,"","config_2",config_h2))
  `uvm_info(get_full_name(),"ag2 is faling",UVM_LOW)

   mon_h = wr_mon::type_id::create("mon_h",this);

   if(config_h2.is_active) begin
   drv_h = wr_drv::type_id::create("drv_h",this);
   sqr_h = wr_sqr ::type_id::create("sqr_h",this);
  end
endfunction
  endclass


  class agt_3 extends uvm_agent;
   `uvm_component_utils(agt_3)
   config_3 config_h3;
   wr_mon mon_h;
  wr_drv   drv_h;
  wr_sqr   sqr_h;

 function new(string name = "agt_3",uvm_component parent);
   super.new(name,parent);
 endfunction
 function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   if(!uvm_config_db #(config_3)::get(this,"","config_3",config_h3))
   `uvm_info(get_full_name(),"ag3 is faling",UVM_LOW)

   mon_h = wr_mon::type_id::create("mon_h",this);

   if(config_h3.is_active)begin
   drv_h = wr_drv::type_id::create("drv_h",this);
   sqr_h = wr_sqr ::type_id::create("sqr_h",this);
   end
endfunction
  endclass

  class env_agt extends uvm_agent;
   `uvm_component_utils(env_agt)
   env_config env_cfg_h;
   wr_mon mon_h;
  wr_drv   drv_h;
  wr_sqr   sqr_h;

  function new(string name = "env_agt",uvm_component parent);
   super.new(name,parent);
 endfunction
   function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   uvm_config_db #(env_config)::get(this,"","env_config",env_cfg_h);

   mon_h = wr_mon::type_id::create("mon_h",this);

   if(env_cfg_h.is_active) begin
   drv_h = wr_drv::type_id::create("drv_h",this);
   sqr_h = wr_sqr::type_id::create("sqr_h",this);
   end
   endfunction

  endclass

   class agt_top_1 extends uvm_env;
     `uvm_component_utils(agt_top_1)
        agt_1  agtop_h[];
 env_config env_cfg_h;

  function new(string name = "agt_top_1",uvm_component parent);
   super.new(name,parent);
 endfunction

   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   uvm_config_db #(env_config)::get(this,"","env_config",env_cfg_h);
       agtop_h=new[env_cfg_h.no_of_config_1];
   foreach(agtop_h[i])
   begin
   agtop_h[i]= agt_1::type_id::create($sformatf("agtop_h[%0d]",i),this);
 uvm_config_db #(config_1)::set(this,$sformatf("agtop_h[%0d]",i),"config_1",env_cfg_h.config_h1[i]);
  end

      endfunction

   endclass


  class agt_top_2 extends uvm_env;
   `uvm_component_utils(agt_top_2)
        agt_2  agtop_h[];
    env_config env_cfg_h;

  function new(string name = "agt_top_2",uvm_component parent);
   super.new(name,parent);
 endfunction

   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db #(env_config)::get(this,"","env_config",env_cfg_h);
   agtop_h = new[env_cfg_h.no_of_config_2];
   foreach(agtop_h[i])
   begin
   agtop_h[i]= agt_2::type_id::create($sformatf("agtop_h[%0d]",i),this);
 uvm_config_db #(config_2)::set(this,$sformatf("agtop_h[%0d]",i),"config_2",env_cfg_h.config_h2[i]);
  end
   endfunction

   endclass

   class agt_top_3 extends uvm_env;
   `uvm_component_utils(agt_top_3)
        agt_3  agtop_h[];
    env_config env_cfg_h;
  function new(string name = "agt_top_3",uvm_component parent);
   super.new(name,parent);
 endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   uvm_config_db #(env_config)::get(this,"","env_config",env_cfg_h);
   agtop_h = new[env_cfg_h.no_of_config_3];
   foreach(agtop_h[i])
   begin
   agtop_h[i]= agt_3::type_id::create($sformatf("agtop_h[%0d]",i),this);
 uvm_config_db #(config_3)::set(this,$sformatf("agtop_h[%0d]",i),"config_3",env_cfg_h.config_h3[i]);
  end
   endfunction

   endclass


  class eenv extends uvm_env;
   `uvm_component_utils(eenv)

   agt_top_1  agttop_h1;
   agt_top_2  agttop_h2;
   agt_top_3  agttop_h3;
   env_agt     env_agth;
   env_config env_cfg_h;

  function new(string name = "eenv",uvm_component parent);
   super.new(name,parent);
 endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
  uvm_config_db #(env_config)::get(this,"","env_config",env_cfg_h);
   env_agth= env_agt::type_id::create("env_agth",this);
    agttop_h1= agt_top_1::type_id::create("agttop_h1",this);
   agttop_h2 = agt_top_2::type_id::create("agttop_h2",this);
    agttop_h3 = agt_top_3::type_id::create("agttop_h3",this);
   endfunction

   endclass

   class ttest extends uvm_test;
     `uvm_component_utils(ttest)

    eenv env_h;
    env_config env_cfg_h;
     int no_of_config_1 = 3;
     int no_of_config_2 = 4;
     int no_of_config_3 = 2;

  function new(string name = "ttest",uvm_component parent);
   super.new(name,parent);
 endfunction
   function void cconfig();
     config_1  cfg_h1[];
     config_2  cfg_h2[];
     config_3  cfg_h3[];



     cfg_h1= new[no_of_config_1];

     foreach(cfg_h1[i])
      begin
           cfg_h1[i]=config_1::type_id::create($sformatf("cfg_h1[%0d]",i));
           case(i)
           0 , 2 : cfg_h1[i].is_active = UVM_ACTIVE;
                1 : cfg_h1[i].is_active = UVM_PASSIVE;
            endcase
                   env_cfg_h.config_h1[i]= cfg_h1[i];
      end

       cfg_h2 = new[no_of_config_2];
     foreach(cfg_h2[i])
      begin

           cfg_h2[i]=config_2::type_id::create($sformatf("cfg_h2[%0d]",i));
                case(i)
             0 , 2 : cfg_h2[i].is_active = UVM_ACTIVE;
                     1,3 : cfg_h2[i].is_active = UVM_PASSIVE;
                 endcase
                env_cfg_h.config_h2[i]= cfg_h2[i];
                end

        cfg_h3 = new[no_of_config_3];

       foreach(cfg_h3[i])
      begin
                cfg_h3[i]=config_3::type_id::create($sformatf("cfg_h3[%0d]",i));
                case(i)
                0 : cfg_h3[i].is_active = UVM_PASSIVE;
                1: cfg_h3[i].is_active = UVM_ACTIVE;
                 endcase
                env_cfg_h.config_h3[i]= cfg_h3[i];
                end



           env_cfg_h.no_of_config_1 =no_of_config_1;
           env_cfg_h.no_of_config_2 =no_of_config_2;
           env_cfg_h.no_of_config_3 =no_of_config_3;
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
  env_cfg_h= env_config::type_id::create("env_cfg_h");


    env_cfg_h.config_h1= new[no_of_config_1];
           env_cfg_h.no_of_config_2 =no_of_config_2;
           env_cfg_h.no_of_config_3 =no_of_config_3;
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
  env_cfg_h= env_config::type_id::create("env_cfg_h");


    env_cfg_h.config_h1= new[no_of_config_1];
    env_cfg_h.config_h2=new[no_of_config_2];
   env_cfg_h.config_h3=new[no_of_config_3];
   cconfig();
      uvm_config_db #(env_config)::set(this,"*","env_config",env_cfg_h);
     env_h=eenv::type_id::create("env_h",this);
    //env_config= env_cfg_h::type_id::create("env_config");
    //uvm_config_db #(env_config)::set(this,"*","env_config",env_cfg_h);
   endfunction

   task run_phase(uvm_phase phase);
   uvm_top.print_topology();
 endtask
  endclass

  module top;
   //`include "uvm_macros.svh"
    import uvm_pkg::*;

   initial
          begin
                run_test("ttest");
          end
   endmodule



                                                                
                                                              

                                           
                                   
