/// @function VectorTextExtBuffer(Buffer,String,X,Y,Scale,Col,[Halign],[Valign]);
/// @param {real} Buffer
/// @param {string} String
/// @param {real} X
/// @param {real} Y
/// @param {real} Scale
/// @param {real} Colour
/// @param {real} HAlignment
/// @param {real} VAlignment
var Buffer = argument[0];
var String = argument[1];
var DrawX = argument[2];	
var DrawY = argument[3];
var Scale = argument[4];
var Col = argument[5];
var Halign = (argument_count >=7) ? argument[6] : fa_left;
var Valign = (argument_count >= 8) ? argument[7] : fa_top;
var LineCount = string_count("\n",String)+1;
var DrawXStart = array_create(LineCount,0);

gml_pragma("global", "VectorTextData()");

if(Halign != fa_left)	//Reorient text on X
{
	//Count every chars width
	var LineNo = 0;
	var WidthLine = array_create(LineCount,0);
	for(var i=0; i<string_length(String); ++i)	
	{
		var Char = string_char_at(String,i+1);
		if(Char == "\n")
		{
			LineNo++;
		}
		else
		{
			var Index = ord(Char) - 32;	
			var Offset = (Index * 112) + 1;
			WidthLine[LineNo] +=  global.SimplexFont[Offset] * Scale;
		}
	}
	//Align line based on width
	for(var i=0; i<LineCount; ++i)
	{
		if((Halign == fa_center) || (Halign == fa_middle))	
			DrawXStart[i] = DrawX - (WidthLine[i] / 2);	
		else if (Halign == fa_right)	
			DrawXStart[i] = DrawX - WidthLine[i];
	}
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

var CharX = DrawXStart[0];
var LineNo = 0;
for(var i=0; i<string_length(String); ++i)
{
	var Char = string_char_at(String,i+1);
	if(Char == "\n")
	{
		CharX = DrawXStart[++LineNo];	
		DrawY += 32 * Scale;
	}
	else
	{
		CharX += VectorTextCharBuffer(Buffer,Char,CharX,DrawY,Scale,Col);
	}
}