#!/bin/sh

git filter-branch --env-filter '

n=$GIT_AUTHOR_NAME
m=$GIT_AUTHOR_EMAIL

case ${GIT_AUTHOR_NAME} in
"ajs") n=" Aaron Sherman" ; m="ajs@ajs.com" ;;
"ambs") n=" Alberto Manuel Brandao Simoes" ; m="ambs@cpan.org" ;;
"ajgough") n=" Alex Gough" ; m="alex@earth.li" ;;
"heimdall") n=" Alexandre Buisse" ; m="Nattfodd@gmail.com" ;;
"allison") n=" Allison Randal" ; m="allison@parrot.org" ;;
"amirkarger") n=" Amir Karger" ; m="akarger@cgr.harvard.edu" ;;
"azuroth") n=" Amos Robinson" ; m="amos@coscom.net" ;;
"Whiteknight") n=" Andrew Whitworth" ; m="wknight8111@gmail.com" ;;
"doughera") n=" Andy Dougherty" ; m="doughera@lafayette.edu" ;;
"petdance") n=" Andy Lester" ; m="andy@petdance.com" ;;
"ask") n=" Ask Bjørn Hansen" ; m="ask@develooper.com" ;;
"au") n=" Audrey Tang" ; m="audreyt@audreyt.org" ;;
"Austin") n=" Austin Hastings" ; m="austin_hastings@yahoo.com" ;;
"bernhard") n=" Bernhard Schmalhofer" ; m="Bernhard.Schmalhofer@gmx.de" ;;
"bubaflub") n=" Bob Kuo" ; m="bobjkuo@gmail.com" ;;
"rgrjr") n=" Bob Rogers" ; m="rogers-perl6@rgrjr.dyndns.org" ;;
"brentdax") n=" Brent Royal-Gordon" ; m="brent@brentdax.com" ;;
"bdwheele") n=" Brian Wheeler" ; m="bdwheele@indiana.edu" ;;
"brianwisti") n=" Brian Wisti" ; m="brian.wisti@gmail.com" ;;
"util") n=" Bruce Gray" ; m="bruce.gray@acm.org" ;;
"masak") n=" Carl Masak" ; m="cmasak@gmail.com" ;;
"creiss") n=" Charles Reiss" ; m="creiss@cc.gatech.edu" ;;
"chip") n=" Chip Salzenberg" ; m="chip@pobox.com" ;;
"cdolan") n=" Chris Dolan" ; m="cdolan@cpan.org" ;;
"cotto") n=" Christoph Otto a.k.a. cotto" ; m="christoph@mksig.org" ;;
"chromatic") n=" chromatic" ; m="chromatic@wgz.org" ;;
"clintp") n=" Clinton A. Pierce" ; m="clintp@geeksalad.org" ;;
"colink") n=" Colin Kuskie" ; m="ckuskie@sterling.net" ;;
"cspencer") n=" Cory Spencer" ; m="cspencer@sprocket.org" ;;
"Ovid") n=" Curtis 'Ovid' Poe" ; m="ovid@cpan.org" ;;
"cgrawls") n=" Curtis Rawls" ; m="cgrawls@gmail.com" ;;
"cxreg") n=" Dave Olszewski" ; m="cxreg@pobox.com" ;;
"dmknopp") n=" Damian Miles Knopp" ; m="dmknopp@loyola.edu" ;;
"dan") n=" Dan Sugalski" ; m="dan@sidhe.org" ;;
"grunblatt") n=" Daniel Grunblatt" ; m="daniel@grunblatt.com.ar" ;;
"darbelo") n=" Daniel Arbelo Arrocha" ; m="arbelo@gmail.com" ;;
"dmlloyd") n=" David M. Lloyd" ; m="dmlloyd@tds.net" ;;
"theory") n=" David E. Wheeler" ; m="david@justatheory.com" ;;
"rafl") n=" Florian Ragwitz" ; m="rafl@debianforum.de" ;;
"fperrad") n=" François Perrad" ; m="francois.perrad@gadz.org" ;;
"japhb") n=" Geoff Broadwell (japhb)" ; m="geoff@broadwell.org" ;;
"GeJ") n=" Géraud Continsouzas" ; m="geraud@gcu.info" ;;
"gregor") n=" Gregor N. Purdy" ; m="gregor@focusresearch.com" ;;
"he") n=" Havard Eidnes" ; m="he@NetBSD.org" ;;
"jkeenan") n=" James E Keenan (Jim) (aka kid51)" ; m="jkeenan@cpan.org" ;;
"jhi") n=" Jarkko Hietaniemi" ; m="jhi@iki.fi" ;;
"jgoff") n=" Jeff Goff" ; m="jgoff@speakeasy.net" ;;
"jhorwitz") n=" Jeff Horwitz" ; m="jeff@smashing.org" ;;
"jrieks") n=" Jens Rieks" ; m="parrot@jensbeimsurfen.de" ;;
"jquelin") n=" Jerome Quelin" ; m="jquelin@cpan.org" ;;
"particle") n=" Jerry Gay a.k.a. particle" ; m="Jerry.Gay@gmail.com" ;;
"jrtayloriv") n=" Jesse Taylor" ; m="jrtayloriv@gmail.com" ;;
"jesse") n=" Jesse Vincent" ; m="jesse@fsck.com" ;;
"jimmy") n=" Jimmy Zhuo" ; m="zhuomingliang@yahoo.com.cn" ;;
"ash_") n=" John Harrison" ; m="ash@greatethaninfinity.com " ;;
"dukeleto") n=" Jonathan "Duke" Leto" ; m="jonathan@leto.net" ;;
"duff") n=" Jonathan Scott Duff" ; m="duff@pobox.com" ;;
"jonathan") n=" Jonathan Worthington" ; m="jnthn@jnthn.net" ;;
"josh") n=" Josh Wilmes" ; m="josh-perl6@hitchhiker.org" ;;
"jhoblitt") n=" Joshua Hoblitt" ; m="jhoblitt@cpan.org" ;;
"jisom") n=" Joshua Isom" ; m="loneowl@ritalin.shout.net" ;;
"NotFound") n=" Julian Albo" ; m="julian.notfound@gmail.com" ;;
"boemmels") n=" Jürgen Bömmels" ; m="boemmels@web.de" ;;
"tewk") n=" Kevin Tew" ; m="tewk@tewk.com" ;;
"kj, kjs") n=" Klaas-Jan Stol" ; m="parrotcode@gmail.com" ;;
"larry") n=" Larry Wall" ; m="larry@wall.org" ;;
"leed") n=" Lee Duhem" ; m="lee.duhem@gmail.com" ;;
"acme") n=" Leon Brocard" ; m="acme@astray.com" ;;
"leo") n=" Leopold Toetsch" ; m="lt@toetsch.at" ;;
"luben") n=" Luben Karavelov" ; m="karavelov@spnet.net" ;;
"luqui") n=" Luke Palmer" ; m="luke@luqui.org" ;;
"infinoid") n=" Mark Glines a.k.a. Infinoid" ; m="mark@glines.org" ;;
"mdiep") n=" Matt Diephouse" ; m="matt@diephouse.com" ;;
"mrjoltcola") n=" Melvin Smith" ; m="melvin.smith@mindspring.com" ;;
"mikehh") n=" Michael H. Hind" ; m="mike.hind@gmail.com" ;;
"mikescott") n=" Michael Scott" ; m="michael_scott@mac.com" ;;
"mongo") n=" Mike Lambert" ; m="perl-dev@jall.org" ;;
"moritz") n=" Moritz A Lenz" ; m="moritz@faui2k3.org" ;;
"Chandon") n=" Nat Tuck" ; m="nat@ferrus.net" ;;
"nicholas") n=" Nicholas Clark" ; m="nick@ccl4.org" ;;
"nickg") n=" Nick Glencross" ; m="nick.glencross@gmail.com" ;;
"nwellnhof") n=" Nick Wellnhofer" ; m="wellnhofer@aevum.de" ;;
"smash") n=" Nuno 'smash' Carvalho" ; m="mestre.smash@gmail.com" ;;
"pmichaud") n=" Patrick R. Michaud" ; m="pmichaud@pobox.com" ;;
"Paul_the_Greek") n=" Paul C. Anagnostopoulos" ; m="paul@windfall.com" ;;
"paultcochrane") n=" Paul Cochrane" ; m="paultcochrane@gmail.com" ;;
"petergibbs") n=" Peter Gibbs" ; m="peter@emkel.co.za" ;;
"plobsing") n=" Peter Lobsinger" ; m="plobsing@gmail.com" ;;
"pdcawley") n=" Piers Cawley" ; m="pdcawley@bofh.org.uk" ;;
"rurban") n=" Reini Urban" ; m="rurban@cpan.org" ;;
"finanalyst") n=" Richard Hainsworth" ; m="richard@rusrating.ru" ;;
"robert") n=" Robert Spier" ; m="robert@perl.org" ;;
"eiffel") n=" Roger Browne" ; m="roger@eiffel.demon.co.uk" ;;
"rg") n=" Rolf Grossmann" ; m="rg@progtech.net" ;;
"rblasch") n=" Ron Blaschke" ; m="ron@rblasch.org" ;;
"rubys") n=" Sam Ruby" ; m="rubys@intertwingly.net" ;;
"samlh") n=" Samuel Harrington" ; m="samuel.harrington@mines.sdsmt.edu" ;;
"educated_foo") n=" Sean O'Rourke" ; m="educated_foo@yahoo.com" ;;
"sartak") n=" Shawn M Moore" ; m="sartak@gmail.com" ;;
"simon") n=" Simon Cozens" ; m="simon@simon-cozens.org" ;;
"scog") n=" Simon Glover" ; m="scog@aip.de" ;;
"sorear") n=" Stefan O'Rear" ; m="stefanor@cox.net" ;;
"stephane") n=" Stéphane Peiry" ; m="stephane@modxml.org" ;;
"tene") n=" Stephen Weeks" ; m="tene@allalone.org" ;;
"sfink") n=" Steve Fink" ; m="steve@fink.com" ;;
"thgibbs") n=" Tanton Gibbs" ; m="thgibbs@deltafarms.com" ;;
"treed") n=" Ted Reed" ; m="ted.reed@gmail.com" ;;
"timbo") n=" Tim Bunce" ; m="Tim.Bunce@pobox.com" ;;
"tom") n=" Tom Hughes" ; m="tom@compton.nu" ;;
"tcurtis") n=" Tyler Curtis" ; m="tyler.l.curtis@gmail.com" ;;
"ujwalic") n=" Ujwal Reddy Malipeddi" ; m="ujwalic@gmail.com" ;;
"bacek") n=" Vasily Chekalkin" ; m="bacek@bacek.com" ;;
"vsoni") n=" Vishal Soni" ; m="vishalrsoni@gmail.com" ;;
"coke") n=" Will "Coke" Coleda" ; m="will@coleda.com" ;;
"cvsdummy") n=" cvsdummy" ; m="cvs@perl.org" ;;
"svn") n=" svn" ; m="svn@perl.org" ;;
esac

export GIT_AUTHOR_NAME="$n"
export GIT_AUTHOR_EMAIL="$m"
export GIT_COMMITTER_NAME="$n"
export GIT_COMMITTER_EMAIL="$m"
'
