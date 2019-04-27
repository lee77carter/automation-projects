# Merging release branch into develop branch


>This bash script automatically merges the release branch back to the develop branch and can be set more frequently via a cron job. Perhaps every time a nightly release or a release candidate has been built. Merge conflicts may occur, which can be investigated at the time of failure, then fixed on the command-line. 


## Getting Started

Use the following instructions to run from the command-line.

### Prerequisites

* Edit/Update with variables  
* Verify you're using a bash shell 
* Verify the bash location and add the shebang at the beginning of your script.

```
For bash: 
♥ bash
♥ which bash
/bin/bash
```

Add at the beginning of your script: 

```
#!/bin/bash
```

### Update Permissions, then run script: 

```
chmod u+x merging.sh
./merging.sh
```
