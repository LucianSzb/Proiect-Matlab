%functioneaza dar mai am de optimizat 
% Apelul funcției cu currentTime
% Obține ora locală
currentTime = clock;
ora='esteOra.m4a';
si='si.m4a';
minute='deMinute.m4a';
secunde='deSecunde.m4a';
fprintf('A fost ora: %02d:%02d:%02d\n', currentTime(4), currentTime(5), fix(currentTime(6)))
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
playNumberAsAudio(currentTime(4));
sound(y2, Fs2); % Redare si
pause(length(y2)/Fs2 + 1); % Pauză între redări
playNumberAsAudio(currentTime(5));
sound(y3, Fs3); % Redare deMinute
pause(length(y3)/Fs3 + 1); % Pauză între redări
sound(y2, Fs2); % Redare si
pause(length(y2)/Fs2 + 1); % Pauză între redări
playNumberAsAudio(fix(currentTime(6)));

sound(y4, Fs4); % Redare deSecunde
    

function playNumberAsAudio(numar)
% Definirea listelor de fișiere audio pentru fiecare categorie
audioFiles = {'unu.m4a', 'doi.m4a', 'trei.m4a', 'patru.m4a', 'cinci.m4a', 'sase.m4a', 'sapte.m4a', 'opt.m4a', 'noua.m4a'};
specialFiles={'unsprezece.m4a','doisprezece.m4a','treisprezece.m4a','paisprezece.m4a','cincisprezece.m4a','saisprezece.m4a','saptesprezece.m4a','optasprezece.m4a','nouasprezece.m4a'};
zeciFiles = {'zece.m4a', 'douazeci.m4a', 'treizeci.m4a', 'patruzeci.m4a', 'cincizeci.m4a', 'saizeci.m4a', 'saptezeci.m4a', 'optzeci.m4a', 'nouazeci.m4a'};
suteFiles = {'osuta.m4a', 'douasute.m4a', 'treisute.m4a', 'patrusute.m4a', 'cincisute.m4a', 'sasesute.m4a', 'saptesute.m4a', 'optsute.m4a', 'nouasute.m4a'};
miimiFiles = {'omie.m4a', 'douami.m4a', 'treimi.m4a', 'patrumi.m4a', 'cincimi.m4a', 'sasemi.m4a', 'saptemi.m4a', 'optmi.m4a', 'nouami.m4a'};
siFile = 'si.m4a';

% Completarea numărului cu zerouri în față pentru a avea exact 4 cifre
numar = sprintf('%04d', numar);

% Convertirea numărului într-un vector de cifre individuale
cifre = num2str(numar) - '0';

% Redarea sunetului corespunzător fiecărei cifre
for i = 1:length(cifre)
    cifra = cifre(i);
    if cifra == 0
        continue; % Sari la următoarea iterație dacă cifra curentă este zero
    end
    
    switch i
        case 1 % miimi
            sound(audioread(miimiFiles{cifra}), 44100);
        case 2 % sute
            sound(audioread(suteFiles{cifra}), 44100);
        case 3 % zeci
            if cifra == 1 && cifre(i+1) ~= 0 % verifica cifra unităților pentru intervalul [11,19]
                sound(audioread(specialFiles{cifre(i+1)}), 44100);
                pause(1); % Așteaptă 1 secundă între redarea specială și următoarea cifră
                break;
            else
                sound(audioread(zeciFiles{cifra}), 44100);
                pause(1); % Așteaptă 1 secundă între redarea cifrei zecilor și fișierul special
                sound(audioread(siFile), 44100);
                pause(0.2); % Așteaptă 0.2 secunde între redarea fișierului special și cifra unităților
            end
        case 4 % unități
            sound(audioread(audioFiles{cifra}), 44100);
        otherwise
            disp('Numărul introdus are mai mult de 4 cifre.');
            break;
    end
    pause(1); % Așteaptă 1 secundă între redarea fiecărei cifre
end
end

