function set_illumination(fid, channel, intensity, enable)
% INPUT: file handler, channel number, intensity parameter, 'ON'/'OFF'
% OUTPUT: none, writes xml to file

if ~ischar(channel)
    channel = num2str(channel);
end
if ~ischar(intensity)
    intensity = num2str(intensity);
end
if ~ischar(enable)
    print('Warning: enable parameter should be ON or OFF char array')
end

fprintf(fid,'\t<multiled device="microscope">\n');
fprintf(fid,'\t\t<trigger>EXTERNAL0</trigger> <!-- INTERNAL, EXTERNAL0, EXTERNAL1, EXTERNAL2 -->\n');
fprintf(fid,'\t\t<enable channel="1">OFF</enable> <!-- ON, OFF -->\n');
fprintf(fid,strcat('\t\t<set channel="0">',intensity,'</set> <!-- 0 -> 1 -->\n'));
fprintf(fid,strcat('\t\t<number channel="0">',channel,'</number> <!-- LED number, 0,1,2,3 -->\n'));
fprintf(fid,strcat('\t\t<enable channel="0">',enable,'</enable> <!-- ON, OFF -->\n'));
fprintf(fid,'\t</multiled>\n');

end