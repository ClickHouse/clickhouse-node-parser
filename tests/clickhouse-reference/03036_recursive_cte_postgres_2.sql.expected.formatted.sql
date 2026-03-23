/**
  * Based on https://github.com/postgres/postgres/blob/master/src/test/regress/sql/with.sql, license:
  *
  * PostgreSQL Database Management System
  * (formerly known as Postgres, then as Postgres95)
  *
  * Portions Copyright (c) 1996-2024, PostgreSQL Global Development Group
  *
  * Portions Copyright (c) 1994, The Regents of the University of California
  *
  * Permission to use, copy, modify, and distribute this software and its
  * documentation for any purpose, without fee, and without a written agreement
  * is hereby granted, provided that the above copyright notice and this
  * paragraph and the following two paragraphs appear in all copies.
  *
  * IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY FOR
  * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
  * LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS
  * DOCUMENTATION, EVEN IF THE UNIVERSITY OF CALIFORNIA HAS BEEN ADVISED OF THE
  * POSSIBILITY OF SUCH DAMAGE.
  *
  * THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
  * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
  * AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
  * ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATIONS TO
  *PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
  */
--
-- Tests for common table expressions (WITH query, ... SELECT ...)
--
-- { echoOn }
SET enable_analyzer = 1;

--
-- Some examples with a tree
--
-- department structure represented here is as follows:
--
-- ROOT-+->A-+->B-+->C
--      |         |
--      |         +->D-+->F
--      +->E-+->G
SYSTEM DROP  TABLE IF EXISTS department;

CREATE TABLE department
(
    id UInt64,
    parent_department UInt64,
    name String
)
ENGINE = TinyLog;

INSERT INTO department;

INSERT INTO department;

INSERT INTO department;

INSERT INTO department;

INSERT INTO department;

INSERT INTO department;

INSERT INTO department;

INSERT INTO department;

-- inside subqueries
SELECT count(*)
FROM (
        WITH t AS (
            SELECT toUInt64(1) AS n
            UNION ALL
            SELECT n + 1
            FROM t
            WHERE n < 500
        )

        SELECT *
        FROM t
    ) AS t
WHERE n < (
        SELECT count(*)
        FROM (
                WITH t AS (
                    SELECT toUInt64(1) AS n
                    UNION ALL
                    SELECT n + 1
                    FROM t
                    WHERE n < 100
                )

                SELECT *
                FROM t
                WHERE n < 50000
            ) AS t
        WHERE n < 100
    );