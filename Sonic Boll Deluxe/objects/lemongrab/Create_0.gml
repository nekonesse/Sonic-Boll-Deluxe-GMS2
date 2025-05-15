deities={};
var i=0
repeat(8) {
	deities[$ $"obj{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	deities[$ $"liquid{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	deities[$ $"semi{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	deities[$ $"back{i}"]=ds_grid_create(ceil(drawregion.viewwidth/16),ceil(drawregion.viewheight/16))
	
	deities[$ $"data{i}"]=[[[]]]
	i++
}

lemonobjlist()