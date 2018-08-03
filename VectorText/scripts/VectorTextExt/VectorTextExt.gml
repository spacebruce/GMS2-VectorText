/// @function VectorTextExt(String,X,Y,Scale,Col,[Halign],[Valign]);
/// @param {string} String
/// @param {real} X
/// @param {real} Y
/// @param {real} Scale
/// @param {real} Colour
/// @param {real} HAlignment
/// @param {real} VAlignment
var String = argument[0];
var DrawXStart = argument[1];	
var DrawY = argument[2];
var Scale = argument[3];
var Col = argument[4];
var Halign = (argument_count >= 6) ? argument[5] : fa_left;
var Valign = (argument_count >= 7) ? argument[6] : fa_top;

if(Halign != fa_left)	//Reorient text on X
{
	var Width = 0;	
	var WidthLine = 0;
	for(var i=0; i<string_length(String); ++i)	//Count every chars width
	{
		var Char = string_char_at(String,i+1);
		if(Char == "\n")
		{
			WidthLine = 0;
		}
		else
		{
			var Index = ord(Char) - 32;	
			var Offset = Index * 112;	
			WidthLine +=  SimplexFont[Offset + 1] * Scale;
		}
		Width = max(WidthLine,Width);
	}
	//Change X start point based on Width and settings
	if((Halign == fa_center) || (Halign == fa_middle))		{	DrawXStart -= Width/2;	};	
	if(Halign == fa_right)		{	DrawXStart-= Width;		};
}
//Change Y start point
if((Valign == fa_center) || (Valign == fa_middle))
{
	DrawY -= 16 * Scale;
}
if(Valign == fa_bottom)
{
	DrawY -= 32 * Scale;
}

var DrawX = DrawXStart;
for(var i=0; i<string_length(String); ++i)
{
	var Char = string_char_at(String,i+1);
	if(Char == "\n")
	{	
		DrawX = DrawXStart;	
		DrawY += 32 * Scale;
	}
	else
	{
		DrawX += VectorTextChar(Char,DrawX,DrawY,Scale,Col);
	}
}