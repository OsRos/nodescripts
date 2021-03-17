#!/usr/local/bin/node
const sh = require("shelljs");
const _ = require("lodash");

const arg = process.argv.slice(2, 3);
_.isEmpty(arg) ? execute() : execute(arg);

function execute(env = "dev") {
  const _cmd =
    "~/projects/rbs/distribution/target/distribution-1.0.0-SNAPSHOT/bash-install/install.sh";
  const cmd = `${_cmd} ${env}`;
//  sh.echo(cmd);
  sh.exec(cmd)
}
