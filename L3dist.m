function D = L3dist(X,Y)
    for i=1:rows(Y)
        D(:,i) = sum(abs(X-Y(i,:)).^3, 2);
    end
end
