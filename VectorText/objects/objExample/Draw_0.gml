/// @description Test drawing
draw_line(room_width/2,0,room_width/2,room_height);
draw_line(0,room_height/2,room_width,room_height/2);

VectorTextExt("Top!",room_width/2,0,1,c_red,fa_center,fa_top);
VectorTextExt("Bottom!",room_width/2,room_height,1,c_blue,fa_center,fa_bottom);
VectorTextExt("Left!",0,room_height/2,1,c_green,fa_left,fa_center);
VectorTextExt("Right!",room_width,room_height/2,1,c_purple,fa_right,fa_center);
VectorTextExt("Middle!",room_width/2,room_height/2,3,c_yellow,fa_center,fa_center);

VectorText(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\n[\\]^_'abcdefghijklmnopqrstuvwxyz{|}~",0,64);