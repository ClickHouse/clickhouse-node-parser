-- Tags: no-parallel
-- Do not run this test in parallel because `all` workload might affect other queries execution process
-- Test simple resource and workload hierarchy creation
CREATE RESOURCE `03232_write` (write disk `03232_fake_disk`);

CREATE RESOURCE `03232_read` (read disk `03232_fake_disk`);

CREATE WORKLOAD `all`;

CREATE WORKLOAD admin IN `all`;

CREATE WORKLOAD production IN `all`;

CREATE WORKLOAD development IN `all`;

-- Test that illegal actions are not allowed
CREATE WORKLOAD another_root; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD self_ref IN self_ref; -- {serverError BAD_ARGUMENTS}

SYSTEM drop  workload all; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `03232_write`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_GET}

CREATE WORKLOAD invalid IN `all`; -- {serverError INVALID_SCHEDULER_NODE}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_ARGUMENTS}

CREATE WORKLOAD invalid IN `all`; -- {serverError BAD_GET}

CREATE OR REPLACE WORKLOAD `all` IN production; -- {serverError BAD_ARGUMENTS}

-- Test CREATE OR REPLACE WORKLOAD
CREATE OR REPLACE WORKLOAD `all`;

CREATE OR REPLACE WORKLOAD admin IN `all`;

CREATE OR REPLACE WORKLOAD admin IN `all`;

CREATE OR REPLACE WORKLOAD admin IN `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

-- Test CREATE OR REPLACE RESOURCE
CREATE OR REPLACE RESOURCE `03232_write` (write disk `03232_fake_disk_2`);

CREATE OR REPLACE RESOURCE `03232_read` (read disk `03232_fake_disk_2`);

-- Test update settings with CREATE OR REPLACE WORKLOAD
CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

CREATE OR REPLACE WORKLOAD `all`;

CREATE OR REPLACE WORKLOAD `all`;

CREATE OR REPLACE WORKLOAD production IN `all`;

CREATE OR REPLACE WORKLOAD development IN `all`;

-- Test change parent with CREATE OR REPLACE WORKLOAD
CREATE OR REPLACE WORKLOAD development IN production;

CREATE OR REPLACE WORKLOAD development IN admin;

-- Clean up
SYSTEM drop  workload if exists production;

SYSTEM drop  workload if exists development;

SYSTEM drop  workload if exists admin;

SYSTEM drop  workload if exists all;

SYSTEM drop  resource if exists 03232_write;

SYSTEM drop  resource if exists 03232_read;