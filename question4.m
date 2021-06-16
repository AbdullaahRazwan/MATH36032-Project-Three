B = readtable('bananas-18jan21'); %read data into Matlab
B = table2timetable(B);
B = B(timerange('2016-01-01', '2020-12-31'), :);

B.Origin = categorical(B.Origin);
costa_rica = find(B.Origin == 'costa_rica');
windward_isles = find(B.Origin == 'windward_isles');
ecuador = find(B.Origin == 'ecuador');
all_bananas = find(B.Origin == 'all_bananas');

plot(B.Date(costa_rica), B.Price(costa_rica), 'k*-')
hold on
plot(B.Date(windward_isles), B.Price(windward_isles), 'r*-')
plot(B.Date(ecuador), B.Price(ecuador), 'b*-')
plot(B.Date(all_bananas), B.Price(all_bananas), 'g*-')
lg = legend('Costa Rica', 'Windward Isles', 'Ecuador', 'All Bananas');
title('Variation of price for selected countries');
xlabel('Date - Jan 2016 to Dec 2020');
ylabel("Price in £'s");
hold off
