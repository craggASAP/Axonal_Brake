%% give inhibition values at 2ms interval

moving_time=zeros(100,1);
moving_time(1:100,1)=2:2:200;
inhibition_DLS=zeros(100,1);
inhibition_DLS(1:3,1)=-0.14*moving_time(1:3,1)+1;
inhibition_DLS(4:100,1)=-0.00002*moving_time(4:100,1).^2+0.0087*moving_time(4:100,1)+0.06;
inhibition_NAcc=ones(100,1);
inhibition_NAcc(1:3,1)=-0.0773*moving_time(1:3,1)+1;
inhibition_NAcc(4:25,1)=-0.00009*moving_time(4:25,1).^2+0.015*moving_time(4:25,1)+0.3861;
inhibition_NAcc(26:50,1)=0.0013*moving_time(26:50,1)+0.866;

%% setup ChI & DA firing rates
baseline_time=10000;

time_of_recording=zeros(3000+baseline_time,1);
time_of_recording=(1:1:3000+baseline_time)';

ChI_firing_rate=zeros(3000+baseline_time,1);
ChI_baseline_firing_rate=3;
ChI_increase_firing_rate=12;
ChI_firing_rate(:,1)=ChI_baseline_firing_rate;

%initial excitation
ChI_firing_rate(1033+baseline_time/2:1076+baseline_time/2,1)=ChI_increase_firing_rate/2*(sin((1/44*pi-pi/2):1/44*pi:pi/2)+1)+ChI_baseline_firing_rate;
ChI_firing_rate(1077+baseline_time/2:1120+baseline_time/2,1)=ChI_increase_firing_rate*sin((1/88*pi+pi/2):1/88*pi:pi)+ChI_baseline_firing_rate;
%pause & rebound
ChI_firing_rate(1121+baseline_time/2:1224+baseline_time/2,1)=ChI_baseline_firing_rate-ChI_baseline_firing_rate*sin(1/104*pi:1/104*pi:pi);
ChI_firing_rate(1225+baseline_time/2:(1225+60-1+baseline_time/2),1)=ChI_increase_firing_rate*sin(1/60/2*pi:1/60/2*pi:pi/2)+ChI_baseline_firing_rate;
ChI_firing_rate(1285+baseline_time/2:1452+baseline_time/2,1)=ChI_increase_firing_rate/2*(sin((1/168*pi+pi/2):1/168*pi:3*pi/2)+1)+ChI_baseline_firing_rate;

DA_firing_rate=zeros(3000+baseline_time,1);
DA_baseline_firing_rate=6;
DA_increase_firing=9;
DA_firing_rate(:,1)=DA_baseline_firing_rate;

DA_firing_rate(1043+baseline_time/2:1150+baseline_time/2)=DA_increase_firing/2*(sin((1/216*pi-pi/2):2/216*pi:(pi/2))+1)+DA_baseline_firing_rate;
DA_firing_rate(1151+baseline_time/2:1220+baseline_time/2)=DA_increase_firing/2*(sin((1/280*pi+pi/2):2/280*pi:pi)+1)+DA_baseline_firing_rate;
DA_firing_rate(1221+baseline_time/2:1344+baseline_time/2)=DA_increase_firing/2*(sin((1/248/2*pi+pi):1/248*pi:(3*pi/2))+1)+DA_baseline_firing_rate;

%% Calculate desensitisation score
DLS_desensitize=zeros(length(time_of_recording),1);
NAcc_desensitize=zeros(length(time_of_recording),1);

time_desensitisation_to_calculate = 1076+baseline_time/2;
if ChI_firing_rate(time_desensitisation_to_calculate) == 15
    for i=time_desensitisation_to_calculate+50:time_desensitisation_to_calculate+500 % find time to start score desensitisation
        x=i-time_desensitisation_to_calculate;
        DLS_desensitize(i)=0.25*(-1.715e-11*(x^4) + 6.838e-08*(x^3) -5.676e-05*(x^2) +  0.01343*x + 0.005743);
        NAcc_desensitize(i)=0.25*(-1.194e-10*x^4 + 1.464e-07*x^3 -6.038e-05*x^2 + 0.008542*x - 0.01853) ;
    end  
end

NAcc_desensitize(find(NAcc_desensitize < 0))=0;

%% Define inhibition efficiency
inhibition_efficiency_scale=(0:15/1500:15)';
% inhibition_efficiency=ones(1501,3);
inhibition_efficiency=zeros(1501,3);

%inhibition intensity
iefficiency_leave0=3; iefficiency_reach1=7;  %3,7; 2.5,4.45; 2.5,3;
%iefficiency_leave0=2.5; iefficiency_reach1=4.45;
%iefficiency_leave0=2.5; iefficiency_reach1=3;

inhibition_efficiency(iefficiency_leave0*100+1:iefficiency_reach1*100,1)=sqrt((inhibition_efficiency_scale((iefficiency_leave0*100+1:iefficiency_reach1*100))-iefficiency_leave0)/(iefficiency_reach1-iefficiency_leave0));
inhibition_efficiency(iefficiency_reach1*100+1:1501,1)=1;




%% Calculate ChI-dependent depression score DLS
ChI_depression_score=zeros(4000+baseline_time,1);
Step_of_depression=1;


for i=Step_of_depression:Step_of_depression:length(time_of_recording)
    
    for j=1:1501
        if inhibition_efficiency_scale(j) <= ChI_firing_rate(i)
            position_in_scale=j;
        end
    end
    for k=0:99
        if ChI_depression_score(i+k)<inhibition_efficiency(position_in_scale,1) * (1-inhibition_DLS(k+1))
            ChI_depression_score(i+k)=inhibition_efficiency(position_in_scale,1) * (1-inhibition_DLS(k+1));
        end
    end
end



%% Normalise ChI-dependent depression score
for i = 1:length(time_of_recording)
    ChI_depression_score(i)=ChI_depression_score(i)*(1-DLS_desensitize(i));
end

Normalised_score_DLS=1-ChI_depression_score;

%% Calculate effective dopamine firing DLS
effective_DA_firing_DLS=DA_firing_rate.*Normalised_score_DLS(1:3000+baseline_time);
 
%% Plot figure
hold on;
% plot(effective_DA_firing_DLS(1000+baseline_time/2:1600+baseline_time/2))
% plot(DA_firing_rate(1000+baseline_time/2:1600+baseline_time/2))








%% Calculate ChI-dependent depression score NAcc
ChI_depression_score=zeros(4000+baseline_time,1);
Step_of_depression=1;


for i=Step_of_depression:Step_of_depression:length(time_of_recording)
    
    for j=1:1501
        if inhibition_efficiency_scale(j) <= ChI_firing_rate(i)
            position_in_scale=j;
        end
    end
    for k=0:99
        if ChI_depression_score(i+k)<inhibition_efficiency(position_in_scale,1) * (1-inhibition_NAcc(k+1))
            ChI_depression_score(i+k)=inhibition_efficiency(position_in_scale,1) * (1-inhibition_NAcc(k+1));
        end
    end
end

%% Normalise ChI-dependent depression score
for i = 1:length(time_of_recording)
    ChI_depression_score(i)=ChI_depression_score(i)*(1-NAcc_desensitize(i));
end

Normalised_score_NAcc=1-ChI_depression_score;

%% Calculate effective dopamine firing NAcc
effective_DA_firing_NAcc=DA_firing_rate.*Normalised_score_NAcc(1:3000+baseline_time);
 
%% Plot figure
% hold on;
% plot(effective_DA_firing_NAcc(1000+baseline_time/2:1600+baseline_time/2))


%% draw dopamine release with dopamine transient
DA_release_raw=zeros(6000+baseline_time,1);
DA_release_DLS=zeros(6000+baseline_time,1);
DA_release_NAcc=zeros(6000+baseline_time,1);

for i=1:3000+baseline_time
    DA_release_raw(i:i+2375,1)=DA_release_raw(i:i+2375,1)+DA_firing_rate(i)*DA_transient;
    DA_release_DLS(i:i+2375,1)=DA_release_DLS(i:i+2375,1)+effective_DA_firing_DLS(i)*DA_transient;
    DA_release_NAcc(i:i+2375,1)=DA_release_NAcc(i:i+2375,1)+effective_DA_firing_NAcc(i)*DA_transient;
end


DA_release_DLS=DA_release_DLS/max(DA_release_raw);
DA_release_NAcc=DA_release_NAcc/max(DA_release_raw);
DA_release_raw=DA_release_raw/max(DA_release_raw);

hold on;
plot(DA_release_raw(5500:9000));
plot(DA_release_DLS(5500:9000));
plot(DA_release_NAcc(5500:9000));
axis([500 3000 0 1])

%% find start and end point of dopamine release

baseline_release_raw=mode(DA_release_raw);
baseline_release_DLS=mode(DA_release_DLS);
baseline_release_NAcc=mode(DA_release_NAcc);

for i=10:length(DA_release_raw)-10
    if DA_release_raw(i) ~= baseline_release_raw && DA_release_raw(i+1) == baseline_release_raw && DA_release_raw(i+2) == baseline_release_raw 
        DA_release_end=i;
    end
end

for i=length(DA_release_raw)-10:-1:10
    if DA_release_raw(i) ~= baseline_release_raw && DA_release_raw(i-1) == baseline_release_raw && DA_release_raw(i-2) == baseline_release_raw 
        DA_release_start=i;
    end
end


DA_max_raw=max(DA_release_raw)-baseline_release_raw;
DA_max_DLS=max(DA_release_DLS)-baseline_release_DLS;
DA_max_NAcc=max(DA_release_NAcc)-baseline_release_NAcc;

nDA_max_DLS=DA_max_DLS/DA_max_raw;
nDA_max_NAcc=DA_max_NAcc/DA_max_raw;

DA_area_raw=sum(DA_release_raw(DA_release_start:DA_release_end))-baseline_release_raw*(DA_release_end-DA_release_start+1);
DA_area_DLS=sum(DA_release_DLS(DA_release_start:DA_release_end))-baseline_release_DLS*(DA_release_end-DA_release_start+1);
DA_area_NAcc=sum(DA_release_NAcc(DA_release_start:DA_release_end))-baseline_release_NAcc*(DA_release_end-DA_release_start+1);

nDA_area_DLS=DA_area_DLS/DA_area_raw;
nDA_area_NAcc=DA_area_NAcc/DA_area_raw;

