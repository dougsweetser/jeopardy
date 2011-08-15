#!/usr/bin/perl

# leifform.cgi
# 
# Written by Leif M. Wright
# leif@conservatives.net
#
#************************************************************************
# I got really ticked when the form response programs I wanted to use
# all wanted to send me an e-mail. I don't want an email.
# So I wrote this VERY simply program to post the data to a logfile and
# redirect the user to a "form successful" page. That's all it does. Period.
# If you want a fancy form handler, go somewheres else, but I just
# wanted a simple script to post form data to a logfile
# Your form should have action=post
# For every input name on your form, you'll have to add it to the
# script below, and decide whether to make it required or not.
# Enjoy
# I'm not guilty or responsible if this screws up your system. It works 
# fine on mine.
##################################################################
#

# this tells the program where to place a link for the user
# once they are done.
$link ="http://den.theunbound.org/jeopardy.html";

# this is where the info will be written to - you need to specify a real directory
#must be read/writable
$file ="../jeopardy_log.txt";

#
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
# &no_cigar unless $contents{'name'};
# &no_cigar unless $contents{'street'};
# &no_cigar unless $contents{'city'};
# &no_cigar unless $contents{'state'};
# &no_cigar unless $contents{'zip'};
# &no_cigar unless $contents{'country'};


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
<a href=\"$contents{'url'}\">Return to the $contents{'formname'} page</a>
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
<H2>$contents{'name'}I have received your form!</H2>
Your information will be processed immediately, 
<b>$contents{'name'}</b>. Thank you.

<p>
<HR noshade>
<A HREF=\"$link\">Back to the home page</A>.
<a href="../jeopardy_log.txt">View this form's results</a>.
</BODY>
</HTML>
HTML
#print "Content-type: text/plain\n\n ";
open(OUTPUT, ">>$file");
print OUTPUT "_______________________________\n";
print OUTPUT "Date: $date\n";
# print OUTPUT "FORM NAME: $contents{'formname'}\n";
print OUTPUT "Manni's Score: $contents{'tedscore'}\n";
print OUTPUT "Erin's Score: $contents{'erinscore'}\n";
print OUTPUT "Dougs's Score: $contents{'dougscore'}\n";
print OUTPUT "Steves's Score: $contents{'stevescore'}\n";
print OUTPUT "Brian's Score: $contents{'brianscore'}\n";
print OUTPUT "Mike's Score: $contents{'mikescore'}\n";


close (OUTPUT);
exit;
