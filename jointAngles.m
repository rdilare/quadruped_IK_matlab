function angles= jointAngles(Bstate,toeVecs) 
function ang=angle(L,V,S) % LinkLength & Vector & OriginShift
[y,z,x]=deal(-(V(1)-S(1)),V(2)-S(2),-(V(3)-S(3)));
[l1,l2,l3]=deal(L(1),L(2),L(3));
z=z-l1;

th1=atan2((y),x);

r=sqrt(x^2+(y)^2);
R=sqrt(r^2+z^2);
a1=atan2(z,r);
a2=acos((R^2+(l2)^2-(l3)^2)/(2*R*l2));
a3=acos(((l2)^2+(l3)^2-R^2)/(2*(l2)*(l3)));

th2=a1+a2;
th3=a3-pi;

ang=rad2deg([th1,th2,th3]);
end


orien=Bstate(6:8);%[-30,0,0];
pos=Bstate(3:5);%[3,3,1];
% body.dimen=[2,1];
l=Bstate(1);
w=Bstate(2);
% Bstate=[l,w,pos,orien];
frToePosinW=toeVecs(:,1);%[3.6,4,0,1].';
rrToePosinW=toeVecs(:,2);%[3.5,2,0,1].';
rlToePosinW=toeVecs(:,3);%[2.5,2,0,1].';
flToePosinW=toeVecs(:,4);%[2.5,4,0,1].';


world2body=invTra(traMatrix(orien,pos));

frToePosinB=world2body*frToePosinW;
rrToePosinB=world2body*rrToePosinW;
rlToePosinB=world2body*rlToePosinW;
flToePosinB=world2body*flToePosinW;

frA=angle([0,1,1],frToePosinB,[w/2,l/2,0]);
rrA=angle([0,1,1],rrToePosinB,[w/2,-l/2,0]);
rlA=angle([0,1,1],rlToePosinB,[-w/2,-l/2,0]);
flA=angle([0,1,1],flToePosinB,[-w/2,l/2,0]);

angles=[frA,rrA,rlA,flA];
end