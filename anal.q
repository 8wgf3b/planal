cose: flip `chap`time ! ("*U"; ",") 0: `:data/saa.csv
update time: 0D00:00:01 * 5h$time from `cose;
update cspent: i + 1, tspent: sums time from `cose;
update cleft: count[i] - cspent, tleft: sum[time] - tspent from `cose;
update cprog: 100 * cspent % count[i], tprog: 100 * tspent % sum[time] from `cose; 
