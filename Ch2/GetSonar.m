function h = GetSonar()
%
%
persistent sonarAlt     % SonarAlt.mat
persistent k firstRun

if isempty(firstRun)
    load SonarAlt       % 파일 읽어오기
    k = 1;

    firstRun = 1;
end

h = sonarAlt(k);
k = k+ 1;

end
