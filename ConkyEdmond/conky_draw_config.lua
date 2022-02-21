-- Define your visual elements here
-- For examples, and a complete list on the possible elements and their 
-- properties, go to https://github.com/fisadev/conky-draw/
-- (and be sure to use the lastest version)
rad_add = 20
thick_add = 1
cpu_x_offset = 50
cpu_y_offset = 0
gpu_x_offset = 138
gpu_y_offset = 115
mem_x_offset = 90
mem_y_offset = 45

elements = {
    -- ##################### CPU #####################################    
    {
        -- CPU Usage Circle
        kind = 'ring_graph',
        conky_value = 'cpu cpu0',
        center = {x = 75+cpu_x_offset, y = 100+cpu_y_offset},
        radius = 53 + rad_add,
        max_value = 100,
        start_angle = 140,
        end_angle = 360,
        critical_threshold = 80,
        
        background_color = 0x028090,
        background_alpha = 0.7,
        background_thickness = 2,

        bar_color = 0x028090,
        bar_alpha = 1,
        bar_thickness = 6+thick_add,
    },
    {
        -- CPU Fan Speed Ring
        kind = 'ring_graph_no_conky',
        command = "sensors |grep fan2|awk '{print $2}'",
        center = {x = 75+cpu_x_offset, y = 100+cpu_y_offset},
        radius = 30+ rad_add,
        to_percent = true,
        percent_mod_maximum=3200,
        max_value = 100,
        critical_threshold = 90,

        background_color = 0xF0F3BD,
        background_alpha = 0.7,
        background_thickness = 2,

        bar_color = 0xF0F3BD,
        bar_alpha = 1,
        bar_thickness = 6+thick_add,

        start_angle = 140,
        end_angle = 300,
    },
   {
        -- CPU Tempurature Ring
       kind = 'ring_graph_no_conky',
       command = "sensors | grep SMBUSMASTER| awk '{print $3}' | sed 's/C//g;s/.$//;s/^.//'",
       center = {x = 75+cpu_x_offset, y = 100+cpu_y_offset},
       radius = 40+ rad_add,
         to_percent = true,
         percent_mod_maximum=60,
         max_value = 100,
        critical_threshold = 90,

        background_color = 0X00BFB2,
        background_alpha = 0.7,
        background_thickness = 2,

        --bar_color = 0xFFFFFF,
        bar_color = 0X00BFB2,
        bar_alpha = 1,
        bar_thickness = 6+thick_add,

        start_angle = 140,
        end_angle = 300,
    },

    -- ##################### GPU #####################################    
    {
      -- GPU Usage Circle
      kind = 'ring_graph_no_conky',
      command = "nvidia-settings -tq GPUUtilization | cut -d',' -f-1 | awk -v FS='graphics=' 'NF>1{print $2}'",
      center = {x = 75+gpu_x_offset, y = 100 + gpu_y_offset},
      radius = 53 + rad_add,
      max_value = 100,
      start_angle = 400,
      end_angle = 180,
      critical_threshold = 80,
      bar_thickness = 6+thick_add,
      bar_color = 0X4357AD,
      background_color = 0X4357AD,
    },
    {
      -- GPU Fan Speed Ring
      kind = 'ring_graph_no_conky',
      command = "nvidia-settings -tq GPUCurrentFanSpeed | awk 'NR==1'",
      center = {x = 75+gpu_x_offset, y = 100 + gpu_y_offset},
      radius = 30+ rad_add,
      max_value = 100,
      critical_threshold = 90,
    
      background_color = 0xFFFFFF,
      background_alpha = 0.7,
      background_thickness = 2,
    
      bar_color = 0xFFFFFF,
      bar_alpha = 1,
      bar_thickness = 6+thick_add,
    
      start_angle = 400,
      end_angle = 240,
    },
    {
      -- GPU Tempurature Ring
      kind = 'ring_graph_no_conky',
      command = "nvidia-settings -tq GPUCoreTemp | awk 'NR==1'",
      center = {x = 75+gpu_x_offset, y = 100 + gpu_y_offset},
      radius = 40+ rad_add,
      min_value = 20,
      -- max val is 110 - 20 
      max_value = 90,
      critical_threshold = 70,
    
      background_color = 0x8EA8C3,
      background_alpha = 0.7,
      background_thickness = 2,
    
      --bar_color = 0xFFFFFF,
      bar_color = 0x8EA8C3,
      bar_alpha = 1,
      bar_thickness = 6+thick_add,
    
      start_angle = 400,
      end_angle = 240,
    },
    
    -- ##################### RAM #####################################  
    {
        -- RAM Usage Ellipse
        kind = 'ellipse_graph',
        center = {x = 75+mem_x_offset, y = 100+mem_y_offset},
        conky_value = 'memperc',
        max_value = 100,
        critical_threshold = 90,
        radius = 5,
        width= 280,
        height= 300,
        start_angle = 100,
        end_angle = 180,
        bar_color = 0xE6AACE,
        color= 0xE6AACE,
        background_color= 0xE6AACE,
        bar_thickness = 6+thick_add,
    },
}
