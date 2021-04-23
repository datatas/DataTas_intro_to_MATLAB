
%% add the path to where the data is stored 
%(stuck? try typing "help addpath")
addpath ./palmer_penguins/

%% load data from .csv files into the workspace as tables  
%(try "help readtable")
adelie = readtable('./palmer_penguins/adelie.csv');
gentoo = readtable('./palmer_penguins/gentoo.csv');
chinstrap = readtable('./palmer_penguins/chinstrap.csv');
%% extract flipper length and body mass
% (remember, columns of a table can be accessed with a ".")
adelie_flipperlength = adelie.FlipperLength_mm_;
adelie_bodymass = adelie.BodyMass_g_;
gentoo_flipperlength = gentoo.FlipperLength_mm_;
gentoo_bodymass = gentoo.BodyMass_g_;
chinstrap_flipperlength = chinstrap.FlipperLength_mm_;
chinstrap_bodymass = chinstrap.BodyMass_g_;
%% plot flipper length (x) vs. bill length (y)  
%(try "help plot")
plot(adelie_flipperlength, adelie_bodymass, '.r')
xlabel('flipper length')
ylabel('body mass, g')
title('my plot!')
hold on
plot(gentoo_flipperlength, gentoo_bodymass, '.b')
legend('adelie', 'gentoo', 'Location', 'northwest')


%% save plot
%(try "help saveas")

saveas(gcf, './myplot.png')