function [pos, vel, alt] = RadarEKF(z, dt)
%
%
persistent A Q R
persistent x P
persistent firstRun

if isempty(firstRun)
    A = eye(3) + dt*[ 0 1 0;
                      0 0 0;
                      0 0 0 ];
    Q = [ 0 0     0;
          0 0.001 0;
          0 0     0.001 ];
    R = 10;

    x = [0 90 1100]'; % 임의로 예측한 초기 추정값
    P = 10*eye(3);

    firstRun = 1;
end

H = Hjacob(x); % 시스템 행렬의 야코비안 H 계산

xp = A*x;
Pp = A*P*A' + Q;

K = Pp*H'*inv(H*Pp*H' + R);

x = xp + K*(z - hx(xp));
P = Pp - K*H*Pp;

pos = x(1);
vel = x(2);
alt = x(3);

%---------------------------------
function zp = hx(xhat) % 직선 거리 반환
%
%
x1 = xhat(1);
x3 = xhat(3);

zp = sqrt(x1^2 + x3^2);

%---------------------------------
function H = Hjacob(xp)
%
%
H = zeros(1, 3);

x1 = xp(1);
x3 = xp(3);

H(1) = x1 / sqrt(x1^2 + x3^2);
H(2) = 0;
H(3) = x3 / sqrt(x1^2 + x3^2);