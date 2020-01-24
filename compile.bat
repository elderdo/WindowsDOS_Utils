set INC1=D:\Oracle\product\12.2.0\client32bit_1\precomp\public
set INC2=D:\Oracle\product\19.0.0\client_1\oci\include
set LIB1=D:\Oracle\product\12.2.0\client32bit_1\precomp\lib\orasql12.lib


cl /I %INC1% /I %INC2% %1 %LIB1% 
