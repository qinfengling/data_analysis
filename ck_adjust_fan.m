function [fan] = ck_adjust_fan(t_cur, t_target, fan_min, fan_max)
    fandiff = fan_max - fan_min;
    diff = t_cur - t_target + 22;
    if (diff > 32)
        diff = 32;
    elseif (diff < 0)
        diff = 0;
    end
    diff = diff * diff;
    fandiff = fandiff * diff / 1024;
    fan = fan_min + fandiff;