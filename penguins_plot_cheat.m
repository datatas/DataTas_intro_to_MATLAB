cd ~/Documents/MATLAB/intro_to_coding/   %you may need to change this to your own path!

%% add the path to where the data is stored 
%(stuck? try typing "help addpath")
addpath ~/Documents/MATLAB/intro_to_coding/palmer_penguins/   

%% load data from .csv files into the workspace as tables
%(try "help readtable")
adelie = readtable('~/Documents/MATLAB/intro_to_coding/palmer_penguins/adelie.csv');
gentoo = readtable('~/Documents/MATLAB/intro_to_coding/palmer_penguins/gentoo.csv');
chinstrap = readtable('~/Documents/MATLAB/intro_to_coding/palmer_penguins/chinstrap.csv');

%% extract flipper length and bill length
% (remember, columns of a table can be accessed with a ".")
adelie_flipperlength = adelie.FlipperLength_mm_;   %note that spaces in variable names are replaced with an underscore.
adelie_bodymass = adelie.BodyMass_g_;
gentoo_flipperlength = gentoo.FlipperLength_mm_;
gentoo_bodymass = gentoo.BodyMass_g_;
chinstrap_flipperlength = chinstrap.FlipperLength_mm_;
chinstrap_bodymass = chinstrap.BodyMass_g_;

%% plot flipper length (x) vs. bill length (y) for each penguin type 
%(try "help plot")
figure
ms = 20;
plot(adelie_flipperlength, adelie_bodymass, '.', 'MarkerSize', ms)
hold on   %this tells Matlab to put following data on the same plot, instead of a new one
plot(gentoo_flipperlength, gentoo_bodymass, '.', 'MarkerSize', ms)
plot(chinstrap_flipperlength, chinstrap_bodymass, '.', 'MarkerSize', ms)
xlabel('flipper length, mm')
ylabel('body mass, g')
legend('adelie', 'gentoo', 'chinstrap', 'Location', 'northwest')   
%we need to tell the legend where to go, because it's in the way!

%% save plot
% (try "help saveas")
saveas(gcf, "~/Documents/MATLAB/intro_to_coding/palmer_penguins/flipper_length_v_body_mass.png")