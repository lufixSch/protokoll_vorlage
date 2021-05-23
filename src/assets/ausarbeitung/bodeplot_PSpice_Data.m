function bodeplot_PSpice_Data(filename, current_figure)
%   reads PSpice data from textfile *.txt
%   with current figure the used figures can be reutilized in order 
%   to plot multiple bode diagramms in one figure 
%   if not wanted: change variabel current_figure after every functioncall
%   expects three columns with values and a header line 
%   first column  frequency values
%   second column magnitue in dB or phase in degree (order checked by header)
%   third column  magnitue in dB or phase in degree
%
%  Frequency             DB(V(VOUT))           P(V(VOUT))           
%  1.000000000000e+000  -3.360131119644e+001  -7.485043267530e+001  
%  1.023292992281e+000  -3.337958204644e+001  -7.453289329301e+001  
%  1.047128548051e+000  -3.315695724945e+001  -7.421023671458e+001  

fileID = fopen(filename,'rt');
 first_col = fscanf(fileID,'%s',1);             % read the first col text
 second_col = fscanf(fileID,'%s',1);             % read the second col text
 third_col = fscanf(fileID,'%s',1);             % read the second col text
[A, count] = fscanf(fileID,'%f %f %f',[3,inf]); % read all numeric values
fclose(fileID);

if strncmp(second_col,'DB',2)   % check column order
    phi = A(3,:)*pi()/180;
else
    phi = A(2,:)*pi()/180;
end
phi = unwrap(phi)*180/pi();     % unwrap the phase values

figure(current_figure);
subplot(2,1,1);
if strncmp(second_col,'DB',2)   % check column order
    semilogx(A(1,:),A(2,:),'DisplayName','Simulation');
else
    semilogx(A(1,:),A(3,:),'DisplayName','Simulation');
end

%xlabel('f/Hz');
ylabel('Gain in dB $\rightarrow$', 'interpreter', 'latex');
title('Gain');
legend;
hold on;
grid on;

subplot(2,1,2);
semilogx(A(1,:),phi,'DisplayName','Simulation');

title('Phase');
xlabel('$f$ in Hz $\rightarrow$', 'interpreter', 'latex');
ylabel('$\phi$ in $^{\circ}$', 'interpreter', 'latex');
legend;
hold on;
grid on;
end
