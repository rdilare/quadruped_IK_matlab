function path = genPath(piW,pfW,steps) % initial point, final point,No. of steps for compeleting the path


th=atan2(pfW(2)-piW(2),pfW(1)-piW(1));
th=rad2deg(th);

loc2world=traMatrix([0,0,th],[piW(1)+(pfW(1)-piW(1))/2,piW(2)+(pfW(2)-piW(2))/2,0]);
piL=invTra(loc2world)*piW.'; % initial point in local frame

a=piL(1); %semi major axis
b=a*.4;   % minor major axis

for t=0:pi/steps:pi
pathL=[a*cos(t),0,-b*sin(t),1];
pathinW=loc2world*pathL.';

if t==0
    path=pathinW;
else
path=[path,pathinW];
end

end