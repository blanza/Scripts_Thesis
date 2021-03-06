

/*
AFTER USING DATAZOOM TO IMPORT THE PNAD MICRODATA INTO STATA:
db datazoom_pnad
*/

/*
use use pnadXXXXyyy, clear
XXXX STANDS FOR THE YEAR AND YYY CAN BE EITHER DOM OR PES
*/

/*
RECODE THE AGE VARIABLE v8005 SO YOU HAVE SINGLE-AGE DATA FROM 0 - 80
*/

recode v8005 80/200 = 80 if v8005 >= 80

/*
AS WE JUST WANT TO WORK WITH MALES, DELETE ALL THE FEMALE OBSERVATIONS
*/

keep if (v0302 == 2)
keep if (v9001 != 0)

/*
THEN RUN THE FOLLOWING TO CALCULATE WHAT YOU NEED
*/

tab v8005 v9001 [fw = v4729]
