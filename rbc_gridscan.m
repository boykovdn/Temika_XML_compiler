fid = fopen('rbc_tile_test.xml', 'wt');

fprintf(fid, '<temika>\n');

x1 = [0,0];
x2 = [24,-11979];
x3 = [-19455,-11853];
x4 = [-19455,0];

fov_x = 140; % x FoV in microns absolute value
fov_y = 280; % y Fov in microns absolute value

diagonal = x3 - x1;
x_steps = abs(floor(diagonal(1) / fov_x));
y_steps = abs(floor(diagonal(2) / fov_y));

delta_x = diagonal(1) / x_steps;
delta_y = diagonal(2) / y_steps;

led_names = ['blue','green','red','white'];
led_number = [0,1,2,3];
led_intensity = [0.09216, 0.14916, 0.38121, 0.07181];

move_absolute(fid,0,0);
for ii=1:x_steps
    move_relative(fid, delta_x, 0);
    for kk=1:4
            set_illumination(fid, kk-1, led_intensity(kk), 'ON');
            sleep(fid, 0.1);
            record(fid, 0.1, strcat(basename,'_',led_names(kk)));
            set_illumination(fid, kk-1, led_intensity(kk), 'OFF');
    end
    for jj=1:y_steps
        if mod(ii,2) == 1
            move_relative(fid, 0, delta_y);
        else
            move_relative(fid, 0, -delta_y);
        end
        basename = strcat(pwd,'/test_');
        for kk=1:4
            set_illumination(fid, kk-1, led_intensity(kk), 'ON');
            sleep(fid, 0.1);
            record(fid, 0.1, strcat(basename,'_',led_names(kk)));
            set_illumination(fid, kk-1, led_intensity(kk), 'OFF');
        end
    end
end
        

set_illumination(fid, 3, 0.01, 'OFF');
fprintf(fid, '</temika>');
fclose(fid)