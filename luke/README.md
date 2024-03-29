## Luke for Lucene 

Note: the current version of Luke lab is [here](https://github.com/elephantscale/elastic-labs/blob/master/lucene/luke.md)

In this lab we will use a tool called Luke, in order to analyze Lucene index.


Lab Goals:

1. Install and run Luke
2. Use it to view documents in Lucene index.

### STEP 1) Log in via VNC to enable a GUI

Luke is a swing app and won't work without a GUI. SO, you can log in using VNC.

### STEP 2)  Install Luke
  Download the latest luke.jar from the web, currently   
  Tested:   
  https://github.com/DmitryKey/luke/releases/tag/luke-swing-7.6.0.1
  Latest:   
  https://github.com/DmitryKey/luke/releases/   


```bash
wget https://github.com/DmitryKey/luke/releases/download/luke-swing-7.6.0.1/luke-swing-7.6.0.1-luke-release.zip
unzip luke-swing-7.6.0.1-luke-release.zip
mv luke-swing-7.6.0.1 luke
export LUKE_PATH=`pwd`/luke
```

Use the index that  you created in the previous lab.

### STEP 3) Run Luke and open the index

```bash
./luke/luke.sh
```

Use `force unlock` if needed.

- what documents do you see?
- can you browse through documents?
- can you search?

