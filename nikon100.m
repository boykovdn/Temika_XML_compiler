fid = fopen('rbc_tile_test.xml', 'wt');
fprintf(fid, '<temika>\n');

led_names = {'blue','green','red'};
led_number = [0,1,2];
led_intensity = [0.0368, 0.113, 0.0931]; 
basename = '/home/np451/data/boyko/100nikon/'; 
filename = 'nikon'
for kk=1:3
    set_illumination(fid, kk-1, led_intensity(kk), 'ON');
    sleep(fid, 0.1);
    record(fid, 0.1, strcat(basename,filename,'_',num2str(led_names(kk))));
end

fprintf(fid, '</temika>');
fclose(fid);