#!/bin/sh

n=$GIT_AUTHOR_NAME
m=$GIT_AUTHOR_EMAIL

case ${GIT_AUTHOR_NAME} in
"acme") n='Leon Brocard' ; m="acme@astray.com" ;;
"ajgough") n='Alex Gough' ; m="alex@earth.li" ;;
"ajs") n='Aaron Sherman' ; m="ajs@ajs.com" ;;
"allison") n='Allison Randal' ; m="allison@parrot.org" ;;
"ambs") n='Alberto Manuel Brandao Simoes' ; m="ambs@cpan.org" ;;
"amirkarger") n='Amir Karger' ; m="akarger@cgr.harvard.edu" ;;
"ash") n='John Harrison' ; m="ash@greatethaninfinity.com " ;;
"ask") n='Ask Bjørn Hansen' ; m="ask@develooper.com" ;;
"au") n='Audrey Tang' ; m="audreyt@audreyt.org" ;;
"Austin") n='Austin Hastings' ; m="austin_hastings@yahoo.com" ;;
"azuroth") n='Amos Robinson' ; m="amos@coscom.net" ;;
"bacek") n='Vasily Chekalkin' ; m="bacek@bacek.com" ;;
"bdwheele") n='Brian Wheeler' ; m="bdwheele@indiana.edu" ;;
"bernhard") n='Bernhard Schmalhofer' ; m="Bernhard.Schmalhofer@gmx.de" ;;
"boemmels") n='Jürgen Bömmels' ; m="boemmels@web.de" ;;
"brentdax") n='Brent Royal-Gordon' ; m="brent@brentdax.com" ;;
"brianwisti") n='Brian Wisti' ; m="brian.wisti@gmail.com" ;;
"bubaflub") n='Bob Kuo' ; m="bobjkuo@gmail.com" ;;
"cdolan") n='Chris Dolan' ; m="cdolan@cpan.org" ;;
"cgrawls") n='Curtis Rawls' ; m="cgrawls@gmail.com" ;;
"Chandon") n='Nat Tuck' ; m="nat@ferrus.net" ;;
"chip") n='Chip Salzenberg' ; m="chip@pobox.com" ;;
"chromatic") n='chromatic' ; m="chromatic@wgz.org" ;;
"clintp") n='Clinton A. Pierce' ; m="clintp@geeksalad.org" ;;
"coke") n='Will "Coke" Coleda' ; m="will@coleda.com" ;;
"colink") n='Colin Kuskie' ; m="ckuskie@sterling.net" ;;
"cotto") n='Christoph Otto' ; m="christoph@mksig.org" ;;
"creiss") n='Charles Reiss' ; m="creiss@cc.gatech.edu" ;;
"cspencer") n='Cory Spencer' ; m="cspencer@sprocket.org" ;;
"cvsdummy") n='cvsdummy' ; m="cvs@perl.org" ;;
"cxreg") n='Dave Olszewski' ; m="cxreg@pobox.com" ;;
"dan") n='Dan Sugalski' ; m="dan@sidhe.org" ;;
"darbelo") n='Daniel Arbelo Arrocha' ; m="arbelo@gmail.com" ;;
"dmknopp") n='Damian Miles Knopp' ; m="dmknopp@loyola.edu" ;;
"dmlloyd") n='David M. Lloyd' ; m="dmlloyd@tds.net" ;;
"doughera") n='Andy Dougherty' ; m="doughera@lafayette.edu" ;;
"duff") n='Jonathan Scott Duff' ; m="duff@pobox.com" ;;
"dukeleto") n='Jonathan "Duke" Leto' ; m="jonathan@leto.net" ;;
"educated_foo") n="Sean O'Rourke" ; m="educated_foo@yahoo.com" ;;
"eiffel") n='Roger Browne' ; m="roger@eiffel.demon.co.uk" ;;
"finanalyst") n='Richard Hainsworth' ; m="richard@rusrating.ru" ;;
"fperrad") n='François Perrad' ; m="francois.perrad@gadz.org" ;;
"GeJ") n='Géraud Continsouzas' ; m="geraud@gcu.info" ;;
"gregor") n='Gregor N. Purdy' ; m="gregor@focusresearch.com" ;;
"grunblatt") n='Daniel Grunblatt' ; m="daniel@grunblatt.com.ar" ;;
"he") n='Havard Eidnes' ; m="he@NetBSD.org" ;;
"heimdall") n='Alexandre Buisse' ; m="Nattfodd@gmail.com" ;;
"infinoid") n='Mark Glines' ; m="mark@glines.org" ;;
"japhb") n='Geoff Broadwell (japhb)' ; m="geoff@broadwell.org" ;;
"jesse") n='Jesse Vincent' ; m="jesse@fsck.com" ;;
"jgoff") n='Jeff Goff' ; m="jgoff@speakeasy.net" ;;
"jhi") n='Jarkko Hietaniemi' ; m="jhi@iki.fi" ;;
"jhoblitt") n='Joshua Hoblitt' ; m="jhoblitt@cpan.org" ;;
"jhorwitz") n='Jeff Horwitz' ; m="jeff@smashing.org" ;;
"jimmy") n='Jimmy Zhuo' ; m="zhuomingliang@yahoo.com.cn" ;;
"jisom") n='Joshua Isom' ; m="loneowl@ritalin.shout.net" ;;
"jkeenan") n='James E Keenan (Jim)' ; m="jkeenan@cpan.org" ;;
"jonathan") n='Jonathan Worthington' ; m="jnthn@jnthn.net" ;;
"josh") n='Josh Wilmes' ; m="josh-perl6@hitchhiker.org" ;;
"jquelin") n='Jerome Quelin' ; m="jquelin@cpan.org" ;;
"jrieks") n='Jens Rieks' ; m="parrot@jensbeimsurfen.de" ;;
"jrtayloriv") n='Jesse Taylor' ; m="jrtayloriv@gmail.com" ;;
"kj, kjs") n='Klaas-Jan Stol' ; m="parrotcode@gmail.com" ;;
"larry") n='Larry Wall' ; m="larry@wall.org" ;;
"leed") n='Lee Duhem' ; m="lee.duhem@gmail.com" ;;
"leo") n='Leopold Toetsch' ; m="lt@toetsch.at" ;;
"luben") n='Luben Karavelov' ; m="karavelov@spnet.net" ;;
"luqui") n='Luke Palmer' ; m="luke@luqui.org" ;;
"LylePerl") n="LylePerl" ; m="none@none" ;;
"masak") n='Carl Masak' ; m="cmasak@gmail.com" ;;
"mdiep") n='Matt Diephouse' ; m="matt@diephouse.com" ;;
"mikehh") n='Michael H. Hind' ; m="mike.hind@gmail.com" ;;
"mikescott") n='Michael Scott' ; m="michael_scott@mac.com" ;;
"mongo") n='Mike Lambert' ; m="perl-dev@jall.org" ;;
"moritz") n='Moritz A Lenz' ; m="moritz@faui2k3.org" ;;
"mrjoltcola") n='Melvin Smith' ; m="melvin.smith@mindspring.com" ;;
"nicholas") n='Nicholas Clark' ; m="nick@ccl4.org" ;;
"nickg") n='Nick Glencross' ; m="nick.glencross@gmail.com" ;;
"NotFound") n='Julian Albo' ; m="julian.notfound@gmail.com" ;;
"nwellnhof") n='Nick Wellnhofer' ; m="wellnhofer@aevum.de" ;;
"Ovid") n="Curtis 'Ovid' Poe" ; m="ovid@cpan.org" ;;
"particle") n='Jerry Gay' ; m="Jerry.Gay@gmail.com" ;;
"paultcochrane") n='Paul Cochrane' ; m="paultcochrane@gmail.com" ;;
"Paul_the_Greek") n='Paul C. Anagnostopoulos' ; m="paul@windfall.com" ;;
"pdcawley") n='Piers Cawley' ; m="pdcawley@bofh.org.uk" ;;
"petdance") n='Andy Lester' ; m="andy@petdance.com" ;;
"petergibbs") n='Peter Gibbs' ; m="peter@emkel.co.za" ;;
"plobsing") n='Peter Lobsinger' ; m="plobsing@gmail.com" ;;
"pmichaud") n='Patrick R. Michaud' ; m="pmichaud@pobox.com" ;;
"rafl") n='Florian Ragwitz' ; m="rafl@debianforum.de" ;;
"rblasch") n='Ron Blaschke' ; m="ron@rblasch.org" ;;
"rgrjr") n='Bob Rogers' ; m="rogers-perl6@rgrjr.dyndns.org" ;;
"rg") n='Rolf Grossmann' ; m="rg@progtech.net" ;;
"robert") n='Robert Spier' ; m="robert@perl.org" ;;
"rubys") n='Sam Ruby' ; m="rubys@intertwingly.net" ;;
"rurban") n='Reini Urban' ; m="rurban@cpan.org" ;;
"samlh") n='Samuel Harrington' ; m="samuel.harrington@mines.sdsmt.edu" ;;
"sartak") n='Shawn M Moore' ; m="sartak@gmail.com" ;;
"scog") n='Simon Glover' ; m="scog@aip.de" ;;
"sfink") n='Steve Fink' ; m="steve@fink.com" ;;
"simon") n='Simon Cozens' ; m="simon@simon-cozens.org" ;;
"smash") n="Nuno 'smash' Carvalho" ; m="mestre.smash@gmail.com" ;;
"sorear") n="Stefan O'Rear" ; m="stefanor@cox.net" ;;
"stephane") n='Stéphane Peiry' ; m="stephane@modxml.org" ;;
"svn") n='svn' ; m="svn@perl.org" ;;
"tcurtis") n='Tyler Curtis' ; m="tyler.l.curtis@gmail.com" ;;
"tene") n='Stephen Weeks' ; m="tene@allalone.org" ;;
"tewk") n='Kevin Tew' ; m="tewk@tewk.com" ;;
"theory") n='David E. Wheeler' ; m="david@justatheory.com" ;;
"thgibbs") n='Tanton Gibbs' ; m="thgibbs@deltafarms.com" ;;
"timbo") n='Tim Bunce' ; m="Tim.Bunce@pobox.com" ;;
"tom") n='Tom Hughes' ; m="tom@compton.nu" ;;
"treed") n='Ted Reed' ; m="ted.reed@gmail.com" ;;
"ujwalic") n='Ujwal Reddy Malipeddi' ; m="ujwalic@gmail.com" ;;
"util") n='Bruce Gray' ; m="bruce.gray@acm.org" ;;
"vsoni") n='Vishal Soni' ; m="vishalrsoni@gmail.com" ;;
"whiteknight") n='Andrew Whitworth' ; m="wknight8111@gmail.com" ;;
esac

export GIT_AUTHOR_NAME="$n"
export GIT_AUTHOR_EMAIL="$m"
export GIT_COMMITTER_NAME="$n"
export GIT_COMMITTER_EMAIL="$m"

