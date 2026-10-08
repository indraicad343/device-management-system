import { readFileSync } from "node:fs";
import { join } from "node:path";
import { pool } from "./db";

async function migrate() {
  const sql = readFileSync(join(process.cwd(), "db", "schema.sql"), "utf8");
  await pool.query(sql);
  console.log("Schema applied");
  await pool.end();
}

migrate().catch((err) => {
  console.error("Migration failed:", err);
  process.exit(1);
});