%Optimización
%Diana Valentina Uscategui Tobo
%Neider Puentes Sanchez
clear all;
clc;
syms x1 x2 x3 xa1 xa2 xa3 e x dx1 dx2 dx3 t;
i=0;

%msj = 'Por favor digite la función del problema a optimizar: \n';
%strr = input(msj,'s');
%fun = str2func(['@(x1,x2)',strr]);
fun=x1^2+x2^2+2*x3^2-x1*x2-x2*x3-x1*x3;
%fun=2*x1*x2+2*x2-x1^2-2*x2^2;
msj = 'Ingrese el numero de variables de la función: \n';
var = input(msj);
msj = 'Ingrese el valor de la primera variable: \n';
xa1 = input(msj);
msj = 'Ingrese el valor de la segunda variable: \n';
xa2 = input(msj);
msj = 'Ingrese el valor de la tercera variable: \n';
if var>2
    xa3 = input(msj);
end
msj = 'Ingrese el valor de la tolerancio del error: \n';
e = input(msj);
%decisión caso
prompt = 'digita mx para maximizar o mn para minizar, según sea su caso: \n';
str = input(prompt,'s');


%Derivada de la función
dx1= diff(fun,x1,1);
dx2= diff(fun,x2,1);
dx3= diff(fun,x3,1);
d1 = double(subs(dx1,{x1,x2,x3},{xa1,xa2,xa3}));
d2 = double(subs(dx2,{x1,x2,x3},{xa1,xa2,xa3}));
d3 = double(subs(dx3,{x1,x2,x3},{xa1,xa2,xa3}));
disp(d1);
disp(d2);
disp(d3);

if str=='mx'
    if abs(d1)>e || abs(d2)>e || abs(d3)>e
        while true
            xa1 = xa1+ t*d1;
            xa2 = xa2+ t*d2;
            xa3 = xa3+ t*d3;
            %funcion evaluada en el nuevo x1 y x2
            dfun =(subs(fun,{x1,x2,x3},{xa1,xa2,xa3}));
            %derivada con respecto a t
            dtfun= diff(dfun,t,1)==0;
            %hallar valor de t
            tv = solve(dtfun,t);
            xa1 = subs(xa1,{t},{tv});
            xa2 = subs(xa2,{t},{tv});
            xa3 = subs(xa3,{t},{tv});
            %evalur las derivadas en los nuevos x
            d1 = double(subs(dx1,{x1,x2,x3},{xa1,xa2,xa3}));
            d2 = double(subs(dx2,{x1,x2,x3},{xa1,xa2,xa3}));
            d3 = double(subs(dx3,{x1,x2,x3},{xa1,xa2,xa3}));
            %dtfun = double(subs(dfun,{t},{xa1}));
            i=i+1;
            disp(d1);
            disp(d2);
            if abs(d1)<e && abs(d2)<e && abs(d3)<e
                break
            end
        end
    end
end
if str=='mn'
    if abs(d1)>e || abs(d2)>e || abs(d3)>e
        while true
            xa1 = xa1+(t*(-1*d1));
            xa2 = xa2+(t*(-1*d2));
            xa3 = xa3+(t*(-1*d3));
            %funcion evaluada en el nuevo x1 y x2
            dfun =(subs(fun,{x1,x2,x3},{xa1,xa2,xa3}));
            %derivada con respecto a t
            dtfun= diff(dfun,t,1)==0;
            %hallar valor de t
            tv = solve(dtfun,t);
            xa1 = subs(xa1,{t},{tv});
            xa2 = subs(xa2,{t},{tv});
            xa3 = subs(xa3,{t},{tv});
            %evalur las derivadas en los nuevos x
            d1 = double(subs(dx1,{x1,x2,x3},{xa1,xa2,xa3}));
            d2 = double(subs(dx2,{x1,x2,x3},{xa1,xa2,xa3}));
            d3 = double(subs(dx3,{x1,x2,x3},{xa1,xa2,xa3}));
            %dtfun = double(subs(dfun,{t},{xa1}));
            i=i+1;
            disp(d1);
            disp(d2);
            disp(d3);
            if abs(d1)<e && abs(d2)<e && abs(d3)<e
                break
            end
        end
    end
end


fprintf('Se Realizaron : %d Iteraciones', i);
fprintf('\nEl valor de x1 es: %8.12f == %s', xa1, xa1);

fprintf('\nEl valor de x2 es: %8.12f == %s', xa2, xa2);

if var>2
    fprintf('\nEl valor de x3 es: %8.12f == %s', xa3, xa3);
end
funv=double(subs(fun, {x1,x2,x3}, {xa1,xa2,xa3}));
fprintf('\nEl valor de la función es: %8.12f\n', funv);
if var==2
    fprintf('El valor del gradiente es:(%8.12f,%8.12f)',d1,d2);
else
    fprintf('El valor del gradiente es:(%8.12f, %8.12f, %8.12f)',d1,d2,d3);
end