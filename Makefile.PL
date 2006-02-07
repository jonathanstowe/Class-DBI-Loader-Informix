use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Class::DBI::Loader::Informix',
    'VERSION_FROM' => 'lib/Class/DBI/Loader/Informix.pm',
    'PREREQ_PM'    => {
        Test::More         => 0.32,
        DBD::Informix      => 2005.02,
        Class::DBI         => 0.89,
        Class::DBI::Loader => 0.29
    },
);
