#!/usr/bin/bash

# Script used via Jenkins job as an upstream to release candidate builds
# Set all parameters in Jenkins
# Set password in Jenkins Credentials

set -e
echo "III_RLSENG=$JIRAPASSWORD"


## Bundle Dashboard Jira's - Team dashboard for tragging versions##
if [ "${BUND_DASHBOARD}" = true ]; then

        curl \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://<yourURL>/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"BUND" }, "summary":"UpdateMe 9.9.9", "issuetype": { "name":"Bundle" }, "customfield_11240" : ["'UpdateMe_9.9.9_1'"], "customfield_11345" : ["'9.9.9_1'"] } }'
fi

## Building Jira's - for adding subtasks and entire project completion notes##
if [ "${BUILDING_JIRA}" = true ]; then

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://<yourURL>/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"REL" }, "summary":"Building UpdateMe_9.9.9", "issuetype": { "name":"Task"} } }'
fi 

## Merging Develop Jira's - merge to dev after ever RC release##
if [ "${MERGE_JIRA_DEVELOP}" = true ]; then

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://<yourURL>/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"REL" }, "summary":"Merging UpdateMe release/UpdateMe_9.9.9 to Develop", "issuetype": { "name":"Task"} } }'
fi

## Merging Master Jira's - tracks merge to GA and deletion of branches once in GA##
if [ "${MERGE_JIRA_MASTER}" = true ]; then 

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://<yourURL>/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"REL" }, "summary":"Merging UpdateMe release/UpdateMe_9.9.9 into Master and Delete Release Branches", "issuetype": { "name":"Task"} } }'
fi 
