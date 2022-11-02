function xlpf = LPF(x)
%
%
persistent prevX
persistent firstRun

if isempty(firstRun)
    % 초기에 추정값이 측정값과 너무 동떨어지지 않도록,
    % 직전 추정값(prevX)을 0 대신 첫 번째 측정 데이터로 초기화
    prevX = x;      
    firstRun = 1;
end

alpha = 0.7; % 여기선 상수로 지정했지만, 실행 중에 바꿔야 한다면 이 값도 인자로 받도록 수정
xlpf = alpha*prevX + (1 - alpha)*x; % 필터 알고리즘

prevX = xlpf;

end
