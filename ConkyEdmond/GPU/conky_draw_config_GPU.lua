-- Define your visual elements here
-- For examples, and a complete list on the possible elements and their 
-- properties, go to https://github.com/fisadev/conky-draw/
-- (and be sure to use the lastest version)
rad_add = 10
thick_add = 1

elements = {
    -- ##################### CPU #####################################    
    {
        -- CPU Usage Circle
        kind = 'ring_graph',
        conky_value = 'cpu cpu0',
        center = {x = 75, y = 100},
        radius = 53 + rad_add,
        max_value = 100,
        start_angle = 140,
        end_angle = 500,
        critical_threshold = 80,
        bar_thickness = 6+thick_add,
    },
    {
        -- CPU Fan Speed Ring
        kind = 'ring_graph_no_conky',
        command = "sensors |grep fan2|awk '{print $2}'",
        center = {x = 75, y = 100},
        radius = 30+ rad_add,
        min_value = 1000,
        -- max val is 2800 - 1000 (arbitrary 2800 and 1400)
        max_value = 1800,
        critical_threshold = 1000,

        background_color = 0xFFFFFF,
        background_alpha = 0.7,
        background_thickness = 2,

        bar_color = 0xFFFFFF,
        bar_alpha = 1,
        bar_thickness = 6+thick_add,

        start_angle = 140,
        end_angle = 300,
    },
    {
        -- CPU Tempurature Ring
        kind = 'ring_graph_no_conky',
        command = "sensors | grep temp1| awk '{print $2}' | sed 's/C//g;s/.$//;s/^.//'",
        center = {x = 75, y = 100},
        radius = 40+ rad_add,
        min_value = 10,
        -- max val is 60 - 10 
        max_value = 50,
        critical_threshold = 35,

        background_color = 0xFFFFFF,
        background_alpha = 0.7,
        background_thickness = 2,

        --bar_color = 0xFFFFFF,
        bar_color = 0X7ADFBB,
        bar_alpha = 1,
        bar_thickness = 6+thick_add,

        start_angle = 140,
        end_angle = 300,
    },

}
