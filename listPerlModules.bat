perl -MFile::Find=find -MFile::Spec::Functions -Tlwe \
'find { wanted => sub { print canonpath $_ if /\.pm\z/ }, no_chdir => 1 }, @INC'
