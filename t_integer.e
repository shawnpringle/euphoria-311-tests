include unittest.e
-- integer type shall only be in the inclusive range [-power(2,30)..power(2,30)-1]
-- Plus the integer must have no fraction part.
constant msg = "The type integer() is true only for -power(2,30) to power(2,30)-1 test (%d)"
constant int_set = {-power(2,30), 1-power(2,30), -power(2,15), power(2,15), power(2,30)-1 }
constant non_int_set = {-power(2,30)-1, -power(2,52), power(2,52), power(2,30)}
for i = 1 to length(int_set) do
	test_equal(sprintf(msg, repeat(int_set[i],1)), 1, integer(int_set[i]))
end for
for i = 1 to length(non_int_set) do
	test_equal(sprintf(msg, non_int_set[i..i]), 0, integer(non_int_set[i]))
end for
test_equal("The value of integer( 1 and 1/4 ) = 0", 0, integer(1.25))
test_report()