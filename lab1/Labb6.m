clear
close all

%b)Input coordinates on circle and has solution to equation system, circle
%midpoint and circle radius as output.
x = [6 8 3; 9 7 4]'; y = [x(:,1).^2+x(:,2).^2];
A = [ones(length(x),1), x]; 
i = 1;
c = A\y;
midpoint = [c(2) c(3)]/2;
radius = sqrt((x(1,1)-midpoint(1))^2 + (x(1,2)-midpoint(2))^2);
table0 = table(c', midpoint, radius)

%c)Input coordinates on circle, circle midpoint and circle radius, output
%visual representation in form of graph.
figure(1)
viscircles(midpoint, radius)
hold on
plot(midpoint(1),midpoint(2),'o')
hold on
plot(x(:,1),x(:,2),'*','MarkerSize',20)
title('Uppgift C')

%d)Equation for point 2 is multiplied by 4
A1 = A; y1 = y;
A1(2,:) = A1(2,:)*4;
y1(2) = y1(2)*4;
c1 = A1\y1;
midpoint1 = [c1(2) c1(3)]/2;
radius1 = sqrt((x(1,1)-midpoint1(1))^2 + (x(1,2)-midpoint1(2))^2);
table1 = table(c1', midpoint1, radius1)
    %The multiplication does not affect the circle's properties

%e)Two new points are added
x2 = [x; 9 9; 1 2]; y2 = [x2(:,1).^2+x2(:,2).^2];
A2 = [ones(length(x2),1), x2];
    
    %A^TAx = A^Ty
normA = A2'*A2;
normB = A2'*y2;

c2 = normA\normB;
midpoint2 = [c2(2) c2(3)]/2;
radius2 = sqrt((x2(1,1)-midpoint(1))^2 + (x2(1,2)-midpoint(2))^2);
table2 = table(c2', midpoint2, radius2)

figure(2)
viscircles(midpoint2, radius2)
hold on
plot(midpoint2(1),midpoint2(2),'o')
hold on
plot(x2(:,1),x2(:,2),'*','MarkerSize',20)
title('Uppgift EFG')

%f)Equation for point 2 is multiplied by 4
A3 = A2; y3 = y2;
A3(2,:) = A3(2,:)*4;
y3(2) = y3(2)*4;
    
    %A^TAx = A^Ty
normA1 = A3'*A3;
normB1 = A3'*y3;
c3 = normA1\normB1;

midpoint3 = [c3(2) c3(3)]/2;
radius3 = sqrt((x(1,1)-midpoint3(1))^2 + (x(1,2)-midpoint3(2))^2);
table3 = table(c3', midpoint3, radius3)

figure(2)
viscircles(midpoint3, radius3, 'LineStyle', '--')
hold on
plot(midpoint3(1),midpoint3(2),'o')
hold on
plot(A3(:,2),A3(:,3),'o','MarkerSize',20)

%g)Only point 2 is multiplied by factor 4
A4 = A2; y4 = y2;
A4(2,2) = A4(2,2)*4; A4(2,3) = A4(2,3)*4;
y4(2) = y4(2)*4;

    %A^TAx = A^Ty
normA2 = A4'*A4;
normB2 = A4'*y4;
c4 = normA2\normB2;

midpoint4 = [c4(2) c4(3)]/2;
radius4 = sqrt((x(1,1)-midpoint4(1))^2 + (x(1,2)-midpoint4(2))^2);
table4 = table(c4', midpoint4, radius4)

figure(2)
viscircles(midpoint4, radius4, 'LineStyle', ':')
hold on
plot(midpoint4(1),midpoint4(2),'o')
hold on
plot(A4(:,2),A4(:,3),'d','MarkerSize',20)
    