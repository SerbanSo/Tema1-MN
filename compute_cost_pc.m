function [SUM] = compute_cost_pc(points, centroids)
  NC = size(centroids, 1);
  n = size(points, 1);
  contor = zeros(NC, 1);

  %determinarea punctelor fiecarui centroid (ca in clustering_pc)
  for i = 1 : n
    min = norm(points(i, :) - centroids(1, :));
    poz = 1;
    grp = 1;
    for j = 2 : NC
      tmp = norm(points(i, :) - centroids(j, :));
      if(tmp < min)
        min = tmp;
        poz = j;
      endif
    endfor
    contor(poz)++;
    GRP(poz, contor(poz)) = i;
  endfor

  % calculul sumei
  SUM = 0;
  for i = 1 : NC
    for j = 1 : contor(i)
      SUM = SUM + norm(centroids(i, :) - points(GRP(i, j), :));
    endfor
  endfor
endfunction