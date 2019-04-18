# Merging release branch into develop branch

>This bash script automatically merges the release branch back to the develop branch via Jenkins build job and can be run as a downstream task. Merge conflicts may occur, which can be investigated at the time of failure, then fixed on the command-line.


## Getting Started

Use the following instructions via a Jenkins build job 

### Prerequisites

* Should already have access to an existing Jenkins system. 
* Have Jenkins documentation available for troubleshooting. 

### Edit Jenkins Job & Parameters

* In Jenkins, Create or clone an existing build job from the sidebar: 
```
Jenkins > New Item 
```
* Configure new build job. Add source control from the Source Code Management tab: 
```
Source Code Management > set-up repository and branch
```
* Add script from the Build tab: 
```
Execute shell
```
* Display log file from the Post-build Actions: 
```
Archive the artifacts > Files to archive (merging.txt)
```
* Save and run build
