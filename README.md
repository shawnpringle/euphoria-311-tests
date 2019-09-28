# Purpose
The directory should contain test files written in **Euphoria 3.1.1**.  

# Unit Test files
Test files should have the form t_*somename*.e if the code should not produce an error and it should have a form of t_c_*somename*.e if the code should produce an error.  If it should produce an error there should be a directory with the same name except that it will be with a "d" extension rather than an "e", and contained therein there should be a copy of a sample ex.err produced by the original interpreter file renamed control.err.

Example Code:
```EUPHORIA
include unittest.e
include misc.e
-- Hexadecimal numbers are interpreted as positive values
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
```

In a counter test, code is expected to fail and it causes the interpreter to exit abruptly.  It is important that faulty code fails in a correct way.  For example length(0) should fail with a message about not allowing integers into length. 

To create this
* we make a tiny program like this:

````
procedure void(object x)
end procedure
void(length(0))
````

* Run the program and get the expected failure:
````
c:\euphoria-3\bin\exwc t_c_length.e
````
output:
````
t_c_length.e:3
length of an atom is not defined

--> See ex.err


Press Enter...

````

* make a t_c_length.d directory and then put the ex.err file in there as control.err
````
mkdir t_c_length.d
move ex.err t_c_length.d\control.err
````

Try to make your unit-tests portable among distinct operating systems.  Don't test for the existence of say "/etc" and fail if that call fails.  Windows OSes will not have "/etc", but it will have "C:\\WINDOWS".

# Running Tests
Use the supplied eu3test.ex which is an OpenEuphoria 4.0 program but it will work with 3.1 interpreters.   

You can get a compiled version of the program or make your own if you have a GNU GCC or Watcom C for your computer.  Or simply interpret it with Open Euphoria 4.0:

````Shell
c:\euphoria-4.0\bin\eui eu3test.ex    -eui c:\euphoria-3\bin\exwc.exe -all
````

Replace C:\Euphoria-4.0 with the directory where Euphoria 4.0 was installed to and replace C:\Euphoria-3.1 with where Euphoria 3.1 was installed to.


