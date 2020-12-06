function [eleccion, indice] = fuzzy(m,n,DM,w,MM)
%   %-- M�todo que combina SMARTS con l�gica difusa
%
%   (update 01.06.2019)
%   Par�metros: 
%   D: Matriz de decisi�n de m alternativas con n criterios [mxn]
%   w: Matriz de pesos para los n criterio [1xn]
%   MM: Matriz de signos costo-beneficio de los n criterios[1xn]
%
%   Salida:
%   eleccion: Valor de ranking de la mejor alternativa
%   indice: Fila de la mejor alternativa
%   MN: Matriz de decisi�n D normalizada

F = Fun_DMnorm(m,n,DM,MM,3);    % Normalizaci�n de la matriz D con m�todo Max-Min

F = F.^repmat(w,m,1); % C�lculo de intersecci�n

[eleccion, indice] = max(min(F,[],2));
