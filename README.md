# react-template

## Attention notice
If the configured s3 setting already exists , this script change the configuration your environment .

## Dependency
Tested only zsh on macOS , so if you want to use script for Windows . Please regulation yourself .

## Require

- Docker
- DockerCompose
- AWS CLI

### Usage

#### please setting REGION in aws cli and cloudformation.sh

For example

```bash:cloudformation.sh
readonly REGION=us-east-1
```

0. all: from create app and build to deploy phase

```bash
$ make
```

1. build phase

```bash
$ make build
```

2. run phse

```bash
$ make run
```

3. to aws deploy phase

```bash
$ make deploy
```

4. stack and s3 remove phase

```bash
$ make remove
```

## License
Copyright (c) 2021 Kazuya yuda.
This software is released under the MIT License, see LICENSE.
https://opensource.org/licenses/mit-license.php

## Authors
kazuya yuda.
