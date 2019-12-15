BstateN=Bstate(1,:);
toeVecsN=toeVecs(:,:,1);

for k=1:length(Bstate(:,1))-1
   
   for i= 1:5
   if i==1
      BstateN=cat(1,BstateN,Bstate(k+1,:));
      toeVecsN=cat(3,toeVecsN,toeVecs(:,:,k));
   elseif i==2
       BstateN=cat(1,BstateN,Bstate(k+1,:));
       fr=toeVecs(:,1,k+1);
       rr=toeVecs(:,2,k);
       rl=toeVecs(:,3,k);
       fl=toeVecs(:,4,k);
       toeVecsN=cat(3,toeVecsN,[fr,rr,rl,fl]);
   elseif i==3
       BstateN=cat(1,BstateN,Bstate(k+1,:));
       fr=toeVecs(:,1,k+1);
       rr=toeVecs(:,2,k+1);
       rl=toeVecs(:,3,k);
       fl=toeVecs(:,4,k);
       toeVecsN=cat(3,toeVecsN,[fr,rr,rl,fl]);   
   elseif i==4
       BstateN=cat(1,BstateN,Bstate(k+1,:));
       fr=toeVecs(:,1,k+1);
       rr=toeVecs(:,2,k+1);
       rl=toeVecs(:,3,k+1);
       fl=toeVecs(:,4,k);
       toeVecsN=cat(3,toeVecsN,[fr,rr,rl,fl]); 
   elseif i==5
       BstateN=cat(1,BstateN,Bstate(k+1,:));
       fr=toeVecs(:,1,k+1);
       rr=toeVecs(:,2,k+1);
       rl=toeVecs(:,3,k+1);
       fl=toeVecs(:,4,k+1);
       toeVecsN=cat(3,toeVecsN,[fr,rr,rl,fl]); 
   end
   end
end