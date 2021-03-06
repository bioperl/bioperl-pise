# $Id$
# BioPerl module for Bio::Tools::Run::PiseApplication::notseq
#
# Cared for by Catherine Letondal <letondal@pasteur.fr>
#
# For copyright and disclaimer see below.
#
# POD documentation - main docs before the code

=head1 NAME

Bio::Tools::Run::PiseApplication::notseq

=head1 SYNOPSIS

  #

=head1 DESCRIPTION

Bio::Tools::Run::PiseApplication::notseq

      Bioperl class for:

	NOTSEQ	Excludes a set of sequences and writes out the remaining ones (EMBOSS)


      Parameters: 

        (see also:
          http://bioweb.pasteur.fr/seqanal/interfaces/notseq.html 
         for available values):


		notseq (String)

		init (String)

		sequence (Sequence)
			sequence [sequences] (-sequence)
			pipe: seqsfile

		exclude (String)
			Sequence names to exclude (-exclude)

		outseq (OutFile)
			outseq (-outseq)
			pipe: seqsfile

		outseq_sformat (Excl)
			Output format for: outseq

		junkout (OutFile)
			file of excluded sequences (-junkout)

		junkout_sformat (Excl)
			Output format for: file of excluded sequences

		auto (String)

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

http://bioweb.pasteur.fr/seqanal/interfaces/notseq.html

=item *

Bio::Tools::Run::PiseApplication

=item *

Bio::Tools::Run::AnalysisFactory::Pise

=item *

Bio::Tools::Run::PiseJob

=back

=cut

#'
package Bio::Tools::Run::PiseApplication::notseq;

use vars qw(@ISA);
use strict;
use Bio::Tools::Run::PiseApplication;

@ISA = qw(Bio::Tools::Run::PiseApplication);

=head2 new

 Title   : new()
 Usage   : my $notseq = Bio::Tools::Run::PiseApplication::notseq->new($location, $email, @params);
 Function: Creates a Bio::Tools::Run::PiseApplication::notseq object.
           This method should not be used directly, but rather by 
           a Bio::Tools::Run::AnalysisFactory::Pise instance.
           my $factory = Bio::Tools::Run::AnalysisFactory::Pise->new();
           my $notseq = $factory->program('notseq');
 Example : -
 Returns : An instance of Bio::Tools::Run::PiseApplication::notseq.

=cut

sub new {
    my ($class, $location, $email, @params) = @_;
    my $self = $class->SUPER::new($location, $email);

# -- begin of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/notseq.pm

    $self->{COMMAND}   = "notseq";
    $self->{VERSION}   = "5.a";
    $self->{TITLE}   = "NOTSEQ";

    $self->{DESCRIPTION}   = "Excludes a set of sequences and writes out the remaining ones (EMBOSS)";

    $self->{OPT_EMAIL}   = 0;

    $self->{CATEGORIES}   =  [  

         "edit",
  ];

    $self->{DOCLINK}   = "http://www.uk.embnet.org/Software/EMBOSS/Apps/notseq.html";

    $self->{_INTERFACE_STANDOUT} = undef;
    $self->{_STANDOUT_FILE} = undef;

    $self->{TOP_PARAMETERS}  = [ 
	"notseq",
	"init",
	"input",
	"required",
	"output",
	"auto",

    ];

    $self->{PARAMETERS_ORDER}  = [
	"notseq",
	"init",
	"input", 	# input Section
	"sequence", 	# sequence [sequences] (-sequence)
	"required", 	# required Section
	"exclude", 	# Sequence names to exclude (-exclude)
	"output", 	# output Section
	"outseq", 	# outseq (-outseq)
	"outseq_sformat", 	# Output format for: outseq
	"junkout", 	# file of excluded sequences (-junkout)
	"junkout_sformat", 	# Output format for: file of excluded sequences
	"auto",

    ];

    $self->{TYPE}  = {
	"notseq" => 'String',
	"init" => 'String',
	"input" => 'Paragraph',
	"sequence" => 'Sequence',
	"required" => 'Paragraph',
	"exclude" => 'String',
	"output" => 'Paragraph',
	"outseq" => 'OutFile',
	"outseq_sformat" => 'Excl',
	"junkout" => 'OutFile',
	"junkout_sformat" => 'Excl',
	"auto" => 'String',

    };

    $self->{FORMAT}  = {
	"init" => {
		"perl" => ' "" ',
	},
	"input" => {
	},
	"sequence" => {
		"perl" => '" -sequence=$value -sformat=fasta"',
	},
	"required" => {
	},
	"exclude" => {
		"perl" => '" -exclude=$value"',
	},
	"output" => {
	},
	"outseq" => {
		"perl" => '" -outseq=$value"',
	},
	"outseq_sformat" => {
		"perl" => '" -osformat=$value"',
	},
	"junkout" => {
		"perl" => '($value && $value ne $vdef)? " -junkout=$value" : ""',
	},
	"junkout_sformat" => {
		"perl" => '" -osformat=$value"',
	},
	"auto" => {
		"perl" => '" -auto -stdout"',
	},
	"notseq" => {
		"perl" => '"notseq"',
	}

    };

    $self->{FILENAMES}  = {

    };

    $self->{SEQFMT}  = {
	"sequence" => [8],

    };

    $self->{GROUP}  = {
	"init" => -10,
	"sequence" => 1,
	"exclude" => 2,
	"outseq" => 3,
	"outseq_sformat" => 4,
	"junkout" => 5,
	"junkout_sformat" => 6,
	"auto" => 7,
	"notseq" => 0

    };

    $self->{BY_GROUP_PARAMETERS}  = [
	"init",
	"input",
	"required",
	"output",
	"notseq",
	"sequence",
	"exclude",
	"outseq",
	"outseq_sformat",
	"junkout",
	"junkout_sformat",
	"auto",

    ];

    $self->{SIZE}  = {

    };

    $self->{ISHIDDEN}  = {
	"init" => 1,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"exclude" => 0,
	"output" => 0,
	"outseq" => 0,
	"outseq_sformat" => 0,
	"junkout" => 0,
	"junkout_sformat" => 0,
	"auto" => 1,
	"notseq" => 1

    };

    $self->{ISCOMMAND}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"exclude" => 0,
	"output" => 0,
	"outseq" => 0,
	"outseq_sformat" => 0,
	"junkout" => 0,
	"junkout_sformat" => 0,
	"auto" => 0,

    };

    $self->{ISMANDATORY}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 1,
	"required" => 0,
	"exclude" => 1,
	"output" => 0,
	"outseq" => 1,
	"outseq_sformat" => 0,
	"junkout" => 0,
	"junkout_sformat" => 0,
	"auto" => 0,

    };

    $self->{PROMPT}  = {
	"init" => "",
	"input" => "input Section",
	"sequence" => "sequence [sequences] (-sequence)",
	"required" => "required Section",
	"exclude" => "Sequence names to exclude (-exclude)",
	"output" => "output Section",
	"outseq" => "outseq (-outseq)",
	"outseq_sformat" => "Output format for: outseq",
	"junkout" => "file of excluded sequences (-junkout)",
	"junkout_sformat" => "Output format for: file of excluded sequences",
	"auto" => "",

    };

    $self->{ISSTANDOUT}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"exclude" => 0,
	"output" => 0,
	"outseq" => 0,
	"outseq_sformat" => 0,
	"junkout" => 0,
	"junkout_sformat" => 0,
	"auto" => 0,

    };

    $self->{VLIST}  = {

	"input" => ['sequence',],
	"required" => ['exclude',],
	"output" => ['outseq','outseq_sformat','junkout','junkout_sformat',],
	"outseq_sformat" => ['fasta','fasta','gcg','gcg','phylip','phylip','embl','embl','swiss','swiss','ncbi','ncbi','nbrf','nbrf','genbank','genbank','ig','ig','codata','codata','strider','strider','acedb','acedb','staden','staden','text','text','fitch','fitch','msf','msf','clustal','clustal','phylip','phylip','phylip3','phylip3','asn1','asn1',],
	"junkout_sformat" => ['fasta','fasta','gcg','gcg','phylip','phylip','embl','embl','swiss','swiss','ncbi','ncbi','nbrf','nbrf','genbank','genbank','ig','ig','codata','codata','strider','strider','acedb','acedb','staden','staden','text','text','fitch','fitch','msf','msf','clustal','clustal','phylip','phylip','phylip3','phylip3','asn1','asn1',],
    };

    $self->{FLIST}  = {

    };

    $self->{SEPARATOR}  = {

    };

    $self->{VDEF}  = {
	"outseq" => 'outseq.out',
	"outseq_sformat" => 'fasta',
	"junkout" => '/dev/null',
	"junkout_sformat" => 'fasta',

    };

    $self->{PRECOND}  = {
	"init" => { "perl" => '1' },
	"input" => { "perl" => '1' },
	"sequence" => { "perl" => '1' },
	"required" => { "perl" => '1' },
	"exclude" => { "perl" => '1' },
	"output" => { "perl" => '1' },
	"outseq" => { "perl" => '1' },
	"outseq_sformat" => { "perl" => '1' },
	"junkout" => { "perl" => '1' },
	"junkout_sformat" => { "perl" => '1' },
	"auto" => { "perl" => '1' },

    };

    $self->{CTRL}  = {

    };

    $self->{PIPEOUT}  = {
	"outseq" => {
		 '1' => "seqsfile",
	},

    };

    $self->{WITHPIPEOUT}  = {

    };

    $self->{PIPEIN}  = {
	"sequence" => {
		 "seqsfile" => '1',
	},

    };

    $self->{WITHPIPEIN}  = {

    };

    $self->{ISCLEAN}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"exclude" => 0,
	"output" => 0,
	"outseq" => 0,
	"outseq_sformat" => 0,
	"junkout" => 0,
	"junkout_sformat" => 0,
	"auto" => 0,

    };

    $self->{ISSIMPLE}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 1,
	"required" => 0,
	"exclude" => 1,
	"output" => 0,
	"outseq" => 1,
	"outseq_sformat" => 1,
	"junkout" => 0,
	"junkout_sformat" => 0,
	"auto" => 0,

    };

    $self->{PARAMFILE}  = {

    };

    $self->{COMMENT}  = {
	"exclude" => [
		"Enter a list of sequence names or accession numbers to exclude from the sequences read in.  The excluded sequences will be written to the file specified in the \'junkout\' parameter.  The remainder will be written out to the file specified in the \'outseq\' parameter.  <BR> The list of sequence names can be separated by either spaces or commas.  <BR> The sequence names can be wildcarded.  <BR> The sequence names are case independent.  <BR> An example of a list of sequences to be excluded is: <BR> myseq, hs*, one two three <BR> a file containing a list of sequence names can be specified by giving the file name preceeded by a \'\@\', eg: \'\@names.dat\'",
	],
	"junkout" => [
		"This file collects the sequences which you have excluded from the main output file of sequences.",
	],

    };

    $self->{SCALEMIN}  = {

    };

    $self->{SCALEMAX}  = {

    };

    $self->{SCALEINC}  = {

    };

    $self->{INFO}  = {

    };

# -- end of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/notseq.pm



    $self->_init_params(@params);

    return $self;
}



1; # Needed to keep compiler happy

