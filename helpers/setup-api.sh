#!/bin/bash

####################################
# Enable required project services #
####################################

echo "**********************************************************************************************"
echo "$(date) => [INFO]  => Enable required project services on the base project where the service account was created (from ./setup-sa.sh)"
echo "$(date) => [INFO]  => Note: Requires Google Cloud SDK version 179.0.0 or later"
echo "**********************************************************************************************"

echo "$(date) => [INFO]  => Enable Google Cloud Resource Manager API (cloudresourcemanager.googleapis.com)"
gcloud services enable cloudresourcemanager.googleapis.com

echo "$(date) => [INFO]  => Enable Google Cloud Billing API (cloudbilling.googleapis.com)"
gcloud services enable cloudbilling.googleapis.com

echo "$(date) => [INFO]  => Enable Google Identity and Access Management A (iam.googleapis.com)"
gcloud services enable iam.googleapis.com

echo "$(date) => [INFO]  => Enable Google Admin SDK (admin.googleapis.com)"
gcloud services enable admin.googleapis.com

echo "$(date) => [INFO]  => Enable Google Google App Engine Admin API (appengine.googleapis.com)"
gcloud services enable appengine.googleapis.com
