#!/usr/local/bin/node
//Dependencies
const sh = require("shelljs");
const _ = require("lodash");

//Constants
const SETUP_BIN = "~/setups/imtf/apps/bin";

//Main
const args = process.argv.slice(2, 5);
const option = args[0];
const isEcho = option === "install" ? args[2] : args[1];
const version = option === "install" ? args[1] : null;
const INSTALL_BIN =
 `~/projects/rbs/distribution/target/distribution-${version}/bash-install`;
const cmd = option === "install" ? getInstallCmd() : getExecuteCmd(option);
_.isEmpty(args) ? execute() : execute(cmd, option, isEcho);


//Helpers
function getInstallCmd(option = "dev") {
  return getCmd(INSTALL_BIN, "install.sh", option);
}

function getExecuteCmd(option = "status") {
  const bin = option === "client" ? "karaf-admin.sh" : "dms.sh";
  return getCmd(SETUP_BIN, bin, option);
}

//Core
function execute(
  cmd = getExecuteCmd(),
  isEcho = false
) {
  isEcho?sh.exec(cmd):sh.echo(cmd);
}

function getCmd(path, bin, option) {
  return `${path}/${bin} ${option}`;
}