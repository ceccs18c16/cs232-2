function line(){
 echo "*************************************************"
}
 
echo "Your username : $(echo $USER)"
line # call function
 
echo "Currently logged on users:"
who
line

echo "Home directory : $HOME"
line

echo "Operating System Type:"
#cat /etc/*-release
uname -o
line

echo "Current path setting : $PATH"
line

echo "current working directory :"
pwd
line

echo "Currently logged on users:"
who
line
