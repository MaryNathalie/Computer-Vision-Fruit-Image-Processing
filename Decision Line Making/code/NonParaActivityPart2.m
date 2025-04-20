close all
clear all
clc

data = csvread('data.csv',0,0); %1:20 mango up, 21:40 orange down right, 41:60 apple left
lab = data(:,1); ecc = data(:,2); gg = data(:,4); hue = data(:,6);

eccm = data(1:20,2); ggm = data(1:20,4); huem = data(1:20,6);
ecco = data(21:40,2); ggo = data(21:40,4); hueo = data(21:40,6);
ecca = data(41:60,2); gga = data(41:60,4); huea = data(41:60,6);

%%

nu = 0.001; %learning rate
del = 1; i = 1; w = [0 2 1];

for j = 1:1:750    
    C = -w(1); A = w(2); B = w(3);
    m = -A/B; b = C/B; 
    ymo = @(xmo) m*xmo+b;

    i = i + 1;
    if i==41  i=1; end
    
    x1 = ecc(i); x2 = gg(i); x = [1; x1; x2]; 
    a = w*x;
    
    if lab(i)==1  % mango is above the line
        if x2 <= ymo(ecc(i)) % if equal and below, we want to put it up
            d=1; 
        else
            continue
        end
    elseif lab(i)==2  %orange is below the line
        if x2 >= ymo(ecc(i)) % if equal and above, we want to put it below
            d=-1; 
        else
            continue
        end
    end 
    
    if a>=0  z=1; else  z=-1; end   % step function 
    
    del = d-z; delw = (nu*del*x).';
    w = w + delw;
end
wmo1 = w;
C = -w(1); A = w(2); B = w(3);
m = -A/B; b = C/B;
xmo = 0:0.1:1; ymo = m*xmo+b;

%%

% nu = 0.001; %learning rate
% del = 1; i = 21; w = [25 -100 1]; d=1;
% 
% for j = 1:1:750
%     
%     C = -w(1); A = w(2); B = w(3);
%     m = -A/B; b = C/B;
%     yoa = @(xoa) m*xoa+b;
%     
%     i = i + 1;
%     if i == 61  i = 21; end
%     x1 = ecc(i); % y axis 
%     x2 = gg(i);  % x axis
%     x = [1; x1; x2]; 
%     a = w*x;
%     
%     if lab(i)==3  % orange right 
%         if x2 <= yoa(ecc(i)) % equal and left, we want to put it to the right
%             d=1; 
%         else
%             continue
%         end
%     elseif lab(i)==2  % apple left
%         if x2 >= yoa(ecc(i)) % equal and right, we want to put it to the left
%             d=-1; 
%         else
%             continue
%         end
%     end % d apple and orange
%     
% 
%     if a>=0  z=1; else  z=-1; end % step function
%     
%     del = d-z; delw = (nu*del*x).'; 
%     w = w + delw;
%     
% %     C = -w(1); A = w(2); B = w(3);
% %     m = -A/B; b = C/B;
% %     xoa = 0.26:0.005:0.27; yoa = m*xoa+b;
% %     disp(j);
%     
% %     figure(1);
% % %     plot([xmo(1);xmo(end)], [ymo(1);ymo(end)], 'c');
% %     plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
% %     hold on
% % %     plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
% %     plot(ggm,eccm,'b.','MarkerSize',10);
% %     plot(ggo,ecco,'y.','MarkerSize',10);
% %     plot(gga,ecca,'g.','MarkerSize',10);
% %     hold off
% end
% woa1 = w;
% C = -w(1); A = w(2); B = w(3);
% m = -A/B; b = C/B;
% xoa = 0.259:0.001:0.271; yoa = m*xoa+b;
% 
% 
% %%
% figure();
% plot([xmo(1);xmo(end)], [ymo(1);ymo(end)], 'c');
% % plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
% hold on
% plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
% plot(ggm,eccm,'b.','MarkerSize',10);
% plot(ggo,ecco,'y.','MarkerSize',10);
% plot(gga,ecca,'g.','MarkerSize',10);
% hold off

%%
%{
nu = 0.001; %learning rate
del = 1; i = 1; w = [0 2 1];

for j = 1:1:750    
    C = -w(1); A = w(2); B = w(3);
    m = -A/B; b = C/B;
    ymo = @(xmo) m*xmo+b;

    i = i + 1;
    if i==41  i=1; end
    
    x1 = ecc(i); x2 = hue(i); x = [1; x1; x2]; 
    a = w*x;
    
    if lab(i)==1  % mango is above the line
        if x2 <= ymo(ecc(i)) % if equal and below, we want to put it up
            d=1; 
        else
            continue
        end
    elseif lab(i)==2  %orange is below the line
        if x2 >= ymo(ecc(i)) % if equal and above, we want to put it below
            d=-1; 
        else
            continue
        end
    end 
    
    if a>=0  z=1; else  z=-1; end   % step function 
    
    del = d-z; delw = (nu*del*x).';
    w = w + delw;
    disp(j);
    
    C = -w(1); A = w(2); B = w(3);
    m = -A/B; b = C/B;
    xmo = 0:0.1:0.5; ymo = m*xmo+b;
    
    figure(1);
    plot([xmo(1);xmo(end)], [ymo(1);ymo(end)], 'c');
    % plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
    hold on
%     plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
    plot(huem,eccm,'b.','MarkerSize',10);
    plot(hueo,ecco,'y.','MarkerSize',10);
    plot(huea,ecca,'g.','MarkerSize',10);
    hold off
end
wmo1 = w;
C = -w(1); A = w(2); B = w(3);
m = -A/B; b = C/B;
xmo = 0.17:0.01:0.45; ymo = m*xmo+b;

%%

nu = 0.2; %learning rate
del = 1; i = 21; w = [30 -30 1]; d=1;

for j = 1:1:750
    
    C = -w(1); A = w(2); B = w(3);
    m = -A/B; b = C/B;
    yoa = @(xoa) m*xoa+b;
    
    i = i + 1;
    if i == 61  i = 21; end
    x1 = ecc(i); % y axis 
    x2 = hue(i);  % x axis
    
    if x2 > 0.2  continue; end
    
    x = [1; x1; x2]; 
    a = w*x;
    
    if lab(i)==3  % orange right 
        if x2 <= yoa(ecc(i)) % equal and left, we want to put it to the right
            d=1; 
        else
            continue
        end
    elseif lab(i)==2  % apple left
        if x2 >= yoa(ecc(i)) % equal and right, we want to put it to the left
            d=-1; 
        else
            continue
        end
    end % d apple and orange
    

    if a>=0  z=1; else  z=-1; end % step function
    
    del = d-z; delw = (nu*del*x).'; 
    w = w + delw;
    
    C = -w(1); A = w(2); B = w(3);
    m = -A/B; b = C/B;
    xoa = 0.:0.05:0.1; yoa = m*xoa+b;
    disp(i);
    
    figure(1);
%     plot([xmo(1);xmo(end)], [ymo(1);ymo(end)], 'c');
    plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
    hold on
%     plot([xoa(1);xoa(end)], [yoa(1);yoa(end)], 'r');
    plot(huem,eccm,'b.','MarkerSize',10);
    plot(hueo,ecco,'y.','MarkerSize',10);
    plot(huea,ecca,'g.','MarkerSize',10);
    hold off
end
woa1 = w;
C = -w(1); A = w(2); B = w(3);
m = -A/B; b = C/B;
xoa = 0.259:0.001:0.271; yoa = m*xoa+b;
%}
%%
% data = [wmo1,woa1];
% csvwrite('data1.csv',data);



