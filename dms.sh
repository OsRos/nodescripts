#!/usr/local/bin/node
//Dependencies
const sh = require("shelljs");
const _ = require("lodash");

//Constants
const SETUP_BIN = "~/setups/imtf/apps/bin";
const INSTALL_BIN =
    "~/projects/rbs/distribution/target/distribution-1.0.0-SNAPSHOT/bash-install";

//Main
const args = process.argv.slice(2, 4);
const option = args[0];
//const version = args[1]??"1.0.0-SNAPSHOT";
//const INSTALL_BIN =
//  `~/projects/rbs/distribution/target/distribution-${version}/bash-install`;
const cmd = option === "install" ? getInstallCmd() : getExecuteCmd(option);
_.isEmpty(args) ? execute() : execute(cmd, option, args[1]);


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
  option = "status",
  executeArg = "execute"
) {
  (executeArg === "execute")?sh.exec(cmd):sh.echo(cmd);
}

function getCmd(path, bin, option) {
  return `${path}/${bin} ${option}`;
}
