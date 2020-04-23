/// @description description

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
Format = vertex_format_end();

Buffer = vertex_create_buffer();
vertex_begin(Buffer,Format);
VectorTextBuffer(Buffer,"Buffer Test",0,0);

VectorTextExtBuffer(Buffer,"Top!",room_width/2,0,1,c_red,fa_center,fa_top);
VectorTextExtBuffer(Buffer,"Bottom!",room_width/2,room_height,1,c_blue,fa_center,fa_bottom);
VectorTextExtBuffer(Buffer,"Left!",0,room_height/2,1,c_green,fa_left,fa_center);
VectorTextExtBuffer(Buffer,"Right!",room_width,room_height/2,1,c_purple,fa_right,fa_center);
VectorTextExtBuffer(Buffer,"Middle!\nHold Space for realtime mode!",room_width/2,room_height/2,1.5,c_yellow,fa_center,fa_center);

VectorTextBuffer(Buffer," !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\n[\\]^_'abcdefghijklmnopqrstuvwxyz{|}~",0,64);


vertex_end(Buffer);