B = readtable('bananas-18jan21'); %read data into Matlab

origin = unique(B.Origin); %create list of distinct of distinct origins
origin = categorical(origin) %convert from cell aray to categorial.   