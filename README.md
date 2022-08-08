# hello-world-php

The hello-world-php is a demonstration project that shows the steps to create an openshift-pipelines (tekton) CI/CD job to build and deploy a PHP appliction on OpenShift.    Test4

The simple pipeline perform the following tasks.

- fetch-repo - Checks out the code from GIT
- build - Performs an S2I image build and pushes the container in an image stream in the project.
- deploy - Runs helm chart to deploy the build container and all necessary resources.  


## Steps to Build and Run The Application

### Create Namespace to host the application
Create a namespace in openshift to host the application.

```
oc new-project hello-world-php
```

### Create Pipeline 
The cicd/hello-world-pipeline.yaml file containers the defintion of the Pipeline to perform the build steps.

Run the following command to create the pipeline.  

```
oc apply  -f hello-world-pipeline.yaml
```

### Create Trigger 

The following resouces are needed to expose a trigger hook that can be called by git to trigger the pipeline build.  

The hello-world-trigger-binding.yaml file containers the definition of a trigger binding.

Create the trigger binding.

```
oc apply  -f hello-world-trigger-binding.yaml
```

The hello-world-trigger-template.yaml file contains the definition of a trigger template.  The trigger templates maps the trigger to the pipeline definition 

```
oc apply  -f hello-world-trigger-template.yaml
```

The hello-world-trigger-trigger.yaml file defines the details of the trigger.  

```
oc apply  -f hello-world-trigger-trigger.yaml
```

The hello-world-trigger-event-listener.yaml contains the details of the event trigger listener.  This deploy a pod that listens for the event and executes the trigger.  

```
oc create  --save-config -f hello-world-trigger-event-listener.yaml
```

Next create a route to expose the trigger outside of the openshift cluster.  

```
oc apply  -f hello-world-trigger-route.yaml
```

### Configure You WebHook in GIT

Next go to you git system and configure a webhook that submits change events to the event listener route.

For example configure all push events to get posted to http://el-hello-world-php.apps-external.k8s-lab.it.tufts.edu/.


