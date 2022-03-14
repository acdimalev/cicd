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
---------

    bench/
      $task/

    logs/
      $task/


Tasks

    tasks/$task/
      bell
      run
      serviced

A `task' has a `run'-script to be executed whenever its `bell' is "rung".  There is also a last-`serviced' time to keep track of executions.

Queueing up an execution is as simple at `touch`ing the `bell`.

    touch tasks/$task/bell

The last-`serviced` time can be manually checked with `stat`.

    stat -c %y tasks/$task/serviced


Watch

    watch/$task/
      err
      last
      run

For each `task`, an external resource can be `watch`ed.  The `run`-script collects information about the resource, which is then compared to the `last` recorded value.  If the two differ, the `task`s `bell` is rung, and the new value is recorded as the `last` value.

In case of an error, the `run`-script should return non-zero.  Comparison with the `last` value is then skipped entirely.  And all error output is recorded into the `err` file.
