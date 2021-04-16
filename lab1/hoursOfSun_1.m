function hours = hoursOfSun_1(x)
c1 = -3.228558573939192;
c2 = 0.242005946579062;
c3 = -0.000693034487539;
hours = c1 + (c2.*x)+(c3.*x.^2);
end

