-- Tags: no-fasttest, no-parallel
-- Create user with mix both implicit and explicit auth type, starting with with
CREATE USER u_03174_multiple_auth_show_create IDENTIFIED BY '1', BY '2', BY '3', BY '4';

-- Create user with mix both implicit and explicit auth type, starting with by
CREATE USER u_03174_multiple_auth_show_create IDENTIFIED BY '1', BY '2', BY '3', BY '4';