function avg = MovAvgFilter2(x)
% 이동평균 필터 배치식 구현
%
persistent n xbuf
persistent firstRun

if isempty(firstRun)
    n = 10;                % 데이터 개수 지정
    xbuf = x * ones(n, 1); % 내부 버퍼 초기화

    firstRun = 1;
end

for m=1:n-1
    xbuf(m) = xbuf(m+1);
end

xbuf(n) = x;

avg = sum(xbuf) / n;

end
