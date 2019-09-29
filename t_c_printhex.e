integer null
null = open("/dev/null", "w")
if null = -1 then
	null = open("NUL", "w")
end if
printf(null, "%x\n", #100000000)
close(null)