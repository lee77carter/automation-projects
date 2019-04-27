# Tested in Bitbucket
**GOAL:** 
> Test in github
  Find API
  Test on command-line
  Test in Jenkins build job


> This particular dev team requires a pull request for all weekly merges from release candidate code-line into develop. Use curl to merge branches (via Jenkins job), but halt at a pull request so the team can review prior to merging, in case conflicts occur or something gets merged accidentally from a previous overlooked issue within the release code-line.

**All one line**

    COMMAND: curl -X POST -H "Content-Type: application/json" -u s3m3n:bbpassword 
    https://bitbucket.org/api/2.0/repositories/s3m3n/reponame/pullrequests -d 
    
    '{ "    title": "Merge some branches", "description": "stackoverflow example", 
    "source": { "branch": { "name": "choose branch to merge with" }, "repository
    ": { "full_name": "s3m3n/reponame" } }, "destination": { "branch": { "name": 
    "choose branch that is getting changes" } }, "reviewers": [ { "usernam
    e": "some other user needed to review changes" } ], "close_source_branch": false }'

## Explanation of the above command

    COMMAND: curl -X POST -H
    -X, --request The request method to use.
    -H, --header <header> Headers to supply with request.

    COMMAND: curl -X POST -H **"Content-Type:**
    Sending data via a POST or PUT request, two common formats (specified via the Content-Type header) are:
    application/json
    application/x-www-form-urlencoded

    COMMAND: curl -X POST -H "Content-Type: **-u s3m3n:bbpassword https://bitbucket.org/api/2.0/repositories/s3m3n/reponame/pullrequests
    username & password to API URL for PR's

    COMMAND: curl -X POST -H "Content-Type: -u s3m3n:bbpassword https://bitbucket.org/api/2.0/repositories/s3m3n/reponame/pullrequests **-d**
    -d, --data <data> Send specified data in POST request.
    form urlencoded: -d "param1=value1&param2=value2" or -d @data.txt
    json: -d '{"key1":"value1", "key2":"value2"}' or -d @data.json

## Content Template

    { "title": "Merge some branches",
    "description": "stackoverflow example",
    source "source": { "branch":
    { "name": "choose branch to merge with" }
    "repository": { "full_name": "s3m3n/reponame" } },
    "destination":
    { "branch":
    { "name": "choose branch that is getting changes" } },
    reviewers "reviewers": [ { "username": "some other user needed to review changes" } ],
    "close_source_branch": false }'

## Content to use for this project

    application/json" -u LeeCarter:bbpassword https://bitbucket.org/api/2.0/repositories/LeeCarter/sierra-c/pullrequests -d
    "title":"Automation Test Merge: lee_rls_branch into lee_dev_branch",
    "description":"REL-778: Testing automatic merging & requesting PR for rlseng team to review.",
    "source": { "branch": { "name": "lee_rls_branch" }
    "repository": { "full_name": "LeeCarter/sierra-c" } },
    "destination": { "branch": { "name": "lee_dev_branch" } },
    "reviewers": [ { "username": "etibbits" }
    ], "close_source_branch": false }'


## Completed URL 

    curl -X POST -H "Content-Type: application/json" -u s3m3n:bbpassword 
    https://bitbucket.org/api/2.0/repositories/s3m3n/reponame/pullrequests -d '{ "
    title": "Merge some branches", "description": "stackoverflow example", "source": { "branch": { "name": "choose branch to merge with" }, "repository
    ": { "full_name": "s3m3n/reponame" } }, "destination": { "branch": { "name": "choose branch that is getting changes" } }, "reviewers": [ { "usernam
    e": "some other user needed to review changes" } ], "close_source_branch": false }'

**Resources:** Slackoverflow, [Github Documentation](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58) and: [Atlassian Refernce](https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering)
