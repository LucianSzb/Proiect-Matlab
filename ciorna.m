% Numele fișierelor audio
ora = 'esteOra.m4a';
si = 'si.m4a';
minute = 'deMinute.m4a';
secunde = 'deSecunde.m4a';

% Obținerea frecvenței de eșantionare pentru fiecare fișier audio
[~, Fs1] = audioread(ora);
[~, Fs2] = audioread(si);
[~, Fs3] = audioread(minute);
[~, Fs4] = audioread(secunde);

% Citirea fișierelor audio
[y1, ~] = audioread(ora);
[y2, ~] = audioread(si);
[y3, ~] = audioread(minute);
[y4, ~] = audioread(secunde);

% Redarea fișierelor în ordine, respectând frecvența de eșantionare
sound(y1, Fs1); % Redare ora
pause(length(y1)/Fs1 + 1); % Pauză între redări

sound(y2, Fs2); % Redare si
pause(length(y2)/Fs2 + 1); % Pauză între redări

sound(y3, Fs3); % Redare deMinute
pause(length(y3)/Fs3 + 1); % Pauză între redări

sound(y4, Fs4); % Redare deSecunde
