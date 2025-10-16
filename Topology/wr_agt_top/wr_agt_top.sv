class wr_agtop extends uvm_env;
   `uvm_component_utils(wr_agtop)
  
   wr_agt    agt_han[];
   wr_cfg    wr_cfg_han;
   env_cfg   env_cfg_han;
   
  function new(string name="wr_agtop",uvm_component parent);
        super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
       if(!uvm_config_db #(env_cfg)::get(this,"","env_cfg",env_cfg_han))
 	`uvm_fatal("check cfg getting in agtop",get_type_name)
	
      agt_han = new[env_cfg_han.no_of_wr_agt];
      foreach(agt_han[i])
       begin
  	  agt_han[i]=wr_agt::type_id::create($sformatf("agt_han[%0d]",i),this);	
 	  uvm_config_db #(wr_cfg)::set(this,$sformatf("agt_han[%0d]",i),"wr_cfg",env_cfg_han.wr_cfg_han[i]);
      end	  
  endfunction
 
 endclass

 
  
 
