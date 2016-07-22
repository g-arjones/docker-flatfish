# How to use this image

### 1. Add your user to docker group
```
# usermod -aG docker <your_username>
```

### 2. Build the docker image
```
$ ./build.sh
```

### 3. Run the container
```
$ ./run-isolated.sh
```
###### (NOTE: Make sure you have ssh keys and global git settings for the running user)

### 4. Build and deploy Flatfish
```
$ install-flatfish
```
