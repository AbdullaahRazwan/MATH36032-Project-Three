B = readtable('bananas-18jan21'); %read data into Matlab
origin = unique(B.Origin); %create list of distinct of distinct origins
origin = categorical(origin); %convert from cell aray to categorial.

three_lowest_avgs = [];
three_lowest_countries = [];

for i = 1:27
    if origin(i) == 'all_bananas' %we don't want to include all_bananas
        continue
    end
    indices = find(B.Origin == origin(i)); %the indices where the data is 
                                           %for origin(i)
    dates = B.Date(indices); 
    latest_date = dates(1); five_years = years(5); 
    earliest_required_date = dates(1) - five_years;
    
    %find the index of the data closest to 5 years ago from latest
    [y I1] = min(abs(dates - earliest_required_date));
    
    x = B.Price(indices);
    z = x(1:I1);
    m = mean(z); 
    if length(three_lowest_avgs) < 3
        three_lowest_avgs = [three_lowest_avgs m];
        three_lowest_countries = [three_lowest_countries origin(i)];
    elseif m < max(three_lowest_avgs)
        [M, I2] = max(three_lowest_avgs); %max value and index of it
        three_lowest_avgs(I2) = [];
        three_lowest_countries(I2) = [];
        three_lowest_avgs = [three_lowest_avgs m];
        three_lowest_countries = [three_lowest_countries origin(i)];
    end
end

three_lowest_countries

three_highest_avgs = [];
three_highest_countries = [];

for k = 1:27
    if origin(k) == 'all_bananas' %we don't want to include all_bananas
        continue
    end
    indices = find(B.Origin == origin(k)); %the indices where the data is
                                           %for origin(k)
    dates = B.Date(indices); 
    latest_date = dates(1); five_years = years(5); 
    earliest_required_date = dates(1) - five_years;
    
    %find the index of the data closest to 5 years ago from latest
    [y1 I11] = min(abs(dates - earliest_required_date));
    
    x = B.Price(indices);
    z = x(1:I11); 
    m = mean(z);
    if length(three_highest_avgs) < 3
        three_highest_avgs = [three_highest_avgs m];
        three_highest_countries = [three_highest_countries origin(k)];
    elseif m > min(three_highest_avgs) 
        [M1, I21] = min(three_highest_avgs); %min value and index of it
        three_highest_avgs(I21) = [];
        three_highest_countries(I21) = [];
        three_highest_avgs = [three_highest_avgs m];
        three_highest_countries = [three_highest_countries origin(k)];
    end
end

three_highest_countries