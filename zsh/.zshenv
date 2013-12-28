# Setup command search path
typeset -U path
path=($path /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/))
path=($path /home/y/bin*(N-/))
path=($path $HOME/.rvm/bin(N-/))

export MAVEN2_HOME=/Developer/apache-maven-3.0.4
path=($path $MAVEN2_HOME/bin(N-/))

path=($path /Developer/hadoop-1.0.1/bin(N-/))
path=($path /opt/local/bin(N-/))

# Option
export _JAVE_OPTIONS="-Dfile.encoding=UTF-8"
export VIRTUALENV_USE_DISTRIBUTE=true

# mac ports
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
export LIBRARY_PATH=/opt/local/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=/opt/local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/opt/local/include:$CPLUS_INCLUDE_PATH
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib
export BOOST_ROOT=/opt/local/include/boost:$BOOST_ROOT
