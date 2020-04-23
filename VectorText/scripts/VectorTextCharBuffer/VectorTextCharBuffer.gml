/// @function VectorTextCharBuffer(Buffer,Char,X,Y,Scale,Col);
/// @param {real} Buffer
/// @param {string} Char
/// @param {real} X
/// @param {real} Y
/// @param {real} Scale
/// @param {real} Colour
var Buffer = argument[0];
var Char = string_char_at(argument[1],1);
var DrawX = argument[2];
var DrawY = argument[3];
var Scale = argument[4];
var Col = argument[5];

DrawY += (24 * Scale);	//Font data is stored upside down, re-orient to top

var Index = ord(Char) - 32;	//Font starts at 32
var Offset = Index * 112;	//112 entries per char
var Pairs = global.SimplexFont[Offset++];
var Spacing = global.SimplexFont[Offset++];

var OldX = -1;
var OldY = -1;
for(var i=0; i<Pairs; ++i)
{
	var PenX = global.SimplexFont[Offset++];
	var PenY = global.SimplexFont[Offset++];
	
	if(PenX != -1) && (PenY != -1)
	{
		PenX *= Scale;
		PenY *= Scale;
		if((OldX != -1) && (OldY != -1))
		{
			vertex_position_3d(Buffer,DrawX + OldX,DrawY - OldY,0);	vertex_colour(Buffer,Col,1.0);
			vertex_position_3d(Buffer,DrawX + PenX,DrawY - PenY,0);	vertex_colour(Buffer,Col,1.0);
		}
	}
	
	OldX = PenX;
	OldY = PenY;
}

return Spacing * Scale;
