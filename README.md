# terraform-training

##Setup the project in Terraform:

### Run setup-sa to setup the service account.

```bash ./helpers/setup-sa.sh 222089017122 pythian-cft-training-timoteo```

### Run init scripts to install terraform, go and other modules and libraries.

```bash ./helpers/init-<OSVERSION>.sh```

## Apply infrastructure configuration in GCP

```terraform init && terraform apply```

## Destroy infrastructure configuration in GCP

```terraform destroy```


