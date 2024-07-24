// import sqliteWasm from "wa-sqlite/dist/wa-sqlite-async.wasm?asset";

import { ElectricDatabase, electrify } from "electric-sql/wa-sqlite";

import { type Electric, schema } from "./generated/client";

import { authToken } from "./auth";
import { uniqueTabId } from "electric-sql/util";
import { LIB_VERSION } from "electric-sql/version";

const { tabId } = uniqueTabId();
const scopedDbName = `basic-${LIB_VERSION}-${tabId}.db`;

const config = {
  debug: import.meta.env.DEV,
  url: import.meta.env.ELECTRIC_SERVICE,
};

const conn = await ElectricDatabase.init(scopedDbName);
const client = await electrify(conn, schema, config);

await client.connect(authToken());

console.log("Connected to ElectricSQL", client);

export const electric = client;
