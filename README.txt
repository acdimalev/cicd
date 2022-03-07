Automation

    automation/
      1-build
      2-publish

    #!/bin/sh
    set -ex

    if test -z "$BUILD"; then
      : build variable not set, defaulting to epoch time
      export BUILD=$(date +%s)
    fi

    if test -z "$BUILD"; then
      : build variable not set, defaulting to latest artifact
      export BUILD=$(latest asdf)
    fi


CICD Tools

    ~/artifacts/

    $BUILD

    archive
    publish

    latest


Busy Body

    bench/
      $task/

    logs/
      $task/

    tasks/
      $task/
        bell
        run
        serviced

    watch/
      git/
        $task/
          branch
          last-commit
          repo
