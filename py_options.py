from optparse import OptionParser
[...]
parser = OptionParser()
parser.add_option(
    "-f",
    "--file",
    dest="filename",
    help="write report to FILE",
    metavar="FILE")
parser.add_option(
    "-q",
    "--quiet",
    action="store_false",
    dest="verbose",
    default=True,
    help="don't print status messages to stdout")

(options, args) = parser.parse_args()

usage = "usage: %prog [options] arg1 arg2"
parser = OptionParser(usage=usage)
parser.add_option(
    "-v",
    "--verbose",
    action="store_true",
    dest="verbose",
    default=True,
    help="make lots of noise [default]")
parser.add_option(
    "-q",
    "--quiet",
    action="store_false",
    dest="verbose",
    help="be vewwy quiet (I'm hunting wabbits)")
parser.add_option(
    "-f", "--filename", metavar="FILE", help="write output to FILE")
parser.add_option(
    "-m",
    "--mode",
    default="intermediate",
    help="interaction mode: novice, intermediate, "
    "or expert [default: %default]")
"""
Usage: <yourscript> [options] arg1 arg2

Options:
  -h, --help            show this help message and exit
  -v, --verbose         make lots of noise [default]
  -q, --quiet           be vewwy quiet (I'm hunting wabbits)
  -f FILE, --filename=FILE
                        write output to FILE
  -m MODE, --mode=MODE  interaction mode: novice, intermediate, or
                        expert[default:intermediate]
"""

group = OptionGroup(
    parser, "Dangerous Options",
    "Caution: use these options at your own risk.  "
    "It is believed that some of them bite.")
group.add_option("-g", action="store_true", help="Group option.")
parser.add_option_group(group)

group = OptionGroup(
    parser, "Dangerous Options",
    "Caution: use these options at your own risk.  "
    "It is believed that some of them bite.")
group.add_option("-g", action="store_true", help="Group option.")
parser.add_option_group(group)

group = OptionGroup(parser, "Debug Options")
group.add_option(
    "-d", "--debug", action="store_true", help="Print debug information")
group.add_option(
    "-s",
    "--sql",
    action="store_true",
    help="Print all SQL statements executed")
group.add_option("-e", action="store_true", help="Print every action done")
parser.add_option_group(group)

parser = OptionParser(usage="%prog [-f] [-q]", version="%prog 1.0")

from optparse import OptionParser
[...]


def main():
    usage = "usage: %prog [options] arg"
    parser = OptionParser(usage)
    parser.add_option(
        "-f", "--file", dest="filename", help="read data from FILENAME")
    parser.add_option("-v", "--verbose", action="store_true", dest="verbose")
    parser.add_option("-q", "--quiet", action="store_false", dest="verbose")
    [...]
    (options, args) = parser.parse_args()
    if len(args) != 1:
        parser.error("incorrect number of arguments")
    if options.verbose:
        print("reading %s..." % options.filename)
    [...]


if __name__ == "__main__":
    main()
