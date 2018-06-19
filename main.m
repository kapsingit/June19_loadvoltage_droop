%% Code generated : 4:41 PM, 6/19/2018
%% By: Kapil Duwadi, kapil.duwadi@jacks.sdstate.edu


%% Reads data
load input_data;
load volloaddroop;


power_curtailed = PMPPT(1:end-1) - (loaddata(1:end-1,:)-power(2:end,:));
House_wise_curtail = sum(power_curtailed);
total_curtail = sum(House_wise_curtail)/(60*1000);

%% Plots house wise curtailment
House_wise_curtail(House_wise_curtail<0) = 0;
figure('color',[1,1,1]);
set(gcf,'Position',[680,558,600,420]);
bar(House_wise_curtail/(60*1000));
ylabel('Total energy curtailment (kWh)');
xticks(1:12);
xticklabels({'H1','H2','H3','H4','H5','H6','H7','H8','H9','H10','H11','H12'});
ylim([0,35]);
grid on;
box on;
print(gcf,'Images\housewisecurtail_sweepedvcri','-dpng','-r600');

%% Plots power curtailment profile
figure('color',[1,1,1]);
set(gcf,'Position',[680,558,700,550]);
power_curtailed(power_curtailed<0) = 0;
plot(power_curtailed);
grid on;
box on;
ylabel('Power curtailment (kW)');
a = legend('H1','H2','H3','H4','H5','H6','H7','H8','H9','H10','H11','H12');
set(a,'NumColumns',3,'Location','NorthEast')
print(gcf,'Images\powercuratil_profile','-dpng','-r600');

%% Plots voltage profile

figure('color',[1,1,1]);
plot(voltage/240)
x1 = 1.042*ones(1,1440);
x2 = 1.058*ones(1,1440);
hold
yticks([0.98:0.01:1.03, 1.042, 1.05, 1.058]);
plot(x1,'--r')
plot(x2,'--r')
xlim([0,1440]);
xlabel('Time (minute)');
ylabel('Voltage (p.u.)');
print(gcf,'Images\voltage1042','-dpng','-r600');