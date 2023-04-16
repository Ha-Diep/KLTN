set linesize 96
sum NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF
corr NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF
set linesize 96

des
encode Bank, gen (ID)
xtset ID Year


set linesize 96
xtreg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF ,re
xttest0

set linesize 96
xtreg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF ,fe
est sto fe
xtreg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF ,re
est sto re
hausman fe re, sigmaless

set linesize 96
reg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF
vif

set linesize 96
xtreg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF, fe
findit xtserial
net sj 3-2 st0039
xtserial NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF

set linesize 96
xtreg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF, fe
ssc install xtcsd
xtcsd, pesaran abs

set linesize 96
xtreg NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF, fe
ssc install xttest3
xttest3

set linesize 96
ssc install xtscc
xtscc NPL SIZE ROAE LLR NPLP CREDITGR LA GGDP INF
