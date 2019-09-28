include unittest.e
include misc.e
-- Hexadecimal numbers are interpreted as uint32_t values and then converted to
-- int32_t.

test_equal("Hexadecimal numbers #FF", 255, #FF)
test_equal("Hexadecimal numbers #FFFF", 65535, #FFFF)
test_equal("Hexadecimal numbers #FFFFFFFF = 2^32-1", power(2,32)-1, #FFFFFFFF)
test_equal("Hexadecimal numbers #80000000 = 2^31", power(2,31), #80000000)
test_equal("Hexadecimal numbers #100000000 = 2^32", power(2,32), #100000000)
test_equal("Hexadecimal numbers #400000000 = 2^34", power(2,34), #400000000)
test_equal("Hexadecimal numbers #1000000000 = 2^36", power(2,36), #1000000000)
test_equal("Hexadecimal numbers #10000000000000 = 2^52", power(2,52), #10000000000000)
test_equal("Hexadecimal numbers #1000000000000000 = 2^60", power(2,60), #1000000000000000)
test_equal("Hexadecimal numbers #10000000000000000 = 2^64", power(2,64), #10000000000000000)

test_report()