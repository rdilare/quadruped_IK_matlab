% clear all; clc
l=2;w=1;
pos=[4,4,1];
orien=[0,0,0];

Bstate=[l,w,pos,orien];

frToePosinW=genPath([2.5,2,0,1],[3,1.5,0,1],36);%[2.5,2,0,1].';
rrToePosinW=[2.5,4,0,1].';
rlToePosinW=[3.5,4,0,1].';
flToePosinW=[3.5,2,0,1].';


[Bstate,toeVecs]=abc([l,w,1,1,1,0,0,0],Bstate);
%%

for k=10:10:3*360
    l=2;w=1;
    pos=[4+0*sind(k),4+0*cosd(k),1];
    orien=[15*sind(k),15*cosd(k),5*cosd(k)+180];
if k>360
   k=mod(k,360);
end
if k==0
   k=10;
end
Bstate=[l,w,pos,orien];
toeVecs=[frToePosinW(:,10/10),rrToePosinW,rlToePosinW,flToePosinW];
ang=jointAngles(Bstate,toeVecs);

drawQuadruped(Bstate,ang,ones(1,8))
end


%%
% for k=1:length(BstateN(:,1))
%     ang=jointAngles(BstateN(k,:),toeVecsN(:,:,k));
%     drawQuadruped(BstateN(k,:),ang,ones(1,8));
%     pause(.2);
%     
% end