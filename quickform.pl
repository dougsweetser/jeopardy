#! /usr/local/bin/perl

# leifform.cgi
#
# Written by Leif M. Wright
# leif@conservatives.net
#
# this tells the program where to place a link for the user
# once they are done.
$link ="../index.html";
$nexlink="../thecatz/intforms.html";
# this is where the info will be written to - you need to specify a real directory
# $file ="/usr/home/leif/public_html/conservatives/atheist/scripts/results.txt"; #must be read/writable
$file ="../formres/results.txt";


##################################################################

if ($ENV{'REQUEST_METHOD'} eq 'POST')
{
	read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	@pairs = split(/&/, $buffer);
	foreach $pair (@pairs)
	{
		($name, $value) = split(/=/, $pair);
		$value =~ tr/+/ /;
		$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
		$contents{$name} = $value;

	}
}

chop($date = `date`);

# Now with the program
###########################################################
# Has to output a Content-type
print "Content-type: text/html\n\n ";

# Check to see if all required information was entered
# If you want a field to be required, add it here.
#&no_cigar unless $contents{'name'};
#&no_cigar unless $contents{'street'};
#&no_cigar unless $contents{'city'};
#&no_cigar unless $contents{'state'};
#&no_cigar unless $contents{'zip'};
#&no_cigar unless $contents{'country'};


sub no_cigar
{
print <<"HTML";
<HTML><HEAD><TITLE>Form Incomplete</TITLE></HEAD>
<BODY>
<H1>Form Incomplete</H1>
I'm sorry, the form was not filled completely.<br>
Please Return to the form and fill it out completely.<p>
Thank you.
<HR>
<a href=\"$contents{'url'}\">Return to the $contents{'main'} page</a>
</BODY></HTML>
HTML
exit;
}



# They go here if the form was submitted
# successfully. Now this page will send them
# off to where ever specify in the "link" field above.

print <<"HTML";
<HTML><HEAD><TITLE>Entry successful</TITLE></HEAD>
<BODY>
<H1>Entry successful!</H1>
<p>
<hr noshade>
<p>
<H2>$contents{'name'} I have received your form!</H2>
Your information will be processed immediately,
<b>$contents{'name'}</b>. Thank you.

<p>
<HR noshade>
<A HREF=\"$nexlink\">Back</A>.<br>
<A HREF=\"$link\">Home Page</A>.
<!-- <a href="C:/Savant/formres/results.txt">View this form's results</a>. -->
<font color="white"><br><br>
</BODY>
</HTML>
HTML
print "Content-type: text/plain\n\n ";
open(OUTPUT, ">>$file");
print OUTPUT "_______________________________\n";
# print OUTPUT "Date: $date\n";
# print OUTPUT "FORM NAME: $contents{'main'}\n";

print OUTPUT "DATE: $contents{'myField'}\n";
print OUTPUT "BORROWER SCORE FORM\n";
print OUTPUT "LAST NAME: $contents{'lname'}\n";
print OUTPUT "MIDDLE INITIAL: $contents{'m_name'}\n";
print OUTPUT "FIRST NAME: $contents{'fname'}\n";
print OUTPUT "STREET: $contents{'street'}\n";
print OUTPUT "CITY: $contents{'city'}\n";
print OUTPUT "STATE: $contents{'state'}\n";
print OUTPUT "ZIP: $contents{'zip'}\n";
print OUTPUT " FICO SCORES\n";
print OUTPUT "one: $contents{'fico1'}\n";
print OUTPUT "two: $contents{'fico2'}\n";
print OUTPUT "three: $contents{'fico3'}\n";
print OUTPUT "four: $contents{'fico4'}\n";
print OUTPUT "five: $contents{'fico5'}\n";
print OUTPUT "six: $contents{'fico6'}\n";
print OUTPUT "LTV: $contents{'ltv'}\n";
print OUTPUT "CLTV: $contents{'cltv'}\n";
print OUTPUT "COMBINED DTI: $contents{'combdti'}\n";
print OUTPUT "PITI DTI: $contents{'pitidti'}\n";
print OUTPUT "SELF EMPLOYED?: $contents{'se'}\n";
print OUTPUT "LOAN TYPE: $contents{'ts_niv_fd'}\n";
print OUTPUT "No. OF RES UNITS: $contents{'resunits'}\n";
print OUTPUT "No. OF COMM UNITS: $contents{'comunits'}";
print OUTPUT " OCCUPIED?: $contents{'occ'}\n";
print OUTPUT "COMM INFLUENCE/ZONING: $contents{'commzone'}\n";
print OUTPUT "DT CLSD/NEMCO: $contents{'month'}";
print OUTPUT "-$contents{'day'}";
print OUTPUT "/$contents{'year'}\n";
print OUTPUT "LENDER: $contents{'lender'}\n";
print OUTPUT "LOAN AMOUNT: $contents{'loanamt'}\n";
print OUTPUT "FEES: $contents{'fees'}\n";
print OUTPUT "INTEREST RATE: $contents{'intrate'}";
print OUTPUT " $contents{'fixedvar'}\n";
print OUTPUT "EVALUATION OF LENDER: $contents{'lend_eval'}\n";
print OUTPUT "COPY OF CHECK AND DEPOSIT SLIP: $contents{'cocadepslp'}\n";
print OUTPUT "HUD-1: $contents{'Hud_1'}\n";
print OUTPUT "GOODFAITH: $contents{'GoodFaith'}\n";
print OUTPUT "MTG BROKER DISC. /ATT. GEN: $contents{'mbrokdisc'}\n";
print OUTPUT "MORTGAGE LOAN ORIGINATION AGREEMENT: $contents{'mortlnorag'}\n";
print OUTPUT "MTG BROKER FEE AGREEMENT / 2 PGS: $contents{'mortbrkfeeag'}\n";
print OUTPUT "BOROWER CERT & AUTH: $contents{'borcertath'}\n";
print OUTPUT "BORROWER KNOW YOUR RIGHTS: $contents{'borknorghts'}\n";
print OUTPUT "LOAN ORIGINATION AGREEMENT: $contents{'loanoragr'}\n";
print OUTPUT "TIL / NOTE: $contents{'tilnote'}\n";
print OUTPUT "MISC: $contents{'misc'}\n";
print OUTPUT "DEBT: $contents{'debt'}\n";
print OUTPUT "INCOME: $contents{'income'}\n";
print OUTPUT "\n";
print OUTPUT "P & I: $contents{'pandi'}\n";
print OUTPUT "TAXES: $contents{'tax'}\n";
print OUTPUT "P & I + TAXES= $contents{'r1'}\n";
print OUTPUT "2nd P & I: $contents{'secpandi'}\n";
print OUTPUT "CLTV: $contents{'seccltv'}\n";
print OUTPUT "APPRAISER: $contents{'apprais'}\n";
print OUTPUT "ATTORNEY: $contents{'attorn'}\n";
print OUTPUT "PROP VALUE: $contents{'propval'}\n";
print OUTPUT "Y.S.P. %: $contents{'ysp'}\n";
print OUTPUT "\n";
print OUTPUT "FEES: $contents{'jfee1'}";
print OUTPUT " , $contents{'jfee2'}\n";
print OUTPUT "CREDIT: $contents{'jfee3'}\n";
print OUTPUT "PROCESS: $contents{'jfee4'}\n";
print OUTPUT "ADMIN: $contents{'jfee5'}\n";
print OUTPUT "YSP: $contents{'jfee6'}";
print OUTPUT " , $contents{'jfee7'}";
print OUTPUT " , $contents{'jfee8'}\n";
print OUTPUT "TOTAL: $contents{'tot2'}\n";

close (OUTPUT);
exit;
