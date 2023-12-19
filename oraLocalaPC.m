
% Obține ora locală
currentTime = clock;



% Afișează ora locală
fprintf('Ora curentă este: %02d:%02d:%02d\n', currentTime(4), currentTime(5), fix(currentTime(6)))


% Start time measurement
tic;

% Your code to play sound files goes here
% For example:
fileNames = {'si.m4a', 'esteOra.m4a', 'unu.m4a'};
for i = 1:numel(fileNames)
    [y, Fs] = audioread(fileNames{i});
    sound(y, Fs);
    pause(length(y)/Fs); % Pause to play the entire sound
end

% End time measurement
elapsedTime = toc;
disp(['Total time taken: ' num2str(elapsedTime) ' seconds']);
