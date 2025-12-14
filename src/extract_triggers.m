function trig = extract_triggers(S, Fs)

L = length(S);
delta_trig = S(2:L,17) - S(1:L-1,17);
trig = find(delta_trig > 0);

T_debounce = 0.5;
dt_trig = diff(trig);
trig(dt_trig < Fs*T_debounce) = [];

end
