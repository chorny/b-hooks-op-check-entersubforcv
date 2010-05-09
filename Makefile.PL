use 5.006;
use strict;
use warnings;
use inc::Module::Install;
use ExtUtils::Depends;

name 'B-Hooks-OP-Check-EntersubForCV';
all_from 'lib/B/Hooks/OP/Check/EntersubForCV.pm';

requires 'parent';
requires 'Scalar::Util';
requires 'B::Utils' => 0.08;
requires 'B::Hooks::OP::Check' => '0.18';
build_requires 'B::Utils' => 0.08;
build_requires 'B::Hooks::OP::Check' => '0.18';
configure_requires 'ExtUtils::Depends' => '0.302'; #minimum version that works on Win32+gcc
configure_requires 'B::Utils' => 0.08;
#minimum version that depends on ExtUtils::Depends 0.302
configure_requires 'B::Hooks::OP::Check' => '0.18';
#minimum version that depends on ExtUtils::Depends 0.302


my $pkg = ExtUtils::Depends->new('B::Hooks::OP::Check::EntersubForCV', 'B::Hooks::OP::Check', 'B::Utils');
$pkg->install('hook_op_check_entersubforcv.h');
$pkg->add_xs('EntersubForCV.xs');
$pkg->add_pm('lib/B/Hooks/OP/Check/EntersubForCV.pm' => '$(INST_LIB)/B/Hooks/OP/Check/EntersubForCV.pm');

mkdir 'build';
$pkg->save_config('build/IFiles.pm');

makemaker_args(
    $pkg->get_makefile_vars,
    dist => { PREOP => 'pod2text lib/B/Hooks/OP/Check/EntersubForCV.pm > README' },
);

repository 'http://github.com/rafl/b-hooks-op-check-entersubforcv.git';

extra_tests;

WriteAll;
