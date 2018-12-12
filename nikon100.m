%%% Parameters
speed_z_movement = 5; % Movement speed of the z-drive (1-8).
xml_name = 'lysed_z_scan.xml';
led_names = {'blue','green','red'};
led_number = [0,1,2];
led_intensity = [0.05633, 0.12706, 0.16247]; 
basename = '/home/np451/data/boyko/100nikon/'; 
filename = 'nikon';
movement_illumination = 0.07365; % LED3 (white)
num_fovs = 10;

displacement_both = 4; %um in both directions
num_steps = 120; % resolution of movement

% Workflow involves changing this number for every cell in the TEM
% grid, thus being able to more easily work with the images. Using
% only the DATE tag will sometimes cause images to be indexed to
% different seconds because it takes ~0.3s for the movies to be
% taken.

index = 29;
focus_height = 2086.425; % Absolute movement from this position
%%%


fid = fopen(xml_name, 'wt');
fprintf(fid, '<temika>\n');


for ii=1:num_fovs
    % Z drive
    positions_z = linspace(focus_height - displacement_both, focus_height + displacement_both, num_steps);
    for position=positions_z
        move_z_absolute(fid, position, speed_z_movement);
        for kk=1:3
            set_illumination(fid, kk-1, led_intensity(kk), 'ON');
            sleep(fid, 0.1);
            record(fid, 0.1, strcat(basename,filename,'_', num2str(index, '%03.f'), '_', 'Z', num2str(position), '_', led_names{kk}));
        end
    end
    move_relative(fid, -3.9, 123); 
    index = index + 1;
    focus_height = focus_height + 0.6;
end
set_illumination(fid, 3, movement_illumination, 'ON'); % Keep illumination on so I can quickly move to next location. Colour is arbitrary.

fprintf(fid, '</temika>');
fclose(fid);
