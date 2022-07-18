oc apply  -f hello-world-pipeline.yaml
oc apply  -f hello-world-trigger-binding.yaml
oc apply  -f hello-world-trigger-template.yaml
oc apply  -f hello-world-trigger-trigger.yaml
oc delete -f hello-world-trigger-event-listener.yaml
oc create  --save-config -f hello-world-trigger-event-listener.yaml
oc apply  -f hello-world-trigger-route.yaml



