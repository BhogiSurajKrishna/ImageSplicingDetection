clc;
clear;
close all;
%%
disp('This shows details about which files to run');
disp('For some true negatives, i.e; untampered image examples which are detected correctly run truenegs.m');
disp('For some true positives, i.e; tampered images and detected correctly, run truepositives.m');
disp('For some false positives, i.e; un-tampered images but splicing detected, run falsepositives.m');
disp('For some more examples, run moreexamples.m , morexamples1.m');
disp('Note:Above all runs the optimized code, to see the unoptimized version, just replace varaloimopt in the above files with varaloimg with same parameters but it is 100s of times slower');
%%