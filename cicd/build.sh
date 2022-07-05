tkn pipeline start build-and-deploy-hello-world-app -w name=workspace,volumeClaimTemplateFile=hello-world-workspace.yaml -p GIT_REPO=https://github.com/Vizuri/hello-world-php.git --use-param-defaults

