function sleep(fid, time_seconds)
% INPUT: file id, seconds to sleep
% OUTPUT: none, writes xml to given file

if ~ischar(time_seconds)
    time_seconds = num2str(time_seconds);
end

fprintf(fid, strcat('<sleep>0:0:',time_seconds,'</sleep>\n'));

end
