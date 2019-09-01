function view_cost_vs_nc(pts)
  %citire fisier .points
  fid = fopen(pts, 'r');

  %ignora liniile cu comentari
  for i = 1 : 5
    fgets(fid);
  endfor

  points = fscanf(fid, '%f', [3, Inf])';

  fclose(fid);

  for i = 1 : 10
    centroids = clustering_pc(points, i);
    sum(i) = compute_cost_pc(points, centroids);
  endfor

  plot(1 : 10, sum);

endfunction