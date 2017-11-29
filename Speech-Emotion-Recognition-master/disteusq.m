function number = disteusq(feature,a)

number = zeros(49,1);

    for i = 1:49
       number(i,:) =   sqrt(sum((feature-a(i,:)) .^ 2));
    end 
    number = min(number);
end
    
    