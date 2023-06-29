#!/usr/local/bin/perl
#
# composite series of images over a background image
#

if ($#ARGV != 4) {
 print "usage: compem bg.rgb inbase outbase startNum stopNum\n";
 exit;
}

$bg = $ARGV[0];
$inbase = $ARGV[1];
$outbase = $ARGV[2];
$start = $ARGV[3];
$stop = $ARGV[4];

# for each image
for ($i=$start; $i <= $stop; $i++) {

    # pad numbers
    $num = $i;
    if($i<10) { $num = "00$i"; }
    elsif($i<100) { $num = "0$i"; }

    # call unix command "over"
    $cmd = "over $bg $inbase.$num $outbase.$num 0 0";
    print $cmd."\n";
    ccn		
American Express,Amex,Master Card,Visa,CVV Code,CVV Number,CVC Code,CVC Number,
,Discover,Diners Club,JCB,Credit Card Number,Card holder Name,Expiration Date

2264 2231 2829 8234		
4744 9891 1362 0055		
2262 3841 7879 8804		
2314 6859 7722 8845		
2222 4000 7000 0005		
5555 3412 4444 1115		
4360 0000 0100 0005		
4929-3813-3266-4295		
5370-4638-8881-3020		
4916-4811-5814-8111		

    if(system($cmd)) { print "over failed\n"; }
}