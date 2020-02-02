#!/bin/sh

set -e

# indicates which site to build
SITE="${SITE:-beta.visidata.org}"

# aws user profile
PROFILE="${PROFILE:-kefala-saul}"

COMPUTED_DISTID=`aws cloudfront --profile $PROFILE list-distributions | jq -r ".DistributionList.Items | select(.[0].Aliases.Items[0] == \"$SITE\") | .[0].Id"`
DISTRIBUTION_ID="${DISTRIBUTION_ID:-$COMPUTED_DISTID}"

echo DISTRIBUTION_ID=$DISTRIBUTION_ID


# cloudfront invalidation is required in order to refresh the cloudfront cache - this ensures cloudfront shows the latest version of each file
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*" --profile $PROFILE
