fid = fopen('slides_rgb.xml', 'wt');
fprintf(fid, '<temika>\n');

led_names = {'blue','green','red'};
led_number = [0,1,2];
led_intensity = [0.0368, 0.113, 0.0931]; 
basename = '/home/np451/data/boyko/100nikon/'; 
filename = 'nikon'

%%%%%%%% Workflow involves changing this number for every cell in the TEM
%%%%%%%% grid, thus being able to more easily work with the images. Using
%%%%%%%% only the DATE tag will sometimes cause images to be indexed to
%%%%%%%% different seconds because it takes ~0.3s for the movies to be
%%%%%%%% taken.

index = 1

%%%%%%%%


for kk=1:3
    set_illumination(fid, kk-1, led_intensity(kk), 'ON');
    sleep(fid, 0.1);
    record(fid, 0.1, strcat(basename,filename,'_', num2str(index), '_',led_names{kk}));
end

fprintf(fid, '</temika>');
fclose(fid);