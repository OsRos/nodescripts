#!/usr/local/bin/node
const sh = require("shelljs");
const _ = require("lodash");

const args = process.argv.slice(2);
_.isEmpty(args) ? execute(true) : execute(false);

function execute(isOffline = true) {
  const mvnCmd = "~/projects/rbs/mvnw";
  const cleaninstallGoals = "clean install";
  const skipTests = "-D skipTests";
  const offlineOption = isOffline ? " -o" : "";
  const versionOption = " -v";
  //   const cmd = `${mvnCmd} ${versionOption}`;
  const cmd = `${mvnCmd} ${offlineOption} ${cleaninstallGoals} ${skipTests}`;
  //   sh.echo(cmd);
  sh.exec(cmd);
}
