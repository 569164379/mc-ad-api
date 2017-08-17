case "$1" in
	dev)
		docker build -f ./Dockerfile.dev -t registry.cn-hangzhou.aliyuncs.com/mc-images/mc-ad-api:dev .
		docker push registry.cn-hangzhou.aliyuncs.com/mc-images/mc-ad-api:dev
		curl -v -k "https://cs.console.aliyun.com/hook/trigger?triggerUrl=YzNkNWQ3MmUwZTg4MTQ5ZjFhNzNlMTVlZmJlNzAxYjU3fG1jLWFkLWFwaXxyZWRlcGxveXwxOWw2MHM2ajZiNG40fA==&secret=775a365a7247315158443067456d4b6f79d32acf8143ce0fe23b093ba3b13cec"
		;;
	*)
		docker build -t bw-demo:husky .
		# docker push registry.cn-hangzhou.aliyuncs.com/mex-ssp/mex-ssp-ui:husky
		;;
esac

exit 0
