docker_operations.sh                                                                                100777       0       0         6744 12507525402  10260  0                                                                                                                                                                                                                                                                                                                                                                   #This script is used for performing various docker operations
#

clear

echo "Welcome to Docker !!"
echo "Please enter the operation to be performed:"
echo "1.Docker Version"
echo "2.Docker Images"
echo "3.Docker show running containers"
echo "4.Docker Run a Container"
echo "5.Docker Stop a Containerr"
echo "6.Docker Inspect a container"
echo "7.Docker Remove a Container"
echo "8.Docker Login"
echo "9.Display Container ID's"
echo "10.Docker Pull a Image"
echo "11.Docker Push a Image"
echo "12.Saving a container to a image"
echo "13.Removing a container that is no longer required"
echo "14.Build a Image from Docker File"
echo "15.Saving a Image into a tar file"
echo "16.Loading the Image from a tar ball"
echo "17.Exit"


read finput

if [ $finput != 17 ]
then
case $finput in
	1)	echo "Docker Version :"
		docker version;;
	2)	echo "Docker Images Listing ..."
		docker images;;
	3)	echo "Running containers are :"
		docker ps;;
	4)	echo "Please enter the image name"
		read iname
		if [ "$iname" = "ubuntu" ];
		then
		docker run -t -i $iname:latest /bin/bash &
		elif [ "$iname" = "centos" ];
		then
		docker run -t -i $iname:latest /bin/bash &
		elif [ "$iname" = "RHEL" ];
		then
		docker run -t -i $iname:latest /bin/bash &
		else
		echo "Image is invalid or not available ..."
		fi;;
	5)	echo "The running containers are :"
		docker ps
		echo "Enter the container ID to stop:"
		read containID
		if [ ${#containID} = 12 ]
		then
		docker stop $containID
		echo "$containID container stopped ..."
		else
		echo "Container ID is not valid!!"
		fi;;
	6)	echo "The running containers are :"
		docker ps
		echo "Enter the container ID to inspect:"
		read containID1
		if [ ${#containID1} = 12 ]
		then
		docker inspect $containID1
		else
		echo "Container ID Invalid !!"
		fi;;
	7)	echo "The running containers are:"
		docker ps
		echo "Enter the container ID to remove :"
		read containID2
		if [ ${#containID2} = 12 ]
		then
		docker kill $containID2
		echo " Container $containID2 removed successfully !!"
		else
		echo "Please enter a valid container ID "
		fi;;
	8)	echo "Please enter the credentials..."
		docker login;;
	9)	echo "Displaying container ID's ..."
		docker ps -aq --no-trunc;;
	10)	echo "Enter the image to pull:"
		read inamepl
		docker pull $inamepl;;
	11)	echo "Enter the image to push:"
		read inameph
		docker push $inameph;;
	12)	docker ps
		echo "Please enter the container ID to save :"
		read containID3
		echo "Enter the repository name :"
		read repoName
		echo "Enter the tag:"
		read tag
		if [ ${#containID3} = 12 ]
		then
			docker commit $containID3 $repoName:$tag
		else
			echo "Invalid container ID !!"
		fi;;
	13)	echo "Are you sure you want to contunue... (Yes-1/No-0)"
		read userip1
		if [ $userip1 = 1 ]
		then
		echo "Removing unwanted containers....."
		docker rm `docker ps -a -q --no-trunc`
		elif [ $userip1 = 0 ];
		then
		echo " Aborting the operation "
		fi;;
	14)	echo "Enter the name and path for Docker File :"
		read pathdoc
		echo "Building a image from $pathdoc... "
		docker build -t $pathdoc;;
	15)	echo "Enter the name of the image:"
		read iname
		echo "Enter the path and name of the tar file"
		read tarpath
		docker save $iname > $tarpath;;
	16)	echo "Enter the path alongwith name of the tar file to load"
		read tarfname
		docker load < $tarfname
		echo "Checking the image ..."
		docker images;;
esac

else
echo "Exiting ... "
exit 1
fi

echo "Do you wish to continue (1/0):"
read finput

if [ $finput = 1 ]
then 
./docker_operations.sh
else
echo " Exiting ... "
fi

exit 0


		
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            