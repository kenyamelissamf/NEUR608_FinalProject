% Extract PSD Values from mat files imported from Brainstorm
clear PSDsYoung
clear data
clear varname
PSDsYoung= struct();

%List of subject IDs, session number and task
subjectID = {'MA0901', 'ES0501', 'KM0123', 'SF0429', 'AT0228', 'MC1220', 'JZ0118'};
Session = {'S1', 'S2', 'S3'};
Task = {'Rest', 'PreMovement' 'Movement' 'PostMovement'};

sub = size(subjectID);
ses = size(Session);
task = size(Task);

structrow=1;
%Iterate through subjects, session and task
for i = 1:sub(2)
    for j = 1:ses(2)
        %for k = task(2)
            if i < 8 && j == 1 || i < 6 && j == 2 || i < 5 && j ==3
                structrow = structrow + 1;
                data = load(strcat('PSD_',char(subjectID(i)),'_', char(Session(j)),'_Rest'));
                varname = genvarname(strcat('PSD_',char(subjectID(i)),'_', char(Session(j)),'_Rest'));
                tf = data.(varname).TF;
                name = genvarname(strcat('Power_',char(subjectID(i)),'_', char(Session(j)),'_Rest'));
                power = squeeze(tf);
                PSDsYoung.(name) = power;
                channels = data.(varname).RowNames;
                freqs = data.(varname).Freqs;
                name = genvarname(strcat('Freqs_',char(subjectID(i)),'_', char(Session(j)),'_Rest'));
                PSDsYoung.(name) = freqs;
                name = genvarname(strcat('Channels_',char(subjectID(i)),'_', char(Session(j)),'_Rest'));
                PSDsYoung.(name) = channels;
            else
            end
        %end
    end
end

