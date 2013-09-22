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

