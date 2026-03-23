SELECT like('r\\a1bbb', '%r\\\\a1%bbb%') AS res;

WITH lower('\\RealVNC\\WinVNC4 /v password') AS CommandLine

SELECT
    like(CommandLine, '%\\\\realvnc\\\\winvnc4%password%') AS t1,
    like(CommandLine, '%\\\\realvnc\\\\winvnc4 %password%') AS t2,
    like(CommandLine, '%\\\\realvnc\\\\winvnc4%password') AS t3,
    like(CommandLine, '%\\\\realvnc\\\\winvnc4 %password') AS t4,
    like(CommandLine, '%realvnc%winvnc4%password%') AS t5,
    like(CommandLine, '%\\\\winvnc4%password%') AS t6;