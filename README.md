# Ruby Documents Extractor
The Programming Assignment 1 report from NTU101-1 IR course

**by NTU [Michael Hsu](https://www.facebook.com/evenchange4 "facebook")**

## The Structure
### code/load/Extractor.rb
Extractor class
```
#IR PA1 MichaelHsu
#2012.09.18

#class : Extractor
#method: extract input string, output a text file

#https://github.com/raypereda/stemmify
require 'stemmify'

class Extractor
  def extract(collectionDocument, outputFileName)
		#use download stop_words @ http://ir.dcs.gla.ac.uk/resources/linguistic_utils/stop_words
		stopwords = open('load/stop_words.txt', "rb").read
		#output result array
		result = Array.new
		#Lowercasing everything.
		b = collectionDocument.downcase
		#Tokenization. char in a array []
		puts c = b.split(/[,?."\\\s]/)
		#Stemming using Porter’s algorithm
		c.each do |term|
			#Stopword removal.
			if !stopwords.include?term
				result << term.stem
			end
		end

		#Save the result as a txt file.
		f = File.open("../output/"+outputFileName+".txt", 'w')
		f.write(result)
		f.close()

	end
end
```

### code/load/stop_words.txt
download [stop_words](http://ir.dcs.gla.ac.uk/resources/linguistic_utils/stop_words "download stop_words")
```
a
about
above
across
after
afterwards
again
against
all
almost
alone
along
already
also
although
always
am
among
amongst
amoungst
amount
an
and
another
any
anyhow
anyone
anything
anyway
anywhere
are
around
as
at
back
be
became
because
become
becomes
becoming
been
before
beforehand
behind
being
below
beside
besides
between
beyond
bill
both
bottom
but
by
call
can
cannot
cant
co
computer
con
could
couldnt
cry
de
describe
detail
do
done
down
due
during
each
eg
eight
either
eleven
else
elsewhere
empty
enough
etc
even
ever
every
everyone
everything
everywhere
except
few
fifteen
fify
fill
find
fire
first
five
for
former
formerly
forty
found
four
from
front
full
further
get
give
go
had
has
hasnt
have
he
hence
her
here
hereafter
hereby
herein
hereupon
hers
herself
him
himself
his
how
however
hundred
i
ie
if
in
inc
indeed
interest
into
is
it
its
itself
keep
last
latter
latterly
least
less
ltd
made
many
may
me
meanwhile
might
mill
mine
more
moreover
most
mostly
move
much
must
my
myself
name
namely
neither
never
nevertheless
next
nine
no
nobody
none
noone
nor
not
nothing
now
nowhere
of
off
often
on
once
one
only
onto
or
other
others
otherwise
our
ours
ourselves
out
over
own
part
per
perhaps
please
put
rather
re
same
see
seem
seemed
seeming
seems
serious
several
she
should
show
side
since
sincere
six
sixty
so
some
somehow
someone
something
sometime
sometimes
somewhere
still
such
system
take
ten
than
that
the
their
them
themselves
then
thence
there
thereafter
thereby
therefore
therein
thereupon
these
they
thick
thin
third
this
those
though
three
through
throughout
thru
thus
to
together
too
top
toward
towards
twelve
twenty
two
un
under
until
up
upon
us
very
via
was
we
well
were
what
whatever
when
whence
whenever
where
whereafter
whereas
whereby
wherein
whereupon
wherever
whether
which
while
whither
who
whoever
whole
whom
whose
why
will
with
within
without
would
yet
you
your
yours
yourself
yourselves
```
### code/pa1.rb
main code	
```
load 'load/Extractor.rb'

#open Text collection
a= open('../input/1.txt', "rb").read

#new object Extractor
extractor = Extractor.new  

extractor.extract(a, 'result')
```
### input
input file
```
the white house is also keeping a close watch on yugoslavia, where 
opposition forces are about to step up the pressure on president slobodan 
milosevic. but will it work? nbc's jim maceda is in belgrade tonight. 
serbia on the eve of a general strike. this two-hour roadblock is 
just a taste of what will come tomorrow, says the opposition, when 
a nationwide work stoppage is to begin. the purpose, to force out 
the man they say stole the presidential election, slobodan milosevic. 
the people don't accept to be victim and to be hostage of one person, 
milosevic. time is working against him now. but will the pressure 
work? four years ago, hundreds of thousands of serbs marched against 
milosevic calling for a general strike as well. the protest lasted 
three months, but milosevic survived. that's the real question. does 
the opposition have the power to confront the regime with its combined 
wealth to get rid of it? a case in point. these coal mine, the very 
heart of serbia's economy, now on strike, only a handful of workers 
guarding equipment. but with a week of electricity reserves, these 
engineers are worried about blackouts. "we're just making a gesture 
to try to make this regime come to its senses." there are difficulties, 
too, spreading the word about the strike. independent radio station 
b-292 has been shut down three times. its signal jammed in belgrade 
leaving journalists frustrated. i'm waiting for a better time when 
people in belgrade can hear and listening my radio. poorly organized 
opposition rallies have been shrinking, now drawing barely 10,000 
in belgrade. but opposition leaders hope all that will change tomorrow 
and civil disobedience throughout the land may give new life to their 
struggle to oust milosevic. jim maceda, nbc news, belgrade.
```
### output
output file
```
["white", "hous", "keep", "close", "watch", "yugoslavia", "opposit", "forc", "step", "pressur", "presid", "slobodan", "milosev", "work", "nbc'", "jim", "maceda", "belgrad", "tonight", "serbia", "gener", "strike", "two-hour", "roadblock", "just", "tast", "tomorrow", "sai", "opposit", "nationwid", "work", "stoppag", "begin", "purpos", "forc", "sai", "stole", "presidenti", "elect", "slobodan", "milosev", "peopl", "don't", "accept", "victim", "hostag", "person", "milosev", "work", "pressur", "work", "year", "ago", "hundr", "thousand", "serb", "march", "milosev", "call", "gener", "strike", "protest", "last", "month", "milosev", "surviv", "that'", "real", "question", "doe", "opposit", "power", "confront", "regim", "combin", "wealth", "rid", "case", "point", "coal", "heart", "serbia'", "economi", "strike", "hand", "worker", "guard", "equip", "week", "electr", "reserv", "engin", "worri", "blackout", "we'r", "just", "make", "gestur", "try", "make", "regim", "sens", "difficulti", "spread", "word", "strike", "independ", "radio", "station", "b-292", "shut", "signal", "jam", "belgrad", "leav", "journalist", "frustrat", "i'm", "wait", "better", "peopl", "belgrad", "hear", "listen", "radio", "poorli", "organ", "opposit", "ralli", "shrink", "draw", "bare", "10,000", "belgrad", "opposit", "leader", "hope", "chang", "tomorrow", "civil", "disobedi", "land", "new", "life", "struggl", "oust", "milosev", "jim", "maceda", "nbc", "new", "belgrad"]
```
### PA1.pdf
PA1 Spec from class

## Getting Started
### Installing Ruby
If you do not have Ruby setup, please [install ruby](http://www.ruby-lang.org/zh_TW/downloads/ "ruby").

### Using extractor from the command line
``` bash
  $ cd code && ruby pa1.rb
```
