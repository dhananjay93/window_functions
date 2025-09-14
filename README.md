# 📊 SQL Window Functions Cheatsheet

Window functions are extremely useful in SQL for analysis because they add new calculated columns **without collapsing rows** (unlike `GROUP BY`).  

This cheatsheet covers the most commonly used window functions with simple, one-line definitions.  

---

## Ranking Functions
- **ROW_NUMBER()** → Gives each row a unique running number in order.  
- **RANK()** → Gives position numbers but skips numbers when there are ties.  
- **DENSE_RANK()** → Gives position numbers without skipping when there are ties.  

---

## Value Functions
- **NTH_VALUE()** → Picks out the *nth* value from the whole ordered list.  
- **LAG()** → Looks back and shows the previous row’s value.  
- **LEAD()** → Looks forward and shows the next row’s value.  

---

## Distribution & Bucketing
- **NTILE(n)** → Splits rows evenly into *n* groups (like quartiles/deciles).  
- **CUME_DIST()** → Shows how far along you are in the list, as a percentage.  

---

## Moving & Running Averages
- **AVG(...) OVER UNBOUNDED PRECEDING → CURRENT ROW** → Running average from the start up to now.  
- **AVG(...) OVER CURRENT ROW → UNBOUNDED FOLLOWING** → Average from now to the end.  
- **AVG(...) OVER 2 PRECEDING → 2 FOLLOWING** → Moving average using 2 rows before and 2 rows after.  

---

## 📌 Tip
Add `PARTITION BY` inside the `OVER (...)` clause to reset calculations per group (e.g., per student, department, or category).  

---

## 📂 Repo Description
This repo contains:
1. A demo SQL script with a sample dataset  
2. Queries for each function above  
3. Example outputs for quick reference  

Use this as a **handy cheatsheet** or quick refresher whenever working with window functions.  

---