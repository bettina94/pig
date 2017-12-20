web = LOAD '/home/hduser/Downloads/weblog' USING PigStorage('\t') AS (user,bank,time);
gateway = LOAD '/home/hduser/Downloads/gateway' USING PigStorage('\t') AS (bank,rate:double);
joinwebgateway = join web by $1,gateway by $0;
--dump joinwebgateway;
final_join = foreach joinwebgateway generate $0, $3, $4;
--dump final_join;
user = group final_join by $0;
--dump user;
average = foreach user generate group, AVG(final_join.rate) as avgpr;
--dump average;
success_rate = filter average by $1>90;
dump success_rate;


