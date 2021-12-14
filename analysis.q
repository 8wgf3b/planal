maker: {    
    x set flip `chap`time ! ("*U"; ",") 0: ` sv `:data, `$ string[x], ".csv";
    update time: 0D00:00:01 * 5h$time from x;
    update cspent: i + 1, tspent: sums time from x;
    update cleft: count[i] - cspent, tleft: sum[time] - tspent from x;
    update cprog: 100 * cspent % count[i], tprog: 100 * tspent % sum[time] from x;
    }

maker each `saa`sap;
prg: {100 * %[;0D01] sum sap[x; `time]}
