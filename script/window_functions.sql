SELECT 
  "Student Name", 
  "Date", 
  "Duration", 
  -- Assigns a unique sequential number starting from 1 based on Duration
  ROW_NUMBER() OVER (ORDER BY "Duration") AS "row_number", 
  -- Assigns rank with gaps (if ties, next rank is skipped)
  RANK() OVER (ORDER BY "Duration") AS "rank", 
  -- Assigns rank without gaps (ties get the same rank, next rank continues sequentially)
  DENSE_RANK() OVER (ORDER BY "Duration") AS "dense_rank", 
  -- Returns the 3rd value of Duration in the entire set
  NTH_VALUE("Duration", 3) OVER () AS "nth_value", 
  -- Divides rows into 4 buckets (quartiles) based on Duration
  NTILE(4) OVER (ORDER BY "Duration") AS "NTILE", 
  -- Cumulative distribution of Duration (between 0 and 1)
  CUME_DIST() OVER (ORDER BY "Duration") AS "CUME_DIST", 
  -- Previous row’s Duration
  LAG("Duration") OVER (ORDER BY "Duration") AS "lag", 
  -- Next row’s Duration
  LEAD("Duration") OVER (ORDER BY "Duration") AS "lead", 
  -- Running average from start of partition to current row
  AVG("Duration") OVER (
    ORDER BY "Duration" 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS "AVG_CURRENT_PRECEDING",
  -- Average from current row to the end
  AVG("Duration") OVER (
    ORDER BY "Duration" 
    ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
  ) AS "AVG_CURRENT_FOLLOWING", 
  -- Moving average considering 2 rows before and 2 rows after current row
  AVG("Duration") OVER (
    ORDER BY "Duration" 
    ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
  ) AS "AVG_2_PRECEDING_2_FOLLOWING"
FROM public.window_function_demo;
