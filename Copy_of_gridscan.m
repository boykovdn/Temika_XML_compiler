fid = fopen('rbc_cycle_view.xml', 'wt');
fprintf(fid, '<temika>\n');

% Define grid area
Xs = [0,1000,200];
Ys = [100,2000,300];
delay = 5; % seconds
loop_times=500;

for lt=1:loop_times
    for ii=1:size(Xs,2)
        move_absolute(fid, Xs(ii), Ys(ii));
        sleep(fid, delay);
    end
end

fprintf(fid, '</temika>');
fclose(fid);