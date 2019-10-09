///addItem(gridToAdd, name, amount, description, sprite, script)
///@description addItem(gridToAdd, name, amount, description, sprite, script)
///@param gridToAdd
///@param name
///@param amount
///@param description
///@param sprite
///@param script

gridToAdd = argument0;
itemName = argument1;
itemAmt = argument2;
itemDesc = argument3;
itemSprite = argument4;
itemScript = argument5;

#region If the item already exists in the inventory

for (i = 0; i < ds_grid_height(gridToAdd); ++i) {
	
	if (ds_grid_get(gridToAdd, 0, i) == itemName) {
		ds_grid_set(gridToAdd, 1, i, ds_grid_get(gridToAdd, 1, i) + itemAmt);	
		return true;
	}

}


#endregion

#region If the item doesnt exist in the inventory yet

if (ds_grid_get(gridToAdd,0,0) != 0) {
	ds_grid_resize(gridtoAdd, global.invWidth,	ds_grid_height(gridToAdd) + 1);
}

itemSpot = ds_grid_height(gridToAdd) - 1;
ds_grid_set(gridToAdd, 0, itemSpot, itemName);
ds_grid_set(gridToAdd, 1, itemSpot, itemAmt);
ds_grid_set(gridToAdd, 2, itemSpot, itemDesc);
ds_grid_set(gridToAdd, 3, itemSpot, itemSprite);
ds_grid_set(gridToAdd, 4, itemSpot, itemScript);


#endregion
