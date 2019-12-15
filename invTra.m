function imat=invTra(mat)

Rt=mat(1:3,1:3).';
imat=[[Rt.';-(Rt*mat(1:3,4)).'].';0 0 0 1];

end