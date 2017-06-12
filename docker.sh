case "$1" in
	dev)
		docker build -f ./Dockerfile.dev -t registry.cn-hangzhou.aliyuncs.com/mex-ssp/mex-ssp-ui:dev .
		docker push registry.cn-hangzhou.aliyuncs.com/mex-ssp/mex-ssp-ui:dev
		;;
	*)
		docker build -t bw-demo:husky .
		# docker push registry.cn-hangzhou.aliyuncs.com/mex-ssp/mex-ssp-ui:husky
		;;
esac

exit 0
