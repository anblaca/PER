function [etr,edv]=multinomial2(Xtr,xltr,Xdv,xldv,epsilons)
clases = unique(xltr);
%pc probrabilidad condicionada, prioris probabilidad a priori. Por cada clase%
for k = clases'
indk=find(xltr==k);
Xtvk=Xtr(indk,:);
pc(k+1,:)=sum(Xtvk);
prioris(k+1) = rows(indk)/rows(Xtr);
end

%Normalización de pc%
for k=clases'
%% Suma solo la fila correspondiente a la clase k, y no toda la matriz que la sumaria por columnas
pc(k+1,:)=pc(k+1,:)/sum(pc(k+1,:));
end

%% La alternativa a ese bucle de arriba es lo que haces en la normalizacion del suavizado
%% pc = pc./sum(pc);

%suavizado laplace%
pc = pc + epsilons;
pc = pc./sum(pc);

%wc0%

prioris = log(prioris);

%wc%
pc = log(pc);	

%clasificador, matriz%
a = Xdv*pc';
b = prioris;
g = a + b;

%aplicar argmax por cada fila de g%
%% Las muestras están por filas, así que hay que hacer el máximo por filas
%% por defecto calcula el máximo de cada columna
[maxValor maxIndice]=max(g,[],2);
%restar uno para obtener la clase ganadora%
maxIndice = maxIndice - 1;

%Para obtener el error comparamos el vector maxIndice con los vectores parametros de la funcion%
%Conjunto Validación%
%% Haces una operación que no asignas a ninguna variable
%%maxIndice != xldv;
[m n]= size(xldv);
%%edv = sum(xldv)/m;
%% ESto es lo que creo que querias hacer
edv = sum(maxIndice != xldv)/m*100;

%Conjunto Entrenamiento%
%% NO TIENE SENTIDO CALCULAR LA TASA DE ERROR DE ENTRENAMIENTO 
%% CON LAS ETIQUETAS ESTIMADAS SOBRE EL CONJUNTO DE VALIDACION
%% PONGO etr A CERO YA QUE NO SE VA A USAR 
%maxIndice != xltr;
%[m n]= size(xltr);
%etr = sum(xltr)/m;
etr=0;
end
