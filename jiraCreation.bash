#!/usr/bin/bash

# Script used via Jenkins job as an upstream to release candidate builds
# Set all parameters in Jenkins
# Set password in Jenkins Credentials

set -e
echo "III_RLSENG=$JIRAPASSWORD"

## Exceptions to the rule for InnReach
if [ "${PRODUCT}" = "Lee-Lee" ]; then
  PRODUCT_RELEASE_BRANCH_NAME="LeeLeeSharing"
  PRODUCT_TAG="lees"
else
  PRODUCT_RELEASE_BRANCH_NAME="${PRODUCT}"
  PRODUCT_TAG="${PRODUCT,,}" ## lower case
fi

## Bundle Dashboard Jira's ##
if [ "${BUND_DASHBOARD}" = true ]; then

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://jira.iii.com/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"BUND" }, "summary":"'"${PRODUCT} ${VERSION}_${UNDERBAR_NUMBER}"'", "issuetype": { "name":"Bundle" }, "customfield_11240" : ["'"${PRODUCT_TAG}_${VERSION}_${UNDERBAR_NUMBER}"'"], "customfield_11345" : ["'"${VERSION}_${UNDERBAR_NUMBER}"'"] } }'
fi

## Building Jira's ##
if [ "${BUILDING_JIRA}" = true ]; then

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://jira.iii.com/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"REL" }, "summary":"Building '"${PRODUCT}_${VERSION}_${UNDERBAR_NUMBER}"'", "issuetype": { "name":"Task"} } }'
fi 

## Merging Develop Jira's ##
if [ "${MERGE_JIRA_DEVELOP}" = true ]; then

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://jira.iii.com/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"REL" }, "summary":"Merging '"${PRODUCT} release/${PRODUCT}_${VERSION}"' to Develop", "issuetype": { "name":"Task"} } }'
fi

## Merging Develop Jira's ##
if [ "${MERGE_JIRA_MASTER}" = true ]; then 

        curl -sS \
        -X POST \
        -u $JIRAPASSWORD \
        -H "Content-Type: application/json" \
        https://jira.iii.com/rest/api/2/issue \
        -d '{ "fields": { "project": { "key":"REL" }, "summary":"Merging '"${PRODUCT} release/${PRODUCT}_${VERSION}"' into Master and Delete Release Branches", "issuetype": { "name":"Task"} } }'
fi 
