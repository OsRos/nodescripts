#!/usr/local/bin/node
const sh = require("shelljs");
const _ = require("lodash");
const PARAM_PATH_PREFIX = "Users/canoo/projects/rbs/param/src/main/param/";
const SETUP_PATH_PREFIX = "Users/canoo/setups/imtf/config/application/dms/app/";

const params = process.argv.slice(2, 4);
const configFilePath = params[0];
const executeArg = params[1];

const setupFilePath = configFilePath.replace(
  PARAM_PATH_PREFIX,
  SETUP_PATH_PREFIX
);

execute(configFilePath, setupFilePath, executeArg);
function execute(configFilePath, setupFilePath, executeArg = "execute") {
  const cmd = `cp ${configFilePath} ${setupFilePath}`;
  (executeArg === "execute")
    ? sh.exec(cmd)
    : sh.echo(cmd);
}
