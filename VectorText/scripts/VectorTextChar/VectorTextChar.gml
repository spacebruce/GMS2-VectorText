/// @function VectorTextChar(Char,X,Y,Scale,Col);
/// @param {string} Char
/// @param {real} X
/// @param {real} Y
/// @param {real} Scale
/// @param {real} Colour
var Char = string_char_at(argument0,1);
var DrawX = argument1;
var DrawY = argument2;
var Scale = argument3;
var Col = argument4;
var OldCol = draw_get_colour();

DrawY += (24 * Scale);	//Font data is stored upside down, re-orient to top

var Index = ord(Char) - 32;	//Font starts at 32
var Offset = Index * 112;	//112 entries per char
var Pairs = SimplexFont[Offset++];
var Spacing = SimplexFont[Offset++];

draw_set_colour(Col);

var OldX = -1;
var OldY = -1;
for(var i=0; i<Pairs; ++i)
{
	var PenX = SimplexFont[Offset++];
	var PenY = SimplexFont[Offset++];
	
	if(PenX != -1) && (PenY != -1)
	{
		PenX *= Scale;
		PenY *= Scale;
		if((OldX != -1) && (OldY != -1))
		{
			draw_line(DrawX+ OldX,DrawY-OldY,DrawX+PenX,DrawY-PenY);
		}
	}
	
	OldX = PenX;
	OldY = PenY;
}

draw_set_colour(OldCol);

return Spacing * Scale;
