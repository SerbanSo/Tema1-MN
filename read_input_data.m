function [NC points] = read_input_data(param, pts)
  %citire NC
  fid = fopen(param, 'r');
  NC = fscanf(fid, '%d');
  fclose(fid);

  fid = fopen(pts, 'r');

  %ignora liniile cu comentari
  for i = 1 : 5
    fgets(fid);
  endfor

  points = fscanf(fid, '%f', [3, Inf])';
  fclose(fid);
endfunction