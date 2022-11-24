function [p,q,r] = GetGyro()
% 
% 
persistent wx wy wz
persistent k firstRun

if isempty(firstRun)
    load ArsGyro % ArsGyro.mat 파일에 저장된 wx, wy, wz 변수를 반환
    k = 1;

    firstRun = 1;
end

p = wx(k);
q = wy(k);
r = wz(k);

k = k + 1;