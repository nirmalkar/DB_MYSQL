-- Decimal(Fixed point): in decimal datatype we can store decimal values.
-- syntax : decimal(p,s) where p is the precision and s is the scale. 
-- precision is the number of digits in the number and scale is the number of digits after the decimal point.
-- eg: decimal(5,2) means we can store 3 digits before the decimal point and 2 digits after the decimal point.
INSERT into
  test_datatypes(nums)
values
  (decimal(5, 2));