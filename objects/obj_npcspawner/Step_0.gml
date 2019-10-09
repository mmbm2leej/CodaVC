var currentroom = room_get_name(room);

#region If the room is playareaAzaga
if (currentroom == "playareaAzaga") {
	if (azagasetready == false) {
		for(i = 0; i < array_length_1d(azagaset); ++i) {
			var current = i;
			var npc = instance_create_layer(random_range(100,1800),450,"characterlayer",obj_npc);
			with npc {
				myname = ds_grid_get(global.ds_NPCDB,0,current);
				myidlesprite = ds_grid_get(global.ds_NPCDB,1,current);
				mywalksprite = ds_grid_get(global.ds_NPCDB,2,current);
				myrunsprite = ds_grid_get(global.ds_NPCDB,3,current);
				mydialoguesprite = ds_grid_get(global.ds_NPCDB,4,current);
			}
		} azagasetready = true;		
	} 
	
}

#endregion

#region If the room is cadenzaWest0
if (currentroom == "cadenzaWest0") {
	if (cadWestsetready == false) {
			var npc = instance_create_layer(1810,450,"characterlayer",obj_npc);
			with npc {
				myname = ds_grid_get(global.ds_NPCDB,0,4);
				myidlesprite = ds_grid_get(global.ds_NPCDB,1,4);
				mywalksprite = ds_grid_get(global.ds_NPCDB,2,4);
				myrunsprite = ds_grid_get(global.ds_NPCDB,3,4);
			}
	} cadWestsetready = true;		
} 
	


#endregion