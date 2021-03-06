# $Id$
# BioPerl module for Bio::Tools::Run::PiseApplication::protpars
#
# Cared for by Catherine Letondal <letondal@pasteur.fr>
#
# For copyright and disclaimer see below.
#
# POD documentation - main docs before the code

=head1 NAME

Bio::Tools::Run::PiseApplication::protpars

=head1 SYNOPSIS

  #

=head1 DESCRIPTION

Bio::Tools::Run::PiseApplication::protpars

      Bioperl class for:

	Phylip	protpars - Protein Sequence Parcimony Method (Felsenstein)

	References:

		Felsenstein, J.  1993.  PHYLIP (Phylogeny Inference Package) version 3.5c. Distributed by the author.  Department of Genetics, University of Washington, Seattle.

		Felsenstein, J.  1989.  PHYLIP -- Phylogeny Inference Package (Version 3.2). Cladistics  5: 164-166.



      Parameters: 

        (see also:
          http://bioweb.pasteur.fr/seqanal/interfaces/protpars.html 
         for available values):


		protpars (String)

		infile (Sequence)
			Alignement File
			pipe: readseq_ok_alig

		use_threshold (Switch)
			Use Threshold parsimony (T)

		threshold (Integer)
			Threshold value (if use threshold parsimony)

		code (Excl)
			Genetic code (U)

		jumble (Switch)
			Randomize (jumble) input order of sequences (J)

		jumble_seed (Integer)
			Jumble random number seed (must be odd)

		times (Integer)
			Number of times to jumble

		seqboot (Switch)
			Perform a bootstrap before analysis

		method (Excl)
			Resampling methods

		seqboot_seed (Integer)
			Random number seed (must be odd)

		replicates (Integer)
			How many replicates

		consense (Switch)
			Compute a consensus tree

		user_tree (Switch)
			Use User tree (default: no, search for best tree) (U)

		tree_file (InFile)
			User Tree file

		print_tree (Switch)
			Print out tree (3)

		print_sequences (Switch)
			Print sequences at all nodes of tree (5)

		print_treefile (Switch)
			Write out trees onto tree file (6)

		printdata (Switch)
			Print out the data at start of run (1)

		print_steps (Switch)
			Print out steps in each site (4)

		indent_tree (Switch)
			Indent treefile

		outgroup (Integer)
			Outgroup species (default, use as outgroup species 1) (O)

		confirm (String)

		terminal_type (String)

		multiple_dataset (String)

		bootconfirm (String)

		bootterminal_type (String)

		consense_confirm (String)

		consense_terminal_type (String)

		consense_outgroup (String)

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

http://bioweb.pasteur.fr/seqanal/interfaces/protpars.html

=item *

Bio::Tools::Run::PiseApplication

=item *

Bio::Tools::Run::AnalysisFactory::Pise

=item *

Bio::Tools::Run::PiseJob

=back

=cut

#'
package Bio::Tools::Run::PiseApplication::protpars;

use vars qw(@ISA);
use strict;
use Bio::Tools::Run::PiseApplication;

@ISA = qw(Bio::Tools::Run::PiseApplication);

=head2 new

 Title   : new()
 Usage   : my $protpars = Bio::Tools::Run::PiseApplication::protpars->new($location, $email, @params);
 Function: Creates a Bio::Tools::Run::PiseApplication::protpars object.
           This method should not be used directly, but rather by 
           a Bio::Tools::Run::AnalysisFactory::Pise instance.
           my $factory = Bio::Tools::Run::AnalysisFactory::Pise->new();
           my $protpars = $factory->program('protpars');
 Example : -
 Returns : An instance of Bio::Tools::Run::PiseApplication::protpars.

=cut

sub new {
    my ($class, $location, $email, @params) = @_;
    my $self = $class->SUPER::new($location, $email);

# -- begin of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/protpars.pm

    $self->{COMMAND}   = "protpars";
    $self->{VERSION}   = "5.a";
    $self->{TITLE}   = "Phylip";

    $self->{DESCRIPTION}   = "protpars - Protein Sequence Parcimony Method";

    $self->{OPT_EMAIL}   = 0;

    $self->{AUTHORS}   = "Felsenstein";

    $self->{DOCLINK}   = "http://bioweb.pasteur.fr/docs/gensoft-evol.html#PHYLIP";

    $self->{REFERENCE}   = [

         "Felsenstein, J.  1993.  PHYLIP (Phylogeny Inference Package) version 3.5c. Distributed by the author.  Department of Genetics, University of Washington, Seattle.",

         "Felsenstein, J.  1989.  PHYLIP -- Phylogeny Inference Package (Version 3.2). Cladistics  5: 164-166.",
 ];

    $self->{_INTERFACE_STANDOUT} = undef;
    $self->{_STANDOUT_FILE} = undef;

    $self->{TOP_PARAMETERS}  = [ 
	"protpars",
	"infile",
	"protpars_opt",
	"jumble_opt",
	"bootstrap",
	"user_tree_opt",
	"output",
	"other_options",
	"outfile",
	"treefile",
	"indented_treefile",
	"params",
	"confirm",
	"terminal_type",
	"tmp_params",
	"multiple_dataset",
	"bootconfirm",
	"bootterminal_type",
	"consense_confirm",
	"consense_terminal_type",
	"consense_outgroup",
	"consense_outfile",
	"consense_treefile",

    ];

    $self->{PARAMETERS_ORDER}  = [
	"protpars",
	"infile", 	# Alignement File
	"protpars_opt", 	# Parcimony options
	"use_threshold", 	# Use Threshold parsimony (T)
	"threshold", 	# Threshold value (if use threshold parsimony)
	"code", 	# Genetic code (U)
	"jumble_opt", 	# Randomize options
	"jumble", 	# Randomize (jumble) input order of sequences (J)
	"jumble_seed", 	# Jumble random number seed (must be odd)
	"times", 	# Number of times to jumble
	"bootstrap", 	# Bootstrap options
	"seqboot", 	# Perform a bootstrap before analysis
	"method", 	# Resampling methods
	"seqboot_seed", 	# Random number seed (must be odd)
	"replicates", 	# How many replicates
	"consense", 	# Compute a consensus tree
	"user_tree_opt", 	# User tree options
	"user_tree", 	# Use User tree (default: no, search for best tree) (U)
	"tree_file", 	# User Tree file
	"output", 	# Output options
	"print_tree", 	# Print out tree (3)
	"print_sequences", 	# Print sequences at all nodes of tree (5)
	"print_treefile", 	# Write out trees onto tree file (6)
	"printdata", 	# Print out the data at start of run (1)
	"print_steps", 	# Print out steps in each site (4)
	"indent_tree", 	# Indent treefile
	"other_options", 	# Other options
	"outgroup", 	# Outgroup species (default, use as outgroup species 1) (O)
	"outfile",
	"treefile",
	"indented_treefile",
	"params",
	"confirm",
	"terminal_type",
	"tmp_params",
	"multiple_dataset",
	"bootconfirm",
	"bootterminal_type",
	"consense_confirm",
	"consense_terminal_type",
	"consense_outgroup",
	"consense_outfile",
	"consense_treefile",

    ];

    $self->{TYPE}  = {
	"protpars" => 'String',
	"infile" => 'Sequence',
	"protpars_opt" => 'Paragraph',
	"use_threshold" => 'Switch',
	"threshold" => 'Integer',
	"code" => 'Excl',
	"jumble_opt" => 'Paragraph',
	"jumble" => 'Switch',
	"jumble_seed" => 'Integer',
	"times" => 'Integer',
	"bootstrap" => 'Paragraph',
	"seqboot" => 'Switch',
	"method" => 'Excl',
	"seqboot_seed" => 'Integer',
	"replicates" => 'Integer',
	"consense" => 'Switch',
	"user_tree_opt" => 'Paragraph',
	"user_tree" => 'Switch',
	"tree_file" => 'InFile',
	"output" => 'Paragraph',
	"print_tree" => 'Switch',
	"print_sequences" => 'Switch',
	"print_treefile" => 'Switch',
	"printdata" => 'Switch',
	"print_steps" => 'Switch',
	"indent_tree" => 'Switch',
	"other_options" => 'Paragraph',
	"outgroup" => 'Integer',
	"outfile" => 'Results',
	"treefile" => 'Results',
	"indented_treefile" => 'Results',
	"params" => 'Results',
	"confirm" => 'String',
	"terminal_type" => 'String',
	"tmp_params" => 'Results',
	"multiple_dataset" => 'String',
	"bootconfirm" => 'String',
	"bootterminal_type" => 'String',
	"consense_confirm" => 'String',
	"consense_terminal_type" => 'String',
	"consense_outgroup" => 'String',
	"consense_outfile" => 'Results',
	"consense_treefile" => 'Results',

    };

    $self->{FORMAT}  = {
	"protpars" => {
		"perl" => ' "protpars < params" ',
	},
	"infile" => {
		"perl" => '"ln -s $infile infile; "',
	},
	"protpars_opt" => {
	},
	"use_threshold" => {
		"perl" => '($value)? "T\\n$threshold\\n" : ""',
	},
	"threshold" => {
		"perl" => '"" ',
	},
	"code" => {
		"perl" => '($value and $value ne $vdef)? "C\\n$code\\n" : "" ',
	},
	"jumble_opt" => {
	},
	"jumble" => {
		"perl" => '($value)? "j\\n$jumble_seed\\n$times\\n" : "" ',
	},
	"jumble_seed" => {
		"perl" => '""',
	},
	"times" => {
		"perl" => '""',
	},
	"bootstrap" => {
	},
	"seqboot" => {
		"perl" => '($value)? "seqboot < seqboot.params; mv outfile infile;" : ""',
	},
	"method" => {
	},
	"seqboot_seed" => {
		"perl" => '"$value\\n"',
	},
	"replicates" => {
		"perl" => '($value && $value != $vdef)? "R\\n$value\\n" : ""',
	},
	"consense" => {
		"perl" => '($value) ? "; cp infile infile.protpars; mv outtree outtree.protpars; mv outfile outfile.protpars; cp outtree.protpars intree; consense < consense.params; cp outtree outtree.consense; cp outfile outfile.consense; mv outtree.protpars outtree; mv infile.protpars infile; mv outfile.protpars outfile" : ""',
	},
	"user_tree_opt" => {
	},
	"user_tree" => {
		"perl" => '($value)? "U\\n" : "" ',
	},
	"tree_file" => {
		"perl" => '($value)? "ln -s $tree_file intree; " : ""',
	},
	"output" => {
	},
	"print_tree" => {
		"perl" => '($value)? "" : "3\\n"',
	},
	"print_sequences" => {
		"perl" => '($value)? "5\\n" : ""',
	},
	"print_treefile" => {
		"perl" => '($value)? "" : "6\\n"',
	},
	"printdata" => {
		"perl" => '($value)? "1\\n" : ""',
	},
	"print_steps" => {
		"perl" => '($value)? "4\\n" : ""',
	},
	"indent_tree" => {
		"perl" => '($value)? " && indenttree -o outtree.indent outtree" : "" ',
	},
	"other_options" => {
	},
	"outgroup" => {
		"perl" => '($value && $value != $vdef)? "o\\n$value\\n" : "" ',
	},
	"outfile" => {
	},
	"treefile" => {
	},
	"indented_treefile" => {
	},
	"params" => {
	},
	"confirm" => {
		"perl" => '"y\\n"',
	},
	"terminal_type" => {
		"perl" => '"0\\n"',
	},
	"tmp_params" => {
	},
	"multiple_dataset" => {
		"perl" => '(defined $times)? "M\\nD\\n$replicates\\n$seqboot_seed\\n$times\\n": "M\\nD\\n$replicates\\n$seqboot_seed\\n1\\n"',
	},
	"bootconfirm" => {
		"perl" => '"y\\n"',
	},
	"bootterminal_type" => {
		"perl" => '"0\\n"',
	},
	"consense_confirm" => {
		"perl" => '"Y\\n"',
	},
	"consense_terminal_type" => {
		"perl" => '"T\\n"',
	},
	"consense_outgroup" => {
		"perl" => '"O\\n$outgroup\\n"',
	},
	"consense_outfile" => {
	},
	"consense_treefile" => {
	},

    };

    $self->{FILENAMES}  = {
	"outfile" => 'outfile',
	"treefile" => 'outtree',
	"indented_treefile" => 'outtree.indent',
	"params" => 'params',
	"tmp_params" => '*.params',
	"consense_outfile" => 'outfile.consense',
	"consense_treefile" => 'outtree.consense',

    };

    $self->{SEQFMT}  = {
	"infile" => [12],

    };

    $self->{GROUP}  = {
	"protpars" => 0,
	"infile" => -10,
	"use_threshold" => 3,
	"threshold" => 2,
	"code" => 3,
	"jumble" => 20,
	"jumble_seed" => 19,
	"times" => 19,
	"seqboot" => -5,
	"method" => 1,
	"seqboot_seed" => 1000,
	"replicates" => 1,
	"consense" => 10,
	"user_tree" => 1,
	"tree_file" => -1,
	"print_tree" => 1,
	"print_sequences" => 1,
	"print_treefile" => 1,
	"printdata" => 1,
	"print_steps" => 1,
	"indent_tree" => 1000,
	"outgroup" => 1,
	"confirm" => 1000,
	"terminal_type" => -1,
	"multiple_dataset" => 1,
	"bootconfirm" => 100,
	"bootterminal_type" => -1,
	"consense_confirm" => 1000,
	"consense_terminal_type" => -2,
	"consense_outgroup" => 1000,

    };

    $self->{BY_GROUP_PARAMETERS}  = [
	"infile",
	"seqboot",
	"consense_terminal_type",
	"bootterminal_type",
	"terminal_type",
	"tree_file",
	"jumble_opt",
	"params",
	"indented_treefile",
	"treefile",
	"bootstrap",
	"protpars",
	"output",
	"outfile",
	"protpars_opt",
	"other_options",
	"user_tree_opt",
	"tmp_params",
	"consense_outfile",
	"consense_treefile",
	"print_tree",
	"print_sequences",
	"print_treefile",
	"printdata",
	"print_steps",
	"outgroup",
	"multiple_dataset",
	"method",
	"replicates",
	"user_tree",
	"threshold",
	"code",
	"use_threshold",
	"consense",
	"jumble_seed",
	"times",
	"jumble",
	"bootconfirm",
	"consense_confirm",
	"indent_tree",
	"consense_outgroup",
	"seqboot_seed",
	"confirm",

    ];

    $self->{SIZE}  = {

    };

    $self->{ISHIDDEN}  = {
	"protpars" => 1,
	"infile" => 0,
	"protpars_opt" => 0,
	"use_threshold" => 0,
	"threshold" => 0,
	"code" => 0,
	"jumble_opt" => 0,
	"jumble" => 0,
	"jumble_seed" => 0,
	"times" => 0,
	"bootstrap" => 0,
	"seqboot" => 0,
	"method" => 0,
	"seqboot_seed" => 0,
	"replicates" => 0,
	"consense" => 0,
	"user_tree_opt" => 0,
	"user_tree" => 0,
	"tree_file" => 0,
	"output" => 0,
	"print_tree" => 0,
	"print_sequences" => 0,
	"print_treefile" => 0,
	"printdata" => 0,
	"print_steps" => 0,
	"indent_tree" => 0,
	"other_options" => 0,
	"outgroup" => 0,
	"outfile" => 0,
	"treefile" => 0,
	"indented_treefile" => 0,
	"params" => 0,
	"confirm" => 1,
	"terminal_type" => 1,
	"tmp_params" => 0,
	"multiple_dataset" => 1,
	"bootconfirm" => 1,
	"bootterminal_type" => 1,
	"consense_confirm" => 1,
	"consense_terminal_type" => 1,
	"consense_outgroup" => 1,
	"consense_outfile" => 0,
	"consense_treefile" => 0,

    };

    $self->{ISCOMMAND}  = {
	"protpars" => 1,
	"infile" => 0,
	"protpars_opt" => 0,
	"use_threshold" => 0,
	"threshold" => 0,
	"code" => 0,
	"jumble_opt" => 0,
	"jumble" => 0,
	"jumble_seed" => 0,
	"times" => 0,
	"bootstrap" => 0,
	"seqboot" => 0,
	"method" => 0,
	"seqboot_seed" => 0,
	"replicates" => 0,
	"consense" => 0,
	"user_tree_opt" => 0,
	"user_tree" => 0,
	"tree_file" => 0,
	"output" => 0,
	"print_tree" => 0,
	"print_sequences" => 0,
	"print_treefile" => 0,
	"printdata" => 0,
	"print_steps" => 0,
	"indent_tree" => 0,
	"other_options" => 0,
	"outgroup" => 0,
	"outfile" => 0,
	"treefile" => 0,
	"indented_treefile" => 0,
	"params" => 0,
	"confirm" => 0,
	"terminal_type" => 0,
	"tmp_params" => 0,
	"multiple_dataset" => 0,
	"bootconfirm" => 0,
	"bootterminal_type" => 0,
	"consense_confirm" => 0,
	"consense_terminal_type" => 0,
	"consense_outgroup" => 0,
	"consense_outfile" => 0,
	"consense_treefile" => 0,

    };

    $self->{ISMANDATORY}  = {
	"protpars" => 0,
	"infile" => 1,
	"protpars_opt" => 0,
	"use_threshold" => 0,
	"threshold" => 1,
	"code" => 0,
	"jumble_opt" => 0,
	"jumble" => 0,
	"jumble_seed" => 1,
	"times" => 0,
	"bootstrap" => 0,
	"seqboot" => 0,
	"method" => 1,
	"seqboot_seed" => 1,
	"replicates" => 0,
	"consense" => 0,
	"user_tree_opt" => 0,
	"user_tree" => 0,
	"tree_file" => 0,
	"output" => 0,
	"print_tree" => 0,
	"print_sequences" => 0,
	"print_treefile" => 0,
	"printdata" => 0,
	"print_steps" => 0,
	"indent_tree" => 0,
	"other_options" => 0,
	"outgroup" => 0,
	"outfile" => 0,
	"treefile" => 0,
	"indented_treefile" => 0,
	"params" => 0,
	"confirm" => 0,
	"terminal_type" => 0,
	"tmp_params" => 0,
	"multiple_dataset" => 0,
	"bootconfirm" => 0,
	"bootterminal_type" => 0,
	"consense_confirm" => 0,
	"consense_terminal_type" => 0,
	"consense_outgroup" => 0,
	"consense_outfile" => 0,
	"consense_treefile" => 0,

    };

    $self->{PROMPT}  = {
	"protpars" => "",
	"infile" => "Alignement File",
	"protpars_opt" => "Parcimony options",
	"use_threshold" => "Use Threshold parsimony (T)",
	"threshold" => "Threshold value (if use threshold parsimony)",
	"code" => "Genetic code (U)",
	"jumble_opt" => "Randomize options",
	"jumble" => "Randomize (jumble) input order of sequences (J)",
	"jumble_seed" => "Jumble random number seed (must be odd)",
	"times" => "Number of times to jumble",
	"bootstrap" => "Bootstrap options",
	"seqboot" => "Perform a bootstrap before analysis",
	"method" => "Resampling methods",
	"seqboot_seed" => "Random number seed (must be odd)",
	"replicates" => "How many replicates",
	"consense" => "Compute a consensus tree",
	"user_tree_opt" => "User tree options",
	"user_tree" => "Use User tree (default: no, search for best tree) (U)",
	"tree_file" => "User Tree file",
	"output" => "Output options",
	"print_tree" => "Print out tree (3)",
	"print_sequences" => "Print sequences at all nodes of tree (5)",
	"print_treefile" => "Write out trees onto tree file (6)",
	"printdata" => "Print out the data at start of run (1)",
	"print_steps" => "Print out steps in each site (4)",
	"indent_tree" => "Indent treefile",
	"other_options" => "Other options",
	"outgroup" => "Outgroup species (default, use as outgroup species 1) (O)",
	"outfile" => "",
	"treefile" => "",
	"indented_treefile" => "",
	"params" => "",
	"confirm" => "",
	"terminal_type" => "",
	"tmp_params" => "",
	"multiple_dataset" => "",
	"bootconfirm" => "",
	"bootterminal_type" => "",
	"consense_confirm" => "",
	"consense_terminal_type" => "",
	"consense_outgroup" => "",
	"consense_outfile" => "",
	"consense_treefile" => "",

    };

    $self->{ISSTANDOUT}  = {
	"protpars" => 0,
	"infile" => 0,
	"protpars_opt" => 0,
	"use_threshold" => 0,
	"threshold" => 0,
	"code" => 0,
	"jumble_opt" => 0,
	"jumble" => 0,
	"jumble_seed" => 0,
	"times" => 0,
	"bootstrap" => 0,
	"seqboot" => 0,
	"method" => 0,
	"seqboot_seed" => 0,
	"replicates" => 0,
	"consense" => 0,
	"user_tree_opt" => 0,
	"user_tree" => 0,
	"tree_file" => 0,
	"output" => 0,
	"print_tree" => 0,
	"print_sequences" => 0,
	"print_treefile" => 0,
	"printdata" => 0,
	"print_steps" => 0,
	"indent_tree" => 0,
	"other_options" => 0,
	"outgroup" => 0,
	"outfile" => 0,
	"treefile" => 0,
	"indented_treefile" => 0,
	"params" => 0,
	"confirm" => 0,
	"terminal_type" => 0,
	"tmp_params" => 0,
	"multiple_dataset" => 0,
	"bootconfirm" => 0,
	"bootterminal_type" => 0,
	"consense_confirm" => 0,
	"consense_terminal_type" => 0,
	"consense_outgroup" => 0,
	"consense_outfile" => 0,
	"consense_treefile" => 0,

    };

    $self->{VLIST}  = {

	"protpars_opt" => ['use_threshold','threshold','code',],
	"code" => ['U','U: Universal','M','M: Mitochondrial','V','V: Vertebrate mitochondrial','F','F: Fly mitochondrial','Y','Y: Yeast mitochondrial',],
	"jumble_opt" => ['jumble','jumble_seed','times',],
	"bootstrap" => ['seqboot','method','seqboot_seed','replicates','consense',],
	"method" => ['bootstrap','Bootstrap','jackknife','Delete-half jackknife','permute','Permute species for each character',],
	"user_tree_opt" => ['user_tree','tree_file',],
	"output" => ['print_tree','print_sequences','print_treefile','printdata','print_steps','indent_tree',],
	"other_options" => ['outgroup',],
    };

    $self->{FLIST}  = {

	"method" => {
		'bootstrap' => '""',
		'permute' => '"J\\nJ\\n"',
		'jackknife' => '"J\\n"',

	},
    };

    $self->{SEPARATOR}  = {

    };

    $self->{VDEF}  = {
	"use_threshold" => '0',
	"code" => 'U',
	"jumble" => '0',
	"times" => '1',
	"seqboot" => '0',
	"method" => 'bootstrap',
	"replicates" => '100',
	"consense" => '0',
	"user_tree" => '0',
	"print_tree" => '1',
	"print_sequences" => '0',
	"print_treefile" => '1',
	"printdata" => '0',
	"print_steps" => '0',
	"indent_tree" => '0',
	"outgroup" => '1',

    };

    $self->{PRECOND}  = {
	"protpars" => { "perl" => '1' },
	"infile" => { "perl" => '1' },
	"protpars_opt" => { "perl" => '1' },
	"use_threshold" => { "perl" => '1' },
	"threshold" => {
		"perl" => '$use_threshold',
	},
	"code" => { "perl" => '1' },
	"jumble_opt" => { "perl" => '1' },
	"jumble" => { "perl" => '1' },
	"jumble_seed" => {
		"perl" => '$jumble',
	},
	"times" => {
		"perl" => '$jumble',
	},
	"bootstrap" => { "perl" => '1' },
	"seqboot" => { "perl" => '1' },
	"method" => {
		"perl" => '$seqboot',
	},
	"seqboot_seed" => {
		"perl" => '$seqboot',
	},
	"replicates" => {
		"perl" => '$seqboot',
	},
	"consense" => {
		"perl" => '$seqboot && $print_treefile',
	},
	"user_tree_opt" => { "perl" => '1' },
	"user_tree" => { "perl" => '1' },
	"tree_file" => {
		"perl" => '$user_tree',
	},
	"output" => { "perl" => '1' },
	"print_tree" => { "perl" => '1' },
	"print_sequences" => { "perl" => '1' },
	"print_treefile" => { "perl" => '1' },
	"printdata" => { "perl" => '1' },
	"print_steps" => { "perl" => '1' },
	"indent_tree" => { "perl" => '1' },
	"other_options" => { "perl" => '1' },
	"outgroup" => { "perl" => '1' },
	"outfile" => { "perl" => '1' },
	"treefile" => {
		"perl" => '$print_treefile',
	},
	"indented_treefile" => {
		"perl" => '$print_treefile && $indent_tree',
	},
	"params" => { "perl" => '1' },
	"confirm" => { "perl" => '1' },
	"terminal_type" => { "perl" => '1' },
	"tmp_params" => { "perl" => '1' },
	"multiple_dataset" => {
		"perl" => '$seqboot',
	},
	"bootconfirm" => {
		"perl" => '$seqboot',
	},
	"bootterminal_type" => {
		"perl" => '$seqboot',
	},
	"consense_confirm" => {
		"perl" => '$consense',
	},
	"consense_terminal_type" => {
		"perl" => '$consense',
	},
	"consense_outgroup" => {
		"perl" => '$consense and $outgroup and $outgroup != 1',
	},
	"consense_outfile" => {
		"perl" => '$consense',
	},
	"consense_treefile" => {
		"perl" => '$consense',
	},

    };

    $self->{CTRL}  = {
	"threshold" => {
		"perl" => {
			'$value < 1' => "Value must be greater than 1",
		},
	},
	"jumble_seed" => {
		"perl" => {
			'$value <= 0 || (($value % 2) == 0)' => "Jumble seed must be odd",
		},
	},
	"seqboot_seed" => {
		"perl" => {
			'$value <= 0 || (($value % 2) == 0)' => "Random seed must be odd",
		},
	},
	"replicates" => {
		"perl" => {
			'$replicates > 1000' => "this server allows no more than 1000 replicates",
		},
	},
	"user_tree" => {
		"perl" => {
			'$user_tree && $jumble' => "you cannot randomize (jumble) your dataset and give a user tree at the same time",
			'$user_tree && $seqboot' => "you cannot bootstrap your dataset and give a user tree at the same time",
		},
	},
	"outgroup" => {
		"perl" => {
			'$value < 1' => "Please enter a value greater than 0",
		},
	},

    };

    $self->{PIPEOUT}  = {
	"treefile" => {
		 '1' => "phylip_tree",
	},

    };

    $self->{WITHPIPEOUT}  = {

    };

    $self->{PIPEIN}  = {
	"infile" => {
		 "readseq_ok_alig" => '1',
	},

    };

    $self->{WITHPIPEIN}  = {

    };

    $self->{ISCLEAN}  = {
	"protpars" => 0,
	"infile" => 0,
	"protpars_opt" => 0,
	"use_threshold" => 0,
	"threshold" => 0,
	"code" => 0,
	"jumble_opt" => 0,
	"jumble" => 0,
	"jumble_seed" => 0,
	"times" => 0,
	"bootstrap" => 0,
	"seqboot" => 0,
	"method" => 0,
	"seqboot_seed" => 0,
	"replicates" => 0,
	"consense" => 0,
	"user_tree_opt" => 0,
	"user_tree" => 0,
	"tree_file" => 0,
	"output" => 0,
	"print_tree" => 0,
	"print_sequences" => 0,
	"print_treefile" => 0,
	"printdata" => 0,
	"print_steps" => 0,
	"indent_tree" => 0,
	"other_options" => 0,
	"outgroup" => 0,
	"outfile" => 0,
	"treefile" => 0,
	"indented_treefile" => 0,
	"params" => 0,
	"confirm" => 0,
	"terminal_type" => 0,
	"tmp_params" => 0,
	"multiple_dataset" => 0,
	"bootconfirm" => 0,
	"bootterminal_type" => 0,
	"consense_confirm" => 0,
	"consense_terminal_type" => 0,
	"consense_outgroup" => 0,
	"consense_outfile" => 0,
	"consense_treefile" => 0,

    };

    $self->{ISSIMPLE}  = {
	"protpars" => 0,
	"infile" => 1,
	"protpars_opt" => 0,
	"use_threshold" => 0,
	"threshold" => 0,
	"code" => 0,
	"jumble_opt" => 0,
	"jumble" => 0,
	"jumble_seed" => 0,
	"times" => 0,
	"bootstrap" => 0,
	"seqboot" => 0,
	"method" => 0,
	"seqboot_seed" => 0,
	"replicates" => 0,
	"consense" => 0,
	"user_tree_opt" => 0,
	"user_tree" => 0,
	"tree_file" => 0,
	"output" => 0,
	"print_tree" => 0,
	"print_sequences" => 0,
	"print_treefile" => 0,
	"printdata" => 0,
	"print_steps" => 0,
	"indent_tree" => 0,
	"other_options" => 0,
	"outgroup" => 0,
	"outfile" => 0,
	"treefile" => 0,
	"indented_treefile" => 0,
	"params" => 0,
	"confirm" => 0,
	"terminal_type" => 0,
	"tmp_params" => 0,
	"multiple_dataset" => 0,
	"bootconfirm" => 0,
	"bootterminal_type" => 0,
	"consense_confirm" => 0,
	"consense_terminal_type" => 0,
	"consense_outgroup" => 0,
	"consense_outfile" => 0,
	"consense_treefile" => 0,

    };

    $self->{PARAMFILE}  = {
	"use_threshold" => "params",
	"threshold" => "params",
	"code" => "params",
	"jumble" => "params",
	"method" => "seqboot.params",
	"seqboot_seed" => "seqboot.params",
	"replicates" => "seqboot.params",
	"user_tree" => "params",
	"print_tree" => "params",
	"print_sequences" => "params",
	"print_treefile" => "params",
	"printdata" => "params",
	"print_steps" => "params",
	"outgroup" => "params",
	"confirm" => "params",
	"terminal_type" => "params",
	"multiple_dataset" => "params",
	"bootconfirm" => "seqboot.params",
	"bootterminal_type" => "seqboot.params",
	"consense_confirm" => "consense.params",
	"consense_terminal_type" => "consense.params",
	"consense_outgroup" => "consense.params",

    };

    $self->{COMMENT}  = {
	"method" => [
		"1. The bootstrap. Bootstrapping was invented by Bradley Efron in 1979, and its use in phylogeny estimation was introduced by me (Felsenstein, 1985b). It involves creating a new data set by sampling N characters randomly with replacement, so that the resulting data set has the same size as the original, but some characters have been left out and others are duplicated. The random variation of the results from analyzing these bootstrapped data sets can be shown statistically to be typical of the variation that you would get from collecting new data sets. The method assumes that the characters evolve independently, an assumption that may not be realistic for many kinds of data.",
		"2. Delete-half-jackknifing. This alternative to the bootstrap involves sampling a random half of the characters, and including them in the data but dropping the others. The resulting data sets are half the size of the original, and no characters are duplicated. The random variation from doing this should be very similar to that obtained from the bootstrap. The method is advocated by Wu (1986).",
		"3. Permuting species within characters. This method of resampling (well, OK, it may not be best to call it resampling) was introduced by Archie (1989) and Faith (1990; see also Faith and Cranston, 1991). It involves permuting the columns of the data matrix separately. This produces data matrices that have the same number and kinds of characters but no taxonomic structure. It is used for different purposes than the bootstrap, as it tests not the variation around an estimated tree but the hypothesis that there is no taxonomic structure in the data: if a statistic such as number of steps is significantly smaller in the actual data than it is in replicates that are permuted, then we can argue that there is some taxonomic structure in the data (though perhaps it might be just a pair of sibling species).",
	],
	"user_tree" => [
		"To give your tree to the program, you must normally put it in the alignement file, after the sequences, preceded by a line indicating how many trees you give.",
		"Here, this will be automatically appended: just give a treefile and the number of trees in it.",
	],
	"tree_file" => [
		"Give a tree whenever the infile does not already contain the tree.",
	],
	"print_tree" => [
		"Tells the program to print a semi-graphical picture of the tree in the outfile.",
	],
	"print_treefile" => [
		"Tells the program to save the tree in a tree file (outtree) (a standard representation of trees where the tree is specified by a nested pairs of parentheses, enclosing names and separated by commas).",
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

# -- end of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/protpars.pm



    $self->_init_params(@params);

    return $self;
}



1; # Needed to keep compiler happy

