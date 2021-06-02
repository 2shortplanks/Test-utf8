#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;
use Test::Builder::Tester;
use Test::utf8;

test_out("ok 1 - within ascii");
is_within_ascii("foo");
test_test("within ascii");

test_out("ok 1 - bar");
is_within_ascii("foo","bar");
test_test("within ascii name");

test_out("not ok 1 - within ascii");
test_fail(+2);
test_diag("Char 4 not ASCII (it's 233 dec / e9 hex)");
is_within_ascii("foo\x{e9} foo");
test_test("within ascii failure");

test_out("ok 1 - not within ascii");
isnt_within_ascii("foo\x{e9} foo");
test_test("not within ascii");

test_out("not ok 1 - not within ascii\n# (it's 102-111-111 dec / 66-6f-6f hex)");
test_fail(+2);
test_diag("foo is all ASCII");
isnt_within_ascii("foo");
test_test("not within ascii failure");
