# $Id$
# BioPerl module for Bio::Tools::Run::PiseApplication::njdist
#
# Cared for by Catherine Letondal <letondal@pasteur.fr>
#
# For copyright and disclaimer see below.
#
# POD documentation - main docs before the code

=head1 NAME

Bio::Tools::Run::PiseApplication::njdist

=head1 SYNOPSIS

  #

=head1 DESCRIPTION

Bio::Tools::Run::PiseApplication::njdist

      Bioperl class for:

	Njdist	NJDist Neighbor Joining Phylogeny from Distance Matrix  (J. Adachi & M. Hasegawa)


      Parameters: 

        (see also:
          http://bioweb.pasteur.fr/seqanal/interfaces/njdist.html 
         for available values):


		njdist (String)

		distances (InFile)
			Distance Matrix File
			pipe: phylip_dist

		UPGMA (Switch)
			UPGMA (-u)

		branch (Switch)
			Branch Length (-w)

		leastsq (Switch)
			Least squares (-l)

		sequential (Switch)
			sequential input form (PHYLIP) (-S)

		outgroup (Integer)
			Branch number of Out group (-o)

		treefile (Switch)
			Output Tree (.tre) file? (-T)

		Topo_file (Switch)
			Output Topology (.tpl) file? (-t)

=head1 FEEDBACK

=head2 Mailing Lists

User feedback is an integral part of the evolution of this and other
Bioperl modules. Send your comments and suggestions preferably to
the Bioperl mailing list.  Your participation is much appreciated.

  bioperl-l@bioperl.org                  - General discussion
  http://bioperl.org/wiki/Mailing_lists  - About the mailing lists

=head2 Reporting Bugs

Report bugs to the Bioperl bug tracking system to help us keep track
of the bugs and their resolution. Bug reports can be submitted via the
web:

  http://bugzilla.open-bio.org/

=head1 AUTHOR

Catherine Letondal (letondal@pasteur.fr)

=head1 COPYRIGHT

Copyright (C) 2003 Institut Pasteur & Catherine Letondal.
All Rights Reserved.

This module is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 DISCLAIMER

This software is provided "as is" without warranty of any kind.

=head1 SEE ALSO

=over

=item *

http://bioweb.pasteur.fr/seqanal/interfaces/njdist.html

=item *

Bio::Tools::Run::PiseApplication

=item *

Bio::Tools::Run::AnalysisFactory::Pise

=item *

Bio::Tools::Run::PiseJob

=back

=cut

#'
package Bio::Tools::Run::PiseApplication::njdist;

use vars qw(@ISA);
use strict;
use Bio::Tools::Run::PiseApplication;

@ISA = qw(Bio::Tools::Run::PiseApplication);

=head2 new

 Title   : new()
 Usage   : my $njdist = Bio::Tools::Run::PiseApplication::njdist->new($location, $email, @params);
 Function: Creates a Bio::Tools::Run::PiseApplication::njdist object.
           This method should not be used directly, but rather by 
           a Bio::Tools::Run::AnalysisFactory::Pise instance.
           my $factory = Bio::Tools::Run::AnalysisFactory::Pise->new();
           my $njdist = $factory->program('njdist');
 Example : -
 Returns : An instance of Bio::Tools::Run::PiseApplication::njdist.

=cut

sub new {
    my ($class, $location, $email, @params) = @_;
    my $self = $class->SUPER::new($location, $email);

# -- begin of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/njdist.pm

    $self->{COMMAND}   = "njdist";
    $self->{VERSION}   = "5.a";
    $self->{TITLE}   = "Njdist";

    $self->{DESCRIPTION}   = "NJDist Neighbor Joining Phylogeny from Distance Matrix ";

    $self->{OPT_EMAIL}   = 0;

    $self->{AUTHORS}   = "J. Adachi & M. Hasegawa";

    $self->{_INTERFACE_STANDOUT} = undef;
    $self->{_STANDOUT_FILE} = undef;

    $self->{TOP_PARAMETERS}  = [ 
	"njdist",
	"distances",
	"distopt",

    ];

    $self->{PARAMETERS_ORDER}  = [
	"njdist",
	"distances", 	# Distance Matrix File
	"distopt", 	# NJDist Parameters
	"UPGMA", 	# UPGMA (-u)
	"branch", 	# Branch Length (-w)
	"leastsq", 	# Least squares (-l)
	"sequential", 	# sequential input form (PHYLIP) (-S)
	"outgroup", 	# Branch number of Out group (-o)
	"treefile", 	# Output Tree (.tre) file? (-T)
	"Topo_file", 	# Output Topology (.tpl) file? (-t)
	"tre_file",
	"tpl_file",
	"eps_file",

    ];

    $self->{TYPE}  = {
	"njdist" => 'String',
	"distances" => 'InFile',
	"distopt" => 'Paragraph',
	"UPGMA" => 'Switch',
	"branch" => 'Switch',
	"leastsq" => 'Switch',
	"sequential" => 'Switch',
	"outgroup" => 'Integer',
	"treefile" => 'Switch',
	"Topo_file" => 'Switch',
	"tre_file" => 'Results',
	"tpl_file" => 'Results',
	"eps_file" => 'Results',

    };

    $self->{FORMAT}  = {
	"distances" => {
		"perl" => '" $value"',
	},
	"distopt" => {
	},
	"UPGMA" => {
		"perl" => '($value)? " -u":""',
	},
	"branch" => {
		"perl" => '($value)? " -w":""',
	},
	"leastsq" => {
		"perl" => '($value)? " -l":""',
	},
	"sequential" => {
		"perl" => '($value)? " -S":""',
	},
	"outgroup" => {
		"perl" => '(defined $value)? " -o $value":""',
	},
	"treefile" => {
		"perl" => '($value)? " -T $distances":""',
	},
	"Topo_file" => {
		"perl" => '($value)? " -t $distances":""',
	},
	"tre_file" => {
	},
	"tpl_file" => {
	},
	"eps_file" => {
	},
	"njdist" => {
		"perl" => '"njdist"',
	}

    };

    $self->{FILENAMES}  = {
	"tre_file" => '*.tre',
	"tpl_file" => '*.tpl',
	"eps_file" => '*.eps',

    };

    $self->{SEQFMT}  = {

    };

    $self->{GROUP}  = {
	"distances" => 3,
	"UPGMA" => 1,
	"branch" => 1,
	"leastsq" => 1,
	"sequential" => 1,
	"outgroup" => 1,
	"treefile" => 1,
	"Topo_file" => 1,
	"njdist" => 0

    };

    $self->{BY_GROUP_PARAMETERS}  = [
	"tre_file",
	"distopt",
	"tpl_file",
	"eps_file",
	"njdist",
	"sequential",
	"outgroup",
	"treefile",
	"Topo_file",
	"UPGMA",
	"branch",
	"leastsq",
	"distances",

    ];

    $self->{SIZE}  = {

    };

    $self->{ISHIDDEN}  = {
	"distances" => 0,
	"distopt" => 0,
	"UPGMA" => 0,
	"branch" => 0,
	"leastsq" => 0,
	"sequential" => 0,
	"outgroup" => 0,
	"treefile" => 0,
	"Topo_file" => 0,
	"tre_file" => 0,
	"tpl_file" => 0,
	"eps_file" => 0,
	"njdist" => 1

    };

    $self->{ISCOMMAND}  = {
	"distances" => 0,
	"distopt" => 0,
	"UPGMA" => 0,
	"branch" => 0,
	"leastsq" => 0,
	"sequential" => 0,
	"outgroup" => 0,
	"treefile" => 0,
	"Topo_file" => 0,
	"tre_file" => 0,
	"tpl_file" => 0,
	"eps_file" => 0,

    };

    $self->{ISMANDATORY}  = {
	"distances" => 1,
	"distopt" => 0,
	"UPGMA" => 0,
	"branch" => 0,
	"leastsq" => 0,
	"sequential" => 0,
	"outgroup" => 0,
	"treefile" => 0,
	"Topo_file" => 0,
	"tre_file" => 0,
	"tpl_file" => 0,
	"eps_file" => 0,

    };

    $self->{PROMPT}  = {
	"distances" => "Distance Matrix File",
	"distopt" => "NJDist Parameters",
	"UPGMA" => "UPGMA (-u)",
	"branch" => "Branch Length (-w)",
	"leastsq" => "Least squares (-l)",
	"sequential" => "sequential input form (PHYLIP) (-S)",
	"outgroup" => "Branch number of Out group (-o)",
	"treefile" => "Output Tree (.tre) file? (-T)",
	"Topo_file" => "Output Topology (.tpl) file? (-t)",
	"tre_file" => "",
	"tpl_file" => "",
	"eps_file" => "",

    };

    $self->{ISSTANDOUT}  = {
	"distances" => 0,
	"distopt" => 0,
	"UPGMA" => 0,
	"branch" => 0,
	"leastsq" => 0,
	"sequential" => 0,
	"outgroup" => 0,
	"treefile" => 0,
	"Topo_file" => 0,
	"tre_file" => 0,
	"tpl_file" => 0,
	"eps_file" => 0,

    };

    $self->{VLIST}  = {

	"distopt" => ['UPGMA','branch','leastsq','sequential','outgroup','treefile','Topo_file','tre_file','tpl_file','eps_file',],
    };

    $self->{FLIST}  = {

    };

    $self->{SEPARATOR}  = {

    };

    $self->{VDEF}  = {

    };

    $self->{PRECOND}  = {
	"distances" => { "perl" => '1' },
	"distopt" => { "perl" => '1' },
	"UPGMA" => { "perl" => '1' },
	"branch" => { "perl" => '1' },
	"leastsq" => { "perl" => '1' },
	"sequential" => { "perl" => '1' },
	"outgroup" => { "perl" => '1' },
	"treefile" => { "perl" => '1' },
	"Topo_file" => { "perl" => '1' },
	"tre_file" => {
		"perl" => '$treefile',
	},
	"tpl_file" => {
		"perl" => '$Topo_file',
	},
	"eps_file" => {
		"perl" => '$Topo_file || $treefile',
	},

    };

    $self->{CTRL}  = {

    };

    $self->{PIPEOUT}  = {

    };

    $self->{WITHPIPEOUT}  = {

    };

    $self->{PIPEIN}  = {
	"distances" => {
		 "phylip_dist" => '1',
	},

    };

    $self->{WITHPIPEIN}  = {

    };

    $self->{ISCLEAN}  = {
	"distances" => 0,
	"distopt" => 0,
	"UPGMA" => 0,
	"branch" => 0,
	"leastsq" => 0,
	"sequential" => 0,
	"outgroup" => 0,
	"treefile" => 0,
	"Topo_file" => 0,
	"tre_file" => 0,
	"tpl_file" => 0,
	"eps_file" => 0,

    };

    $self->{ISSIMPLE}  = {
	"distances" => 1,
	"distopt" => 0,
	"UPGMA" => 0,
	"branch" => 0,
	"leastsq" => 0,
	"sequential" => 0,
	"outgroup" => 0,
	"treefile" => 0,
	"Topo_file" => 0,
	"tre_file" => 0,
	"tpl_file" => 0,
	"eps_file" => 0,

    };

    $self->{PARAMFILE}  = {

    };

    $self->{COMMENT}  = {

    };

    $self->{SCALEMIN}  = {

    };

    $self->{SCALEMAX}  = {

    };

    $self->{SCALEINC}  = {

    };

    $self->{INFO}  = {

    };

# -- end of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/njdist.pm



    $self->_init_params(@params);

    return $self;
}



1; # Needed to keep compiler happy

