%% functionname: function description
function [B,toeVecsinW] = abc(bsI,bsF)

    stepSize=15;
	l=bsI(1);w=bsI(2);
    posI=bsI(3:5); orienI=bsI(6:8);
	posF=bsF(3:5); orienF=bsF(6:8);
    
    turnDir=-atan2(posF(1)-posI(1),posF(2)-posI(2));
    turnDir=rad2deg(turnDir);
	turnAngle=-orienI(3)+turnDir;
    k=0;
    disp([turnAngle,turnDir]);
    while k <= abs(turnAngle)
        rot=k*turnDir/abs(turnDir)+orienI(3);
        disp(k);
    	body2world=traMatrix([0,0,rot],posI);
    	toeVecsinB=[w/2,l/2,-posI(3),1 ; w/2,-l/2,-posI(3),1 ; -w/2,-l/2,-posI(3),1 ; -w/2,l/2,-posI(3),1].';
    	
        toePos=body2world*toeVecsinB;
        Brot=[l,w,posI,0,0,rot];
       if k==0
            Bstate=Brot;
            toeVecsinW=toePos;
        else
            Bstate=cat(1,Bstate,Brot);
            toeVecsinW=cat(3,toeVecsinW,toePos);
       end
   
       if k==abs(turnAngle)
            break;
       end
       
        if abs(turnAngle)-k>stepSize
            k=k+stepSize;

        elseif abs(turnAngle)-k<=stepSize
            k=abs(turnAngle);
        end
    end
        B=Bstate;
end
    
	
	
