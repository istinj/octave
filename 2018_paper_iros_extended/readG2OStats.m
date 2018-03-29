function [ chi2_vector ] = readG2OStats( path )
fid = fopen(path);
key = 'chi2=';
line = fgetl(fid);
while ischar(line)
%     k = strfind(line, key);
%     start_index = k+length(key)+1;
%     line(start_index:start_index+3)
%     value = sscanf(line(k+length(key),'%f'))
    line_elements = strsplit(line,' ');
    
    if (str2num(line_elements{2})<0)
        disp("warning");
        return;
    end
    chi2_vector(str2num(line_elements{2})+1) = str2double(line_elements{8});
    line = fgetl(fid);
end
fclose(fid);
end

