% Genre classification between electronic and live music using KNN 
% For AAA Coursework 2
clear; %---Deletes and variables up to this point when the script runs
clc; %---Clears and words in the command window when the script runs
close all; %---Closes all the figures/plots created up to this point when the script runs
mirverbose(0); %---Stop the MIR Toolbox from printing too much information in the command window

%---Getting the analysis parameters from all the tracks
%---Envelope
electronic_env = mirenvelope({'electronic1.wav', 'electronic2.wav', 'electronic3.wav', 'electronic4.wav', 'electronic5.wav', 'electronic6.wav', 'electronic7.wav', 'electronic8.wav', 'electronic9.wav', 'electronic10.wav', 'electronic11.wav', 'electronic12.wav', 'electronic13.wav', 'electronic14.wav', 'electronic15.wav', 'electronic16.wav', 'electronic17.wav', 'electronic18.wav', 'electronic19.wav', 'electronic20.wav'}); %Analysing envelope of each electronic file.
data = get(electronic_env, 'Data'); %---Gets the data of the envelope
electronic_env1 = mean(cell2mat(data{1})); %---Processes multiple files with the MIR Toolbox
electronic_env2 = mean(cell2mat(data{2}));
electronic_env3 = mean(cell2mat(data{3}));
electronic_env4 = mean(cell2mat(data{4}));
electronic_env5 = mean(cell2mat(data{5}));
electronic_env6 = mean(cell2mat(data{6}));
electronic_env7 = mean(cell2mat(data{7}));
electronic_env8 = mean(cell2mat(data{8}));
electronic_env9 = mean(cell2mat(data{9}));
electronic_env10 = mean(cell2mat(data{10}));
electronic_env11 = mean(cell2mat(data{11}));
electronic_env12 = mean(cell2mat(data{12}));
electronic_env13 = mean(cell2mat(data{13}));
electronic_env14 = mean(cell2mat(data{14}));
electronic_env15 = mean(cell2mat(data{15}));
electronic_env16 = mean(cell2mat(data{16}));
electronic_env17 = mean(cell2mat(data{17}));
electronic_env18 = mean(cell2mat(data{18}));
electronic_env19 = mean(cell2mat(data{19}));
electronic_env20 = mean(cell2mat(data{20}));
electronic_env_vector = [electronic_env1, electronic_env2, electronic_env3, electronic_env4, electronic_env5, electronic_env6, electronic_env7, electronic_env8, electronic_env9, electronic_env10, electronic_env11, electronic_env12, electronic_env13, electronic_env14, electronic_env15, electronic_env16, electronic_env17, electronic_env18, electronic_env19, electronic_env20] %---Sets vector variables for the envelope paramater

live_env = mirenvelope({'live1.wav', 'live2.wav', 'live3.wav', 'live4.wav', 'live5.wav', 'live6.wav', 'live7.wav', 'live8.wav', 'live9.wav', 'live10.wav', 'live11.wav', 'live12.wav', 'live13.wav', 'live14.wav', 'live15.wav', 'live16.wav', 'live17.wav', 'live18.wav', 'live19.wav', 'live20.wav'}); %Analysing envelope of each live file.
data = get(live_env, 'Data'); %---Gets the data of the envelope
live_env1 = mean(cell2mat(data{1})); %---Processes multiple files with the MIR Toolbox
live_env2 = mean(cell2mat(data{2}));
live_env3 = mean(cell2mat(data{3}));
live_env4 = mean(cell2mat(data{4}));
live_env5 = mean(cell2mat(data{5}));
live_env6 = mean(cell2mat(data{6}));
live_env7 = mean(cell2mat(data{7}));
live_env8 = mean(cell2mat(data{8}));
live_env9 = mean(cell2mat(data{9}));
live_env10 = mean(cell2mat(data{10}));
live_env11 = mean(cell2mat(data{11}));
live_env12 = mean(cell2mat(data{12}));
live_env13 = mean(cell2mat(data{13}));
live_env14 = mean(cell2mat(data{14}));
live_env15 = mean(cell2mat(data{15}));
live_env16 = mean(cell2mat(data{16}));
live_env17 = mean(cell2mat(data{17}));
live_env18 = mean(cell2mat(data{18}));
live_env19 = mean(cell2mat(data{19}));
live_env20 = mean(cell2mat(data{20}));
live_env_vector = [live_env1, live_env2, live_env3, live_env4, live_env5, live_env6, live_env7, live_env8, live_env9, live_env10, live_env11, live_env12, live_env13, live_env14, live_env15, live_env16, live_env17, live_env18, live_env19, live_env20] %---Sets vector variables for the envelope paramater

%---RMS
electronic_rms = mirrms({'electronic1.wav', 'electronic2.wav', 'electronic3.wav', 'electronic4.wav', 'electronic5.wav', 'electronic6.wav', 'electronic7.wav', 'electronic8.wav', 'electronic9.wav', 'electronic10.wav', 'electronic11.wav', 'electronic12.wav', 'electronic13.wav', 'electronic14.wav', 'electronic15.wav', 'electronic16.wav', 'electronic17.wav', 'electronic18.wav', 'electronic19.wav', 'electronic20.wav'}); %Analysing RMS of each electronic file.
electronic_rms = mirgetdata(electronic_rms) %---Gets the data of the RMS

live_rms = mirrms({'live1.wav', 'live2.wav', 'live3.wav', 'live4.wav', 'live5.wav', 'live6.wav', 'live7.wav', 'live8.wav', 'live9.wav', 'live10.wav', 'live11.wav', 'live12.wav', 'live13.wav', 'live14.wav', 'live15.wav', 'live16.wav', 'live17.wav', 'live18.wav', 'live19.wav', 'live20.wav'}); %Analysing RMS of each live file.
live_rms = mirgetdata(live_rms) %---Gets the data of the RMS

%---Roll Off
electronic_rolloff = mirrolloff({'electronic1.wav', 'electronic2.wav', 'electronic3.wav', 'electronic4.wav', 'electronic5.wav', 'electronic6.wav', 'electronic7.wav', 'electronic8.wav', 'electronic9.wav', 'electronic10.wav', 'electronic11.wav', 'electronic12.wav', 'electronic13.wav', 'electronic14.wav', 'electronic15.wav', 'electronic16.wav', 'electronic17.wav', 'electronic18.wav', 'electronic19.wav', 'electronic20.wav'}); %Analysing roll off of each electronic file.
electronic_rolloff = mirgetdata(electronic_rolloff)%---Gets the data of the roll off

live_rolloff = mirrolloff({'live1.wav', 'live2.wav', 'live3.wav', 'live4.wav', 'live5.wav', 'live6.wav', 'live7.wav', 'live8.wav', 'live9.wav', 'live10.wav', 'live11.wav', 'live12.wav', 'live13.wav', 'live14.wav', 'live15.wav', 'live16.wav', 'live17.wav', 'live18.wav', 'live19.wav', 'live20.wav'}); %Analysing roll off of each live file.
live_rolloff = mirgetdata(live_rolloff) %---Gets the data of the roll off

%---Roughness
electronic_rough = mirroughness({'electronic1.wav', 'electronic2.wav', 'electronic3.wav', 'electronic4.wav', 'electronic5.wav', 'electronic6.wav', 'electronic7.wav', 'electronic8.wav', 'electronic9.wav', 'electronic10.wav', 'electronic11.wav', 'electronic12.wav', 'electronic13.wav', 'electronic14.wav', 'electronic15.wav', 'electronic16.wav', 'electronic17.wav', 'electronic18.wav', 'electronic19.wav', 'electronic20.wav'}); %Analysing roughness of each electronic file.
data = get(electronic_rough, 'Data'); %---Gets the data of the roughness
electronic_rough1 = mean(cell2mat(data{1})); %---Processes multiple files with the MIR Toolbox
electronic_rough2 = mean(cell2mat(data{2}));
electronic_rough3 = mean(cell2mat(data{3}));
electronic_rough4 = mean(cell2mat(data{4}));
electronic_rough5 = mean(cell2mat(data{5}));
electronic_rough6 = mean(cell2mat(data{6}));
electronic_rough7 = mean(cell2mat(data{7}));
electronic_rough8 = mean(cell2mat(data{8}));
electronic_rough9 = mean(cell2mat(data{9}));
electronic_rough10 = mean(cell2mat(data{10}));
electronic_rough11 = mean(cell2mat(data{11}));
electronic_rough12 = mean(cell2mat(data{12}));
electronic_rough13 = mean(cell2mat(data{13}));
electronic_rough14 = mean(cell2mat(data{14}));
electronic_rough15 = mean(cell2mat(data{15}));
electronic_rough16 = mean(cell2mat(data{16}));
electronic_rough17 = mean(cell2mat(data{17}));
electronic_rough18 = mean(cell2mat(data{18}));
electronic_rough19 = mean(cell2mat(data{19}));
electronic_rough20 = mean(cell2mat(data{20}));
electronic_rough_vector = [electronic_rough1, electronic_rough2, electronic_rough3, electronic_rough4, electronic_rough5, electronic_rough6, electronic_rough7, electronic_rough8, electronic_rough9, electronic_rough10, electronic_rough11, electronic_rough12, electronic_rough13, electronic_rough14, electronic_rough15, electronic_rough16, electronic_rough17, electronic_rough18, electronic_rough19, electronic_rough20] %---Sets vector variables for the roughness paramater

live_rough = mirroughness({'live1.wav', 'live2.wav', 'live3.wav', 'live4.wav', 'live5.wav', 'live6.wav', 'live7.wav', 'live8.wav', 'live9.wav', 'live10.wav', 'live11.wav', 'live12.wav', 'live13.wav', 'live14.wav', 'live15.wav', 'live16.wav', 'live17.wav', 'live18.wav', 'live19.wav', 'live20.wav'}); %Analysing roughness of each live file.
data = get(live_rough, 'Data'); %---Gets the data of the roughness
live_rough1 = mean(cell2mat(data{1})); %---Processes multiple files with the MIR Toolbox
live_rough2 = mean(cell2mat(data{2}));
live_rough3 = mean(cell2mat(data{3}));
live_rough4 = mean(cell2mat(data{4}));
live_rough5 = mean(cell2mat(data{5}));
live_rough6 = mean(cell2mat(data{6}));
live_rough7 = mean(cell2mat(data{7}));
live_rough8 = mean(cell2mat(data{8}));
live_rough9 = mean(cell2mat(data{9}));
live_rough10 = mean(cell2mat(data{10}));
live_rough11 = mean(cell2mat(data{11}));
live_rough12 = mean(cell2mat(data{12}));
live_rough13 = mean(cell2mat(data{13}));
live_rough14 = mean(cell2mat(data{14}));
live_rough15 = mean(cell2mat(data{15}));
live_rough16 = mean(cell2mat(data{16}));
live_rough17 = mean(cell2mat(data{17}));
live_rough18 = mean(cell2mat(data{18}));
live_rough19 = mean(cell2mat(data{19}));
live_rough20 = mean(cell2mat(data{20}));
live_rough_vector = [live_rough1, live_rough2, live_rough3, live_rough4, live_rough5, live_rough6, live_rough7, live_rough8, live_rough9, live_rough10, live_rough11, live_rough12, live_rough13, live_rough14, live_rough15, live_rough16, live_rough17, live_rough18, live_rough19, live_rough20] %---Sets vector variables for the roughness paramater

%---Onsets
electronic_ons =mironsets({'electronic1.wav', 'electronic2.wav', 'electronic3.wav', 'electronic4.wav', 'electronic5.wav', 'electronic6.wav', 'electronic7.wav', 'electronic8.wav', 'electronic9.wav', 'electronic10.wav', 'electronic11.wav', 'electronic12.wav', 'electronic13.wav', 'electronic14.wav', 'electronic15.wav', 'electronic16.wav', 'electronic17.wav', 'electronic18.wav', 'electronic19.wav', 'electronic20.wav'}); %Analysing onsets of each electronic file.
data = get(electronic_ons, 'Data'); %---Gets the data of the onsets
electronic_ons1 = mean(cell2mat(data{1})); %---Processes multiple files with the MIR Toolbox
electronic_ons2 = mean(cell2mat(data{2}));
electronic_ons3 = mean(cell2mat(data{3}));
electronic_ons4 = mean(cell2mat(data{4}));
electronic_ons5 = mean(cell2mat(data{5}));
electronic_ons6 = mean(cell2mat(data{6}));
electronic_ons7 = mean(cell2mat(data{7}));
electronic_ons8 = mean(cell2mat(data{8}));
electronic_ons9 = mean(cell2mat(data{9}));
electronic_ons10 = mean(cell2mat(data{10}));
electronic_ons11 = mean(cell2mat(data{11}));
electronic_ons12 = mean(cell2mat(data{12}));
electronic_ons13 = mean(cell2mat(data{13}));
electronic_ons14 = mean(cell2mat(data{14}));
electronic_ons15 = mean(cell2mat(data{15}));
electronic_ons16 = mean(cell2mat(data{16}));
electronic_ons17 = mean(cell2mat(data{17}));
electronic_ons18 = mean(cell2mat(data{18}));
electronic_ons19 = mean(cell2mat(data{19}));
electronic_ons20 = mean(cell2mat(data{20}));
electronic_ons_vector = [electronic_ons1, electronic_ons2, electronic_ons3, electronic_ons4, electronic_ons5, electronic_ons6, electronic_ons7, electronic_ons8, electronic_ons9, electronic_ons10, electronic_ons11, electronic_ons12, electronic_ons13, electronic_ons14, electronic_ons15, electronic_ons16, electronic_ons17, electronic_ons18, electronic_ons19, electronic_ons20] %---Sets vector variables for the onsets paramater

live_ons =mironsets({'live1.wav', 'live2.wav', 'live3.wav', 'live4.wav', 'live5.wav', 'live6.wav', 'live7.wav', 'live8.wav', 'live9.wav', 'live10.wav', 'live11.wav', 'live12.wav', 'live13.wav', 'live14.wav', 'live15.wav', 'live16.wav', 'live17.wav', 'live18.wav', 'live19.wav', 'live20.wav'}); %Analysing onsets of each live file.
data = get(live_ons, 'Data'); %---Gets the data of the onsets
live_ons1 = mean(cell2mat(data{1})); %---Processes multiple files with the MIR Toolbox
live_ons2 = mean(cell2mat(data{2}));
live_ons3 = mean(cell2mat(data{3}));
live_ons4 = mean(cell2mat(data{4}));
live_ons5 = mean(cell2mat(data{5}));
live_ons6 = mean(cell2mat(data{6}));
live_ons7 = mean(cell2mat(data{7}));
live_ons8 = mean(cell2mat(data{8}));
live_ons9 = mean(cell2mat(data{9}));
live_ons10 = mean(cell2mat(data{10}));
live_ons11 = mean(cell2mat(data{11}));
live_ons12 = mean(cell2mat(data{12}));
live_ons13 = mean(cell2mat(data{13}));
live_ons14 = mean(cell2mat(data{14}));
live_ons15 = mean(cell2mat(data{15}));
live_ons16 = mean(cell2mat(data{16}));
live_ons17 = mean(cell2mat(data{17}));
live_ons18 = mean(cell2mat(data{18}));
live_ons19 = mean(cell2mat(data{19}));
live_ons20 = mean(cell2mat(data{20}));
live_ons_vector = [live_ons1, live_ons2, live_ons3, live_ons4, live_ons5, live_ons6, live_ons7, live_ons8, live_ons9, live_ons10, live_ons11, live_ons12, live_ons13, live_ons14, live_ons15, live_ons16, live_ons17, live_ons18, live_ons19, live_ons20] %---Sets vector variables for the onsets paramater

%---plotting means
%---Envelope
electronic_env_mean = mean(electronic_env_vector); %---Gets the mean value from all of the electronic files using the envelope paramater
live_env_mean = mean(live_env_vector); %---Gets the mean value from all of the live files using the envelope paramater
figure(1); %---Creates new figure
bar([electronic_env_mean, live_env_mean], 0.5), %---Plots the mean envelope information in a bar chart
set(gca,'XTickLabel',{'electronic','live'}), xlabel('Envelope'); %---Labels the X & Y axis

%---rms
electronic_rms_mean = mean(electronic_rms); %---Gets the mean value from all of the electronic files using the RMS paramater
live_rms_mean = mean(live_rms); %---Gets the mean value from all of the live files using the RMS paramater
figure(2); %---Creates new figure
bar([electronic_rms_mean, live_rms_mean], 0.5), %---Plots the mean RMS information in a bar chart 
set(gca,'XTickLabel',{'electronic','live'}), xlabel('RMS'); %---Labels the X & Y axis

%---Roll Off
electronic_rolloff_mean = mean(electronic_rolloff); %---Gets the mean value from all of the electronic files using the roll off paramater
live_rolloff_mean = mean(live_rolloff); %---Gets the mean value from all of the live files using the roll off paramater
figure(3); %---Creates new figure
bar([electronic_rolloff_mean, live_rolloff_mean], 0.5), %---Plots the mean roll off information in a bar chart
set(gca,'XTickLabel',{'electronic','live'}), xlabel('Roll Off'); %---Labels the X & Y axis

%---Roughness
electronic_rough_mean = mean(electronic_rough_vector); %---Gets the mean value from all of the electronic files using the roughness paramater
live_rough_mean = mean(live_rough_vector); %---Gets the mean value from all of the live files using the roughness paramater

figure(4); %---Creates new figure
bar([electronic_rough1, electronic_rough10, electronic_rough13, live_rough4, live_rough12, live_rough14], 0.5),   %---Plots a few induvidual values for both electronic and live roughness information in a bar chart
set(gca,'XTickLabel',{'electronic 1','electronic 2', 'electronic 3', 'live 1', 'live 2', 'live 3'}), xlabel('Roughness'); %---Labels the X & Y axis


figure(5); %---Creates new figure 
bar([electronic_rough_mean, live_rough_mean], 0.5), %---Plots the mean roughness information in a bar chart
set(gca,'XTickLabel',{'electronic','live'}), xlabel('Roughness'); %---Labels the X & Y axis

%---Onsets
electronic_ons_mean = mean(electronic_ons_vector); %---Gets the mean value from all of the electronic files using the onsets paramater
live_ons_mean = mean(live_ons_vector); %---Gets the mean value from all of the live files using the onsets paramater
figure(6); %---Creates new figure
bar([electronic_ons_mean, live_ons_mean], 0.5), %---Plots the mean onsets information in a bar chart
set(gca,'XTickLabel',{'electronic','live'}), xlabel('Onsets'); %---Labels the X & Y axis

%---New Music Classification
%---Putting all analysis data into one matrix----
electronic = [electronic_env_vector; electronic_rms; electronic_rolloff; electronic_rough_vector; electronic_ons_vector]';
live = [live_env_vector; live_rms; live_rolloff; live_rough_vector; live_ons_vector]';
train_data = [electronic; live]

%---Class Vector
%---Vector to store classes (indicates which class the data rows belong to)
%---1 is electronic, 2 is live
classes = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2]';

%---loading and analysis of a new file
new_env = mirenvelope('electronic_test1.wav'); %---Analysis of a new track and assigning it a new variable with the envelope paramater 
new_env = mirgetdata(new_env) %---Getting the data from the new file analysis
new_env_mean = mean(new_env) %---Getting the mean from the new file analysis 
new_rms = mirrms('electronic_test1.wav'); %---Analysis of a new track and assigning it a new variable with the RMS paramater
new_rms = mirgetdata(new_rms) %---Getting the data from the new file analysis
new_rolloff = mirrolloff('electronic_test1.wav'); %---Analysis of a new track and assigning it a new variable with the roll off paramater
new_rolloff = mirgetdata(new_rolloff) %---Getting the data from the new file analysis
new_rough = mirroughness('electronic_test1.wav'); %---Analysis of a new track and assigning it a new variable with the roughness paramater
new_rough = mirgetdata(new_rough) %---Getting the data from the new file analysis
new_rough_mean = mean(new_rough) %---Getting the mean from the new file analysis
new_ons =mironsets('electronic_test1.wav'); %---Analysis of a new track and assigning it a new variable with the onsets paramater
new_ons = mirgetdata(new_ons) %---Getting the data from the new file analysis
new_ons_mean = mean(new_ons)

new = [new_env_mean, new_rms, new_rolloff, new_rough_mean, new_ons_mean]; %--Creates a variable xalled new which stroes the new tracks values from each paramater

%---KNN classifier
[locations, dist] = knnsearch(train_data, new, 'k', 5); %---Finds the ?nearest neighbors? in the training data to our new track.  It returns two values the locations of the nearest neighbours in our training data, and the distance between these tracks and the new track.

%---locations of the nearest neighbours
new_class=classes(locations) %---Finds the class number (1 or 2, meaning electronic or live) for the tracks the knnsearch() algorithm has identified.

%---Printing the classification decision
if mode(new_class) == 1 %---If the new class comes back as a one it will be considered an electronic track
 disp('new sample is electronic')
else %---If the class comes back as anything else other than 1 then it will be considered a live track
 disp('new sample is live')
end %---Ends the decision making process

%---Frequency analysis using a spectrogram.
[input_file, Fs] = audioread('electronic_test1.wav');
input_file = input_file(:,1);
figure(7);
plot(input_file);
win = 256; %sets the size of the windows
overlap = 128; %How many samples the windows will overlap by
fft_size = win; %the size of the FFT.
figure(8); %---Creates new figure
spectrogram(input_file, win, overlap, fft_size, Fs, 'yaxis'); %---Plots spectrogram

%---Scatter Plots
%---Envelope vs RMS
figure(9) %---Creates new figure
gscatter(train_data(:,1), train_data(:, 2), classes, 'rb', 'ox',5, 'on', 'Envelope', 'RMS'), xlim([0,0.4]), ylim([0,0.5]); %---Creates scatter plot and placing the Envelope on the x axis and the rms on the y axis, electronic and live data is poltted in red and blue respectively using o and x as symbols and being a size of 5 points.  X and Y axis limits are also set. 
hold on; %---Holds the current figure so we can add new information to it.
gscatter(new(1), new(2), 3, 'm', '*'), legend ('Electronic', 'Live', 'new'); %---Legend is added to the figure so we know what the data points represent.

%---Roll Off vs Roughness
figure(10) %---Creates new figure
gscatter(train_data(:,3), train_data(:, 4), classes, 'rb', 'ox',5, 'on', 'Roll Off', 'Roughness'), xlim([0,11500]), ylim([0,2700]); %---Creates scatter plot and placing the roll off on the x axis and the roughness on the y axis, electronic and live data is poltted in red and blue respectively using o and x as symbols and being a size of 5 points.  X and Y axis limits are also set.
hold on; %---Holds the current figure so we can add new information to it.
gscatter(new(3), new(4), 3, 'm', '*'), legend ('Electronic', 'Live', 'new'); %---Legend is added to the figure so we know what the data points represent.

%---Envelope vs Roughness
figure(11) %---Creates new figure
gscatter(train_data(:,1), train_data(:, 4), classes, 'rb', 'ox',5, 'on', 'Envelope', 'Roughness'), xlim([0,0.4]), ylim([0,2700]); %---Creates scatter plot and placing the Envelope on the x axis and the roughness on the y axis, electronic and live data is poltted in red and blue respectively using o and x as symbols and being a size of 5 points.  X and Y axis limits are also set.
hold on; %---Holds the current figure so we can add new information to it.
gscatter(new(1), new(4), 3, 'm', '*'), legend ('Electronic', 'Live', 'new'); %---Legend is added to the figure so we know what the data points represent.

%---Roll Off vs RMS
figure(12) %---Creates new figure
gscatter(train_data(:,3), train_data(:, 2), classes, 'rb', 'ox',5, 'on', 'Roll Off', 'RMS'), xlim([0,11500]), ylim([0,0.5]); %---Creates scatter plot and placing the roll off on the x axis and the rms on the y axis, electronic and live data is poltted in red and blue respectively using o and x as symbols and being a size of 5 points.  X and Y axis limits are also set.
hold on; %---Holds the current figure so we can add new information to it.
gscatter(new(3), new(2), 3, 'm', '*'), legend ('Electronic', 'Live', 'new'); %---Legend is added to the figure so we know what the data points represent.

%---Subplot of Amplitude Envelopes
electronic_env4 = mirenvelope('electronic1.wav');
electronic_env4 = mirgetdata(electronic_env4);
live_env19 = mirenvelope('live1.wav');
live_env19 = mirgetdata(live_env19);
figure(13)
subplot(2,1,1), plot(electronic_env4), xlabel('time'), ylabel('amplitude');
subplot(2,1,2), plot(live_env19), xlabel('time'), ylabel('amplitude');

%---Plotting of a FFT
[input_file, Fs] = audioread('live1.wav'); %---Loads the wav file and stores it in a variable called input_file also stores the sample rate in a variable called Fs.
raw_freq_data = fft(input_file); %---Uses the fft() function and applies it to the input audio file. 
[rows, cols] = size(raw_freq_data); %--- Finds how many rows and columns are in the analysis data.
selection = floor(rows/2); %---Calculates the half way point in the data.
freq_data = raw_freq_data(1:selection, :); %--- Selects only the first half of the FFT and store it in a variable called freq_data.
freq_data = abs(freq_data); %--- Uses the abs() function to do a number conversion.
x = 0:selection-1; %---Creates a vector of sequential values called x, the length of the frequency data, starting at 0
resolution = Fs/rows; %---Calculates the resolution of the FFT 
freq_labels = resolution * x; %---Creates a string of frequency values we can use for the X axis of the figure.
figure(14); %---Creats new figure
plot(freq_labels, freq_data), xlabel('Frequency, Hz'), ylabel('magnitude'); %---Plots FFT reading