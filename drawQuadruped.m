function drawQuadruped(Bstate,ang,len) %angles and leg lengths & Bstate= body state
% ang=[fr(shoulder1,shoulder2,knee),rr(....),rl(.....),fl(....)](array of 12)
% Bstate= body state[dimension(L,W),position(x,y,z),orientation(alpha,beta,gama)]

[l,w]=deal(Bstate(1),Bstate(2)); %length and width of body
body.pos=[Bstate(3),Bstate(4),Bstate(5)];
body.orien=[Bstate(6),Bstate(7),Bstate(8)];

[afr1,afr2,afr3,arr1,arr2,arr3,arl1,arl2,arl3,afl1,afl2,afl3]=deal(ang(1),ang(2),ang(3),ang(4),ang(5),ang(6),ang(7),ang(8),ang(9),ang(10),ang(11),ang(12));
[frl1,frl2,rrl1,rrl2,rll1,rll2,fll1,fll2]=deal(len(1),len(2),len(3),len(4),len(5),len(6),len(7),len(8));

%transformation matrix of different frames w.r.t thier parents

bodyFrame=traMatrix(body.orien,body.pos); %w.r.t world
frFrame1=traMatrix([0,afr1,0],[w/2,l/2,0]);
frFrame2=traMatrix([afr2,0,0],[0,0,0]);
frFrame3=traMatrix([afr3,0,0],[0,0,-frl1]);
rrFrame1=traMatrix([0,arr1,0],[w/2,-l/2,0]);
rrFrame2=traMatrix([arr2,0,0],[0,0,0]);
rrFrame3=traMatrix([arr3,0,0],[0,0,-rrl1]);
rlFrame1=traMatrix([0,arl1,0],[-w/2,-l/2,0]);
rlFrame2=traMatrix([arl2,0,0],[0,0,0]);
rlFrame3=traMatrix([arl3,0,0],[0,0,-rll1]);
flFrame1=traMatrix([0,afl1,0],[-w/2,l/2,0]);
flFrame2=traMatrix([afl2,0,0],[0,0,0]);
flFrame3=traMatrix([afl3,0,0],[0,0,-fll1]);


frShoulder=bodyFrame*[w/2;l/2;0;1];
frKnee=bodyFrame*frFrame1*frFrame2*[0;0;-frl1;1];
frToe=bodyFrame*frFrame1*frFrame2*frFrame3*[0;0;-frl2;1];
rrShoulder=bodyFrame*[w/2;-l/2;0;1];
rrKnee=bodyFrame*rrFrame1*rrFrame2*[0;0;-rrl1;1];
rrToe=bodyFrame*rrFrame1*rrFrame2*rrFrame3*[0;0;-rrl2;1];
rlShoulder=bodyFrame*[-w/2;-l/2;0;1];
rlKnee=bodyFrame*rlFrame1*rlFrame2*[0;0;-rll1;1];
rlToe=bodyFrame*rlFrame1*rlFrame2*rlFrame3*[0;0;-rll2;1];
flShoulder=bodyFrame*[-w/2;l/2;0;1];
flKnee=bodyFrame*flFrame1*flFrame2*[0;0;-fll1;1];
flToe=bodyFrame*flFrame1*flFrame2*flFrame3*[0;0;-fll2;1];
clf

headS=[w/2,w/4]; % headShape (hight,width)
head=bodyFrame*([headS(2)/2,l/2,0,1; headS(2)/2,l/2,headS(1),1; -headS(2)/2,l/2,headS(1),1; -headS(2)/2,l/2,0,1]');

fill3([frShoulder(1),rrShoulder(1),rlShoulder(1),flShoulder(1)],[frShoulder(2),rrShoulder(2),rlShoulder(2),flShoulder(2)],[frShoulder(3),rrShoulder(3),rlShoulder(3),flShoulder(3)],[0,0,1],'LineWidth',2,'FaceAlpha',.8);
hold on
fill3(head(1,:),head(2,:),head(3,:),[0,0,1],'LineWidth',2,'FaceAlpha',.9);

%  Legs
plot3([frShoulder(1),frKnee(1),frToe(1)],[frShoulder(2),frKnee(2),frToe(2)],[frShoulder(3),frKnee(3),frToe(3)],'MarkerSize',4,'Marker','o','MarkerFaceColor','r','Color','r','LineWidth',3);
plot3([rrShoulder(1),rrKnee(1),rrToe(1)],[rrShoulder(2),rrKnee(2),rrToe(2)],[rrShoulder(3),rrKnee(3),rrToe(3)],'MarkerSize',4,'Marker','o','MarkerFaceColor','r','Color','r','LineWidth',3);
plot3([rlShoulder(1),rlKnee(1),rlToe(1)],[rlShoulder(2),rlKnee(2),rlToe(2)],[rlShoulder(3),rlKnee(3),rlToe(3)],'MarkerSize',4,'Marker','o','MarkerFaceColor','r','Color','r','LineWidth',3);
plot3([flShoulder(1),flKnee(1),flToe(1)],[flShoulder(2),flKnee(2),flToe(2)],[flShoulder(3),flKnee(3),flToe(3)],'MarkerSize',4,'Marker','o','MarkerFaceColor','r','Color','r','LineWidth',3);

%floor
fill3([body.pos(1)+l*5,body.pos(1)+l*5,body.pos(1)-l*5,body.pos(1)-l*5],[body.pos(2)+l*5,body.pos(2)-l*5,body.pos(2)-l*5,body.pos(2)+l*5],[0,0,0,0],[.5,.5,.5]);

ax=gca;


set(gca,'Color','w','XColor','k','YColor','k','ZColor','w')
set(gcf,'innerPosition',[10 90 1200 5*1200/10])
set(gcf,'Color','w')
set(gcf,'InvertHardcopy','off')

axis([0 10 0 10 0 5]);
% axis([body.pos(1)-5 body.pos(1)+5 body.pos(2)-5 body.pos(2)+5 0 body.pos(3)+5]);
xlabel('x-Axis');
ylabel('y-Axis');
% zlabel('z-Axis');
box off
drawnow
hold off

end