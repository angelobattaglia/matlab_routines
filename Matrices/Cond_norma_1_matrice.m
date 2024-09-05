A=zeros(100);
for i=1:100
for j=1:100 
  A(i,j)=A(i,j)+cos(max(i,j));

end
end
risultato=cond(A,1)