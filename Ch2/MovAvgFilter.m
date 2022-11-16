function avg = MovAvgFilter(x)
% 이동평균 필터 재귀식 구현
%
persistent prevAvg n xbuf
persistent firstRun

if isempty(firstRun)
    n = 10;         % 데이터 개수 지정 (중간에 이동평균의 데이터 개수를 바꾸는 경우는 드물기 때문에 함수 내부에서 지정)
    xbuf = x * ones(n+1, 1); % 내부 버퍼 초기화

    prevAvg = x;

    firstRun = 1;
end

for m=1:n
    xbuf(m) = xbuf(m+1);
end

xbuf(n+1) = x;

avg = prevAvg + (x - xbuf(1)) / n;

prevAvg = avg;

end
