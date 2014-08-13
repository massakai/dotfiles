# env variables
export EDITOR=vim
export LANG=ja_JP.UTF-8     #文字コードの設定
export LANGUAGE=ja_JP:ja
export LC_COLLATE=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_IDENTIFICATION=jp_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_MESSAGES=jp_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export SHELL=/bin/zsh

# options
export _JAVE_OPTIONS="-Dfile.encoding=UTF-8"
export VIRTUALENV_USE_DISTRIBUTE=true

# path
typeset -T LIBRARY_PATH               library_path
typeset -T LD_LIBRARY_PATH            ld_library_path
typeset -T C_INCLUDE_PATH             c_include_path
typeset -T CPLUS_INCLUDE_PATH         cplus_include_path
typeset -T DYLD_FALLBACK_LIBRARY_PATH dyld_fallback_library_path
typeset -T BOOST_ROOT                 boost_root
typeset -U path manpath library_path ld_library_path c_include_path cplus_include_path dyld_fallback_library_path boost_root

path=(
    $path
    /usr/*/bin(N-/)
    /usr/local/*/bin(N-/)
    /var/*/bin(N-/)
    /opt/local/bin(N-/)
    /opt/local/sbin(N-/)
    $HOME/.rvm/bin(N-/)
)

# Maven
export MAVEN2_HOME=/Developer/apache-maven-3.0.4
path=($path $MAVEN2_HOME/bin(N-/))

# Hadoop
export HADOOP_HOME=/Developer/hadoop-1.0.1
path=($path $HADOOP_HOME/bin(N-/))

# mac ports
path=(
    $path
    /opt/local/bin(N-/)
    /opt/local/sbin(N-/)
)
manpath=($manpath /opt/local/man(N-/))
library_path=($library_path /opt/local/lib(N-/))
ld_library_path=($ld_library_path /opt/local/lib(N-/))
c_include_path=($c_include_path /opt/local/include(N-/))
cplus_include_path=($cplus_include_path /opt/local/include(N-/))
dyld_fallback_library_path=($dyld_fallback_library_path /opt/local/lib(N-/))
boost_root=($boost_root /opt/local/include/boost(N-/))

