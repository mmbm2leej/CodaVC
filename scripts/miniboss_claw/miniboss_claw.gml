#region Refresh Normal State Variables
startNormalAlarm = false;
normalEnd = false;

#endregion

sprite_index = spr_minibossclaw;
mask_index = spr_minibossclawhitbox;

if (animation_end()) mystate = miniBossState.normal;