@rem = 'source http://www.dostips.com
CD/d"%~dp0"&perl -s "%~nx0" %*&Exit/b&:';

#perl script starts below here
     use File::Basename;
    $fullname = $0;
    ($name,$path,$suffix) = fileparse($fullname,@suffixlist);
    $name = fileparse($fullname,@suffixlist);
    $basename = basename($fullname,@suffixlist);
    $dirname = dirname($fullname);

