function view_clusters(points, centroids)
  n = size(points, 1);
  p = size(centroids, 1);
  
  %selectarea culorilor random ale grupurilor centroizilor
  COLORS = rand(p, 3);
  
  %culoarea fiecarui punct
  PCOLORS = zeros(n, 3);
  
  %se determina punctele ce apartin fiecarui centroid (ca in clustering_pc)
  for i = 1 : n
    min = norm(points(i, : ) - centroids(1, : ));
    poz = 1;
    for j = 2 : p
      tmp = norm(points(i, : ) - centroids(j, : ));
      if(tmp < min)
        min = tmp;
        poz = j;
      endif
    endfor
    %punctul primeste culoarea asociata centroidului sau
    PCOLORS(i, : ) = COLORS(poz, :);
  endfor
  
  %afisare a centroizilor, pentru verificare
  %scatter3(centroids( : , 1), centroids( : , 2), centroids( : , 3), 300, 0, 'filled');
  %pause(3);
  
  %afisarea punctelor
  scatter3(points( : , 1), points( : , 2), points( : , 3), 100, PCOLORS, 'filled');
  
  
endfunction