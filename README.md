## CSGHub installer

[简体中文](./docs/cn/csghub_installer.md)

This project provides installation scripts and configuration files for deploying CSGHub instances, including Helm Chart and Docker Compose scripts, to simplify the deployment process in various environments. 

Please go to [here](https://github.com/OpenCSGs/csghub) for more details information about CSGHub.

### Installation methods 

**Choose the right method for your deployment:**

**【Recommend for quick-start】** If you are trying CSGHub for fast-try on your test/dev environment without complicated configs, you could go to the [Docker](#docker) section

**【Recommend for production-env】** If you are using CSGHub for production envirement with kubernetes supported, you should go to the [HelmChart](#helm-chart) section

If you are familar with Docker Compose and trying to use CSGHub, you could go to the [DockerCompose](#docker-compose) section

#### Docker 
1. The docker deployment method is mainly used for simple functional experience testing. It has just been launched and some functions are not yet perfect. They will be supplemented later.
2. Functions that depend on k8s are not yet completed.
3. For mor details about docker installation, please refer to [docker](./docker/README.md)

#### Helm Chart
1. The helm chart method is suitable for scenarios with high stability and availability, such as production environments.
2. helm chart only supports `gitaly` as the git server backend,  `gitea` is not supported.
3. For more details about helm chart installation and deployment, please refer to [helm-chart](./helm-chart/README.md)

#### Docker Compose
1. compose mode can be used for test and develop purpose. It is recommended to use helm chart installation for production environments.
2. CSGHub instance that deployed with compose mode cannot directly use functions which rely on the kubernetes platform, such as space, model inference, and model fine-tuning. Kubernetes's deployment and configuration are not within the scope of the compose installation method, it needs further manual configurations which can be found [here](./docker-compose/csghub/README.md#configure-kubernetes)
3. Starting from CSGHub v0.9.0, CSGHub no longer provides continuous support for gitea backend, and it is recommended to use `gitaly` as default git server backend.
4. Provide a solution for one-click deployment to Alibaba Cloud, [Deployment Link](https://computenest.console.aliyun.com/service/instance/create/cn-hangzhou?type=user&ServiceId=service-712413c5c35c47b3a42c)
5. For more details about compose installation and deployment, please refer to [docker-compose](./docker-compose/csghub/README.md)
