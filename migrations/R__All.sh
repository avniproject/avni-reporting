#!/usr/bin/env bash

echo '\set ON_ERROR_STOP ON'
cat ./migrations/R__Functions.sql
cat ./migrations/R__Views.sql
echo "set role $1;"
cat ./migrations/R__ReportingViews.sql
echo "set role none;"
cat ./migrations/afterMigrate.sql
