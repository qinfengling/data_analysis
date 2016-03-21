% Time and Temperature
fp = fopen('./temp');
m = textscan(fp, '%s %d8 %d8 %d8');
fclose(fp);

period = cell2mat(m{:,1});
t = datenum(period, 'yyyy-mm-dd/HH:MM:SS');
temp = m{:, 2};
temp0 = m{:, 3};
temp1 = m{:, 4};

hold on
grid minor
grid on

plot(t, temp, 'r*-');
plot(t, temp0, 'g*-');
plot(t, temp1, 'b*-');

datetick('x','mm-dd/HH:MM:SS')
legend('temp', 'temp0', 'temp1');
legend show

NumTicks = 10;
L = get(gca, 'XLim');
set(gca, 'XTick', linspace(L(1), L(2), NumTicks));
set(gca, 'XTickLabelRotation', -45);