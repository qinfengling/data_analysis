function [fan] = adjust_fan(last_fan, t_cur, t_target, fan_min, fan_max)
    fan = last_fan;
    if (t_cur > t_target + 4)
        fan = fan_max;
    elseif (t_cur > t_target + 2)
        fan = last_fan + 20;
    elseif (t_cur > t_target + 1)
        fan = last_fan + 4;
    elseif (t_cur < t_target - 1)
        fan = last_fan - 4;
    elseif (t_cur < t_target - 10)
        fan = fan_min;
    end

    if (fan < fan_min)
        fan = fan_min;
    end
    if (fan > 100)
        fan = 100;
    end