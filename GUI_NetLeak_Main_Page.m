% Net Leak push button
clf
import_all
 Flow_Anomalies = uicontrol('Style', 'pushbutton', 'String', 'Flow Anomalies','FontUnits','inches','FontSize',0.4,'Position', [620 550 450 150],...
                'Callback', 'GUI_Progressive_Leak');  
     Sensor_Anomalies = uicontrol('Style', 'pushbutton', 'String', 'Sensor Anomalies ','FontUnits','inches','FontSize',0.4,'Position', [620 300 450 150],...
                'Callback', 'Sensor_anomalies'); 