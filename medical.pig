med = LOAD '/home/hduser/Downloads/medical' USING PigStorage('\t') AS (name,department,claims:long);
--dump med;
emp_claims = group med by $0;
--dump emp_claims;
average = foreach emp_claims generate group, AVG(med.claims) as avg;
dump average;
