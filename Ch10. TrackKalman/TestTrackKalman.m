clear all

NoOfImg = 24;

Xmsaved = zeros(2, NoOfImg);
Xhsaved = zeros(2, NoOfImg);

for k = 1:NoOfImg
    [xm, ym] = GetBallPos(k);
    [xh, yh] = TrackKalman(xm, ym);

    hold on
    plot(xm, ym, 'g*') % GetBallPos 함수가 추정한 위치 표시
    plot(xh, yh, 'ys') % 칼만 필터가 추정한 위치 표시

    pause(1)

    Xmsaved(:, k) = [xm ym]';
    Xhsaved(:, k) = [xh yh]';
end

figure
hold on
plot(Xmsaved(1,:), Xmsaved(2,:), '*')
plot(Xhsaved(1,:), Xhsaved(2,:), 's')
set(gca, 'yDir', 'reverse')