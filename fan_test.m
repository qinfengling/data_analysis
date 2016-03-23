t_target = 65;
fan_min = 40;
fan_max = 100;
t_start = 20;
t_end = 80;
t_cur = 67;

hold on
grid on

for t = t_start:t_end
    t_cur = t;
    cur_fan = ck_adjust_fan(t_cur, t_target, fan_min, fan_max);
    plot(t, cur_fan, 'r*-');
end

for t = flip(t_start:t_end)
    t_cur = t;
    cur_fan = ck_adjust_fan(t_cur, t_target, fan_min, fan_max);
    plot(t, cur_fan, 'r+-');
end

last_fan = fan_min;

for t = t_start:t_end
    t_cur = t;
    cur_fan = adjust_fan(last_fan, t_cur, t_target, fan_min, fan_max);
    last_fan = cur_fan;
    plot(t, cur_fan, 'b*-');
end

for t = flip(t_start:t_end)
    t_cur = t;
    cur_fan = adjust_fan(last_fan, t_cur, t_target, fan_min, fan_max);
    last_fan = cur_fan;
    plot(t, cur_fan, 'b+-');
end