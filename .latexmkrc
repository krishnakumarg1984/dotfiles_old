$compiling_cmd = "xdotool search --name \"%D\" " .
                 "set_window --name \"%D compiling...\"";
$success_cmd   = "xdotool search --name \"%D\" " .
                 "set_window --name \"%D OK\"";
$failure_cmd   = "xdotool search --name \"%D\" " .
                 "set_window --name \"%D FAILURE\"";

$bibtex_use = 2;

push @generated_exts, "bcf";
push @generated_exts, "blg";
push @generated_exts, "brf";
push @generated_exts, "cb";
push @generated_exts, "cb2";
push @generated_exts, "dvi";
push @generated_exts, "fdb_latexmk";
push @generated_exts, "fls";
push @generated_exts, "glo";
push @generated_exts, "idx";
push @generated_exts, "ind";
push @generated_exts, "ist";
push @generated_exts, "lof";
push @generated_exts, "log";
push @generated_exts, "lot";
push @generated_exts, "nav";
push @generated_exts, "nlg";
push @generated_exts, "nlo";
push @generated_exts, "nls";
push @generated_exts, "nmo";
push @generated_exts, "out";
push @generated_exts, "run.xml";
push @generated_exts, "snm";
push @generated_exts, "spl";
push @generated_exts, "synctex.gz";
push @generated_exts, "tdo";
push @generated_exts, "toc";