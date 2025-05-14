deities={};
var i=0
repeat(8) {
	deities[$ $"obj{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	deities[$ $"liquid{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	deities[$ $"semi{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	deities[$ $"back{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	
	//the other layers dont need data, since they only hold dataless tiles
    //deities[$ $"data{i}"][0][0]=[] //i'm not sure if the code below is an acceptable replacement but this crashed the game so.
    variable_struct_set(deities,$"data{i}",[[[]]])
    
	i++
}

lemonobjlist()