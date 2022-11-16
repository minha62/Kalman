function [volt, Px, K] = SimpleKalman2(z)
%
%
persistent A H Q R
persistent x P
persistent firstRun

if isempty(firstRun)
    % 시스템 모델 변수 초기화
    A = 1;
    H = 1;
    Q = 0;
    R = 4;
    
    % 초기 예측값 지정
    x = 14;
    P = 6;

    firstRun = 1;
end


xp = A*x;                       % Ⅰ. 추정값 예측
Pp = A*P*A' + Q;                %     오차 공분산 예측

K = Pp*H' / (H*Pp*H' + R);      % Ⅱ. 칼만 이득 계산

x = xp + K*(z - H*xp);          % Ⅲ. 추정값 계산
P = Pp - K*H*Pp;                % Ⅳ. 오차 공분산 계산


volt = x;                       % 추정값 반환
Px = P;
end