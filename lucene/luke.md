## Luke for Lucene 

In this lab we will use a tool called Luke, in order to analyze Lucene index.

#### Note 1: This lab depends in the `index` folder created in the `lucene.md` lab
Lab Goals:

1. Install Luke
1. Explore Luke functionality 
      
#### Note 2: For this lab you will need the Desktop UI. 

Your lab server will provide this with VNC (ask the instructor about it)
      
### STEP 1: Install Luke (in the SSH)
  
    wget https://s3.amazonaws.com/elephantscale-public/downloads/luke-7.1.0-luke-release.zip
    unzip luke-7.1.0-luke-release.zip


### STEP 2: Run Luke and open the index (in the VNC)

    cd luke-7.1.0
    ./luke.sh
    
In Luke, open the `index` file    

### STEP 3: Luke basic functionality

Familiarize yourself with Luke tabs

Be ready to answer the following questions about Luke

- what documents do you see?
- can you browse through documents?
- can you search?

### STEP 4: Luke functionality overview

- Prepare a general list of Luke functionalities
- Count various aspects that Luke provides
- See if you can find more than the other students
