function solEDS = EDSeparable()
    %PROGRAMA QUE SOLUCIONA LA ECUACI�N DIFERENCIAL%
    %   dI/dt = 50-5I  con I(t=0) = 0
    %CUYA SOLUCI�N DADA POR MATLAB CON LA CONDICI�N INICIAL ES:
    %   I(t) = 10 - 10*exp(-5*t)
    
    syms I(t) %Definiendo simbolog�a
    eds = diff(I,t) == 50 - 5*I; % Dandole el formato de ED (dI/dt = 50-5I)
    condicion = I(0) == 0; % Condicion inicial
    sol(t) = dsolve( eds, condicion); %Resolviendo la ED
    solEDS = sol(t);    
    
    t = -0.2:0.001:1;% defino un vector t que vaya desde -0.2 hasta 1, con incremento de 0.001
    y = eval( vectorize( solEDS ) );%Evaluo la solucion de la ED con el vector t
    
    %Graficando la solucion particular de la ED
    plot(t,y,'red',0,sol(0),'-o')%Grafico la solucion de la ED y la condicion inicial
    
    title('Gr�fica Soluci�n particular: I(t) = 10 - 10exp(-5t), y cumple que  I(0) = 0')
    xlabel('t')
    ylabel('I(t)')
    legend('I(t) = 10(1 - exp(-5t))','I(0) = 0')
    grid on
    grid minor
    
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    box off
    
    %Mostrando resultados
    fprintf('\nAplicaci�n que resuelove la siguiente ED separable con condici�n inicial\n');
    fprintf('\nEcuaci�n diferencial a solucionar:\n');
    fprintf('\tdI/dt = 50 - 50I  con condici�n inicial  I(0) = 0\n\n');
    
    fprintf('As�, la soluci�n particular para la ED es: \n I(t) = ');
    disp(solEDS);%Mostrar en consola la solucion de la ED
end