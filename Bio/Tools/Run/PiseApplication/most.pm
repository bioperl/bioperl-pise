
=head1 NAME

Bio::Tools::Run::PiseApplication::most

=head1 SYNOPSIS

  #

=head1 DESCRIPTION

Bio::Tools::Run::PiseApplication::most

      Bioperl class for:

	MoST	Motif Search Tool (Tatusov, Altschul, Koonin)

      Parameters:


		most (Excl)
			MoST program

		cap (Paragraph)
			CAP Parameters

		blast_output (InFile)
			Blast Output File

		capoutfile (OutFile)
			CAP result file

		criterium (Excl)
			Criterium

		noless (Integer)
			min height of motif (%)

		blast_score (Integer)
			min Blast score

		mostopt (Paragraph)
			MoST Parameters

		aadb (Excl)
			Protein Database

		block (InFile)
			Block file (generated by CAP)

		iter (Integer)
			how many iterations

		method (Excl)
			Method of computation of position-dependent weight matrix from alignment block

		seg (Switch)
			apply seg filter

		segv (Integer)
			width parameter (if segfilter)

		identical (Integer)
			use only one representative of each group of sequence segments that are #% or more identical

		tmpfile (Results)


=cut

#'
package Bio::Tools::Run::PiseApplication::most;

use vars qw(@ISA);
use strict;
use Bio::Tools::Run::PiseApplication;

@ISA = qw(Bio::Tools::Run::PiseApplication);

=head2 new

 Title   : new()
 Usage   : my $most = Bio::Tools::Run::PiseApplication::most->new($remote, $email, @params);
 Function: Creates a Bio::Tools::Run::PiseApplication::most object.
           This method should not be used directly, but rather by 
           a Bio::Factory::Pise instance:
           my $factory = Bio::Factory::Pise->new(-email => 'me@myhome');
           my $most = $factory->program('most');
 Example :
 Returns : An instance of Bio::Tools::Run::PiseApplication::most.

=cut

sub new {
    my ($class, $remote, $email, @params) = @_;
    my $self = $class->SUPER::new($remote, $email);

# -- begin of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/most.pm

    $self->{COMMAND}   = "most";
    $self->{VERSION}   = "5.a";
    $self->{TITLE}   = "MoST";

    $self->{DESCRIPTION}   = "Motif Search Tool";

    $self->{AUTHORS}   = "Tatusov, Altschul, Koonin";

    $self->{_INTERFACE_STANDOUT} = undef;
    $self->{_STANDOUT_FILE} = undef;

    $self->{TOP_PARAMETERS}  = [ 
	"most",
	"cap",
	"mostopt",
	"tmpfile",

    ];

    $self->{PARAMETERS_ORDER}  = [
	"most", 	# MoST program
	"cap", 	# CAP Parameters
	"blast_output", 	# Blast Output File
	"capoutfile", 	# CAP result file
	"criterium", 	# Criterium
	"noless", 	# min height of motif (%)
	"blast_score", 	# min Blast score
	"mostopt", 	# MoST Parameters
	"aadb", 	# Protein Database
	"block", 	# Block file (generated by CAP)
	"iter", 	# how many iterations
	"method", 	# Method of computation of position-dependent weight matrix from alignment block
	"seg", 	# apply seg filter
	"segv", 	# width parameter (if segfilter)
	"identical", 	# use only one representative of each group of sequence segments that are #% or more identical
	"tmpfile",

    ];

    $self->{TYPE}  = {
	"most" => 'Excl',
	"cap" => 'Paragraph',
	"blast_output" => 'InFile',
	"capoutfile" => 'OutFile',
	"criterium" => 'Excl',
	"noless" => 'Integer',
	"blast_score" => 'Integer',
	"mostopt" => 'Paragraph',
	"aadb" => 'Excl',
	"block" => 'InFile',
	"iter" => 'Integer',
	"method" => 'Excl',
	"seg" => 'Switch',
	"segv" => 'Integer',
	"identical" => 'Integer',
	"tmpfile" => 'Results',

    };

    $self->{FORMAT}  = {
	"most" => {
		"perl" => '$value',
	},
	"cap" => {
	},
	"blast_output" => {
		"perl" => '" $value"',
	},
	"capoutfile" => {
		"perl" => '" $value"',
	},
	"criterium" => {
		"perl" => '($value && $value ne $vdef)? " -t=$value" : "" ',
	},
	"noless" => {
		"perl" => ' (defined $value && $value != $vdef)? " -l$value\\%" : "" ',
	},
	"blast_score" => {
		"perl" => ' (defined $value && $value != $vdef)? " s=$value" : "" ',
	},
	"mostopt" => {
	},
	"aadb" => {
		"perl" => '" $value"',
	},
	"block" => {
		"perl" => '" $value"',
	},
	"iter" => {
		"perl" => '" \\\\#$value"',
	},
	"method" => {
		"perl" => '($value)? " $value" : ""',
	},
	"seg" => {
		"perl" => '(! $value)? " -seg" : " seg$segv" ',
	},
	"segv" => {
		"perl" => '"" ',
	},
	"identical" => {
		"perl" => ' (defined $value)? " i$value\\%" : "" ',
	},
	"tmpfile" => {
	},

    };

    $self->{FILENAMES}  = {
	"tmpfile" => '*.mes remost.all',

    };

    $self->{SEQFMT}  = {

    };

    $self->{GROUP}  = {
	"most" => 0,
	"blast_output" => 1,
	"capoutfile" => 2,
	"criterium" => 3,
	"noless" => 3,
	"blast_score" => 3,
	"aadb" => 2,
	"block" => 3,
	"iter" => 1,
	"method" => 4,
	"seg" => 4,
	"segv" => 4,
	"identical" => 4,

    };

    $self->{BY_GROUP_PARAMETERS}  = [
	"most",
	"cap",
	"mostopt",
	"tmpfile",
	"blast_output",
	"iter",
	"capoutfile",
	"aadb",
	"blast_score",
	"block",
	"noless",
	"criterium",
	"seg",
	"segv",
	"identical",
	"method",

    ];

    $self->{SIZE}  = {

    };

    $self->{ISHIDDEN}  = {
	"most" => 0,
	"cap" => 0,
	"blast_output" => 0,
	"capoutfile" => 0,
	"criterium" => 0,
	"noless" => 0,
	"blast_score" => 0,
	"mostopt" => 0,
	"aadb" => 0,
	"block" => 0,
	"iter" => 0,
	"method" => 0,
	"seg" => 0,
	"segv" => 0,
	"identical" => 0,
	"tmpfile" => 0,

    };

    $self->{ISCOMMAND}  = {
	"most" => 1,
	"cap" => 0,
	"blast_output" => 0,
	"capoutfile" => 0,
	"criterium" => 0,
	"noless" => 0,
	"blast_score" => 0,
	"mostopt" => 0,
	"aadb" => 0,
	"block" => 0,
	"iter" => 0,
	"method" => 0,
	"seg" => 0,
	"segv" => 0,
	"identical" => 0,
	"tmpfile" => 0,

    };

    $self->{ISMANDATORY}  = {
	"most" => 0,
	"cap" => 0,
	"blast_output" => 1,
	"capoutfile" => 1,
	"criterium" => 0,
	"noless" => 0,
	"blast_score" => 0,
	"mostopt" => 0,
	"aadb" => 1,
	"block" => 1,
	"iter" => 1,
	"method" => 0,
	"seg" => 0,
	"segv" => 0,
	"identical" => 0,
	"tmpfile" => 0,

    };

    $self->{PROMPT}  = {
	"most" => "MoST program",
	"cap" => "CAP Parameters",
	"blast_output" => "Blast Output File",
	"capoutfile" => "CAP result file",
	"criterium" => "Criterium",
	"noless" => "min height of motif (%)",
	"blast_score" => "min Blast score",
	"mostopt" => "MoST Parameters",
	"aadb" => "Protein Database",
	"block" => "Block file (generated by CAP)",
	"iter" => "how many iterations",
	"method" => "Method of computation of position-dependent weight matrix from alignment block",
	"seg" => "apply seg filter",
	"segv" => "width parameter (if segfilter)",
	"identical" => "use only one representative of each group of sequence segments that are #% or more identical",
	"tmpfile" => "",

    };

    $self->{ISSTANDOUT}  = {
	"most" => 0,
	"cap" => 0,
	"blast_output" => 0,
	"capoutfile" => 0,
	"criterium" => 0,
	"noless" => 0,
	"blast_score" => 0,
	"mostopt" => 0,
	"aadb" => 0,
	"block" => 0,
	"iter" => 0,
	"method" => 0,
	"seg" => 0,
	"segv" => 0,
	"identical" => 0,
	"tmpfile" => 0,

    };

    $self->{VLIST}  = {

	"most" => ['CAP','CAP: Blast alignment parser - must be run first','most','most (must be run with a CAP result file)',],
	"cap" => ['blast_output','capoutfile','criterium','noless','blast_score',],
	"criterium" => ['diri','diri: rank by information content using Dirichlet priors','matrix','matrix: rank by the average score per residue','square','square: rank by the product height * width','height','height: rank by the \'height\' of the block',],
	"mostopt" => ['aadb','block','iter','method','seg','segv','identical',],
	"aadb" => ['swissprot','swissprot','swissprot_new','swissprot_new: Swissprot updates','pir','pir','genpept','genpept: Genbank translation','genpept_new','genpept_new: genpept updates','gpbct','gpbct: genpept bacteries','gppri','gppri','gpmam','gpmam','gprod','gprod','gpvrt','gpvrt','gpinv','gpinv','gppln','gppln','gprna','gprna','gpvrl','gpvrl','gpphg','gpphg','gpest','gpest','gpsts','gpsts','gpsyn','gpsyn','gppat','gppat','gpuna','gpuna','nrprot','nrprot: Swissprot + Nrl_3d + PIR','nrl3d','nrl3d: sequences from PDB','prodom','prodom','sbase','sbase: annotated domains sequences',],
	"method" => ['one','one: weighted averaging (Gribskov method)','two','two: Bayesian prediction (pseudocount) method','three','three: data-dependent pseudocount method',],
    };

    $self->{FLIST}  = {

    };

    $self->{SEPARATOR}  = {

    };

    $self->{VDEF}  = {
	"most" => 'CAP',
	"criterium" => 'diri',
	"noless" => '50',
	"aadb" => 'swissprot_new',
	"iter" => '1',
	"seg" => '0',

    };

    $self->{PRECOND}  = {
	"most" => { "perl" => '1' },
	"cap" => {
		"perl" => '($most eq "CAP")  ',
	},
	"blast_output" => {
		"perl" => '($most eq "CAP")  ',
	},
	"capoutfile" => {
		"perl" => '($most eq "CAP")  ',
	},
	"criterium" => {
		"perl" => '($most eq "CAP")  ',
	},
	"noless" => {
		"perl" => '($most eq "CAP")  ',
	},
	"blast_score" => {
		"perl" => '($most eq "CAP")  ',
	},
	"mostopt" => {
		"perl" => ' ($most eq "most") ',
	},
	"aadb" => {
		"perl" => ' ($most eq "most") ',
	},
	"block" => {
		"perl" => ' ($most eq "most") ',
	},
	"iter" => {
		"perl" => ' ($most eq "most") ',
	},
	"method" => {
		"perl" => ' ($most eq "most") ',
	},
	"seg" => {
		"perl" => ' ($most eq "most") ',
	},
	"segv" => {
		"perl" => ' ($most eq "most")  && $seg',
	},
	"identical" => {
		"perl" => ' ($most eq "most") ',
	},
	"tmpfile" => { "perl" => '1' },

    };

    $self->{CTRL}  = {
	"noless" => {
		"perl" => {
			'$value < 0 || $value > 100' => "it's a percentage",
		},
	},

    };

    $self->{PIPEOUT}  = {

    };

    $self->{WITHPIPEOUT}  = {

    };

    $self->{PIPEIN}  = {

    };

    $self->{WITHPIPEIN}  = {

    };

    $self->{ISCLEAN}  = {
	"most" => 0,
	"cap" => 0,
	"blast_output" => 0,
	"capoutfile" => 0,
	"criterium" => 0,
	"noless" => 0,
	"blast_score" => 0,
	"mostopt" => 0,
	"aadb" => 0,
	"block" => 0,
	"iter" => 0,
	"method" => 0,
	"seg" => 0,
	"segv" => 0,
	"identical" => 0,
	"tmpfile" => 0,

    };

    $self->{ISSIMPLE}  = {
	"most" => 0,
	"cap" => 0,
	"blast_output" => 0,
	"capoutfile" => 0,
	"criterium" => 0,
	"noless" => 0,
	"blast_score" => 0,
	"mostopt" => 0,
	"aadb" => 0,
	"block" => 0,
	"iter" => 0,
	"method" => 0,
	"seg" => 0,
	"segv" => 0,
	"identical" => 0,
	"tmpfile" => 0,

    };

    $self->{PARAMFILE}  = {

    };

    $self->{COMMENT}  = {
	"most" => [
		"You should run: 1. CAP, 2. MoST",
		"Program CAP (Consistent Alignment Parser) may be used to construct blocks acceptable for MoST from BLAST outputs.",
		"MoST will scan the indicated database iteratively until convergence, by adding segments selected at each iteration to the original block, constructed by CAP.",
	],
	"capoutfile" => [
		"will be used as block file for MoST",
	],
	"criterium" => [
		"Defines the Threshold used to rank blocks of consistent alignment segments",
		". diri - rank by information content using Dirichlet mixture priors to calculate backgrund probabilities (analogous to the default method of weight matrix construction in MoST)",
		". height - rank by the \'height\' of the block, i.e. the number of consistent segment longer than 7 aa",
		". square - rank by the product height x width, i.e. number of segments multiplied by the number of amino acids in each of them",
		". matrix - rank by the average score per residue calculated using the BLOSUM62 matrix",
		"Default is t=diri",
	],
	"noless" => [
		"-l% - construct only blocks that include no less than certain percentage of the sequences form the BLAST output (default is 50%)",
	],
	"blast_score" => [
		"use only alignments that have BLAST scores equal or greater than this",
	],
	"method" => [
		"This refers to the method of computation of position-dependent weight matrix from alignment block",
		"Default is application of Dirichlet mixture priors to calculate the weight for each amino acid.",
		"- one is weighted averaging (Gribskov method).",
		"- two is Bayesian prediction (pseudocount) method",
		"- three is data-dependent pseudocount method",
	],
	"seg" => [
		"default is to apply seg filter for each segment found",
		"-seg means omit seg",
		"seq# - run seg filter with width parameter #(number)",
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

# -- end of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/most.pm



    $self->_init_params(@params);

    return $self;
}



1; # Needed to keep compiler happy

