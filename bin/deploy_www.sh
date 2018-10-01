#!/bin/sh

set -e

# BUILD corresponds to webroot
BUILD="${BUILD:-_build}"

# indicates which site to build
SITE="${SITE:-beta.visidata.org}"

# aws user profile
PROFILE="${PROFILE:-default}"

DISTRIBUTION_ID=`aws cloudfront --profile $PROFILE list-distributions | jq -r ".DistributionList.Items | select(.[0].Aliases.Items[0] == \"$SITE\") | .[0].Id"`

echo DISTRIBUTION_ID=$DISTRIBUTION_ID

## TODO: if empty DIST_ID, bail

# syncs the current state of BUILD to $SITE
aws s3 sync --acl public-read --profile $PROFILE $BUILD s3://$SITE

# redirects the survey url to visidata.org/survey
REDIR_URL='https://www.surveymonkey.com/r/8JBN8BM'
REDIR_PATH=survey
aws s3 cp --profile $PROFILE --acl public-read --website-redirect="$REDIR_URL" $0 s3://$SITE/"$REDIR_PATH"

# cloudfront invalidation is required in order to refresh the cloudfront cache - this ensures cloudfront shows the latest version of each file
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*" --profile $PROFILE
