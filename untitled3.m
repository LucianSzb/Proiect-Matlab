% Define the folder containing your audio files
folderPath = 'C:\Users\Szabo Lucian\Desktop\facultate\swEA\ora pc'; % Replace 'path_to_your_folder' with the actual folder path

% Get a list of all audio files in the folder
fileList = dir(fullfile(folderPath, '*.m4a')); % Assuming the files are in WAV format, adjust if needed

totalDuration = 0; % Initialize total duration counter

% Loop through each audio file to get its duration
for i = 1:length(fileList)
    filePath = fullfile(folderPath, fileList(i).name);
    audioInfo = audioinfo(filePath);
    
    % Get the duration of the current audio file
    fileDuration = audioInfo.Duration;
    
    % Add the duration of the current file to the total duration
    totalDuration = totalDuration + fileDuration;
    
    disp(['File ' num2str(i) ' Duration: ' num2str(fileDuration) ' seconds']);
end

disp(['Total Duration of all files: ' num2str(totalDuration) ' seconds']);
