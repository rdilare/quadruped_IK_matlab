function mat= traMatrix(rot,tra)
[a,b,c]=deal(rot(1),rot(2),rot(3));
[x,y,z]=deal(tra(1),tra(2),tra(3));
rx=transpose([1 0 0 0;0 cosd(a) sind(a) 0;0 -sind(a) cosd(a) 0;x y z 1]);
ry=transpose([cosd(b) 0 -sind(b) 0;0 1 0 0;sind(b) 0 cosd(b) 0;0 0 0 1]);
rz=transpose([cosd(c) sind(c) 0 0;-sind(c) cosd(c) 0 0;0 0 1 0;0 0 0 1]);

mat=rx*ry*rz;

end