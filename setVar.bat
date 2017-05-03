:: Read a specified One line file into 'result'
   @echo on
   > (tmp).bac echo n (tmp).bah
   >>(tmp).bac echo e 100 "set result="
   >>(tmp).bac echo rcx
   >>(tmp).bac echo 0b
   >>(tmp).bac echo w
   >>(tmp).bac echo q
   debug < (tmp).bac > nul
   copy (tmp).bah + %1 (tmp).bat > nul
   call (tmp).bat
   ::del (tmp).ba?
   echo %result%

