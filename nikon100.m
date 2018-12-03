fid = fopen('slides_rgb.xml', 'wt');
fprintf(fid, '<temika>\n');

led_names = {'blue','green','red'};
led_number = [0,1,2];
led_intensity = [0.23941, 0.23941, 0.50644]; 
basename = '/home/np451/data/boyko/100nikon/'; 
filename = 'nikon'

%%%%%%%% Workflow involves changing this number for every cell in the TEM
%%%%%%%% grid, thus being able to more easily work with the images. Using
%%%%%%%% only the DATE tag will sometimes cause images to be indexed to
%%%%%%%% different seconds because it takes ~0.3s for the movies to be
%%%%%%%% taken.

index = 60

%%%%%%%%


for kk=1:3
    set_illumination(fid, kk-1, led_intensity(kk), 'ON');
    sleep(fid, 0.1);
    record(fid, 0.1, strcat(basename,filename,'_', num2str(index), '_',led_names{kk}));
end

set_illumination(fid, 3, 0.233, 'ON'); % Keep illumination on so I can quickly move to next location. Colour is arbitrary.

fprintf(fid, '</temika>');
fclose(fid);
