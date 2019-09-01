function [centroids] = clustering_pc(points, NC)
  n = size(points, 1);

  %generare aleatoare a centroizilor de inceput
  centroids = points(randperm(n, NC), :);

  prevCentroids = zeros(size(centroids));
  GRP = zeros(NC, n);
  %conditia de convergenta
  while ( norm(centroids - prevCentroids) != 0 )
    prevCentroids = centroids;
    contor = zeros(NC, 1);
    GRP = zeros(NC, n);

    %separarea punctelor dupa centroizi
    for i = 1 : n
      min = norm(points(i, :) - centroids(1, :));
      poz = 1;
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

  %recalcularea centroizilor
    for i = 1 : NC
      %exista posibilitatea ca un centroid sa nu contina nici un punct la un moment de timp
      if(contor(i) != 0)
       centroids(i, :) = sum(points(GRP(i, 1 : contor(i)), :)) / contor(i);
      endif
    endfor
  endwhile
endfunction