#! /usr/bin/ruby
require 'optparse'
require 'scanf'

ARGV << '-h' if ARGV.empty?

$options = {}
$options[:base] = 0x0
$options[:debug] = false
$options[:name] = "RCC"
$options[:preindent] = 3
$options[:indent] = 2
$options[:trim] = nil
$options[:size] = "0x400"

OptionParser.new do |opts|
  opts.banner = "Usage: txt2svd.rb [options]"
  opts.on("--base=addr", 'base addr') do |x|
    $options[:base] = x.hex
  end

  opts.on("--name=xyz", 'name of this peripheral') do |x|
    $options[:name] = x
  end

  opts.on("--trim=xyz", 'xyz_ to be removed from start of each reg') do |x|
    $options[:trim] = x
  end

  opts.on("--size=blocksize", 'Default is 0x400 but u can override') do |x|
    $options[:size] = x
  end

  opts.on("", "--debug", 'enable debug') do
    options[:debug] = true
  end

  opts.on("--indent=num", 'space indent') do |x|
    $options[:indent] = x.to_i
  end

  opts.on("--preindent=num", 'pre indent') do |x|
    $options[:preindent] = x.to_i
  end

  opts.on_tail("-h", "--help", 'this list') do
    puts opts
    exit
  end

end.parse!

if not $options[:trim]
  $options[:trim] = $options[:name] + "_"
end
$work = Array.new
IO.readlines(ARGV[0]).each do |line|
  line.chomp!
  if(line[0] != '#')
    $work.push(line)
  end
end

done = false
# record
# :offset
# :fields [[x,hi,lo],[y,hi,lo],[z,hi,lo]]
# :reset_value 0xABCDEFGH

$periph = Array.new

reset_re = /Reset value (?<str>[[01][ xX]]+)/
name_re = /(\w+)\[(\d+):(\d+)\]/
name1_re = /(\w+)\[(\d+)\]/

want = :offset
rec = []
periph = []
bitoff = 31
sizes = 0
$work.each_with_index do |e, i|
  case want
  when :offset
    #    rec += [:offset, e.hex()]
    rec += [[:offset, e]]
    want = :name
  when :name
    if $options[:trim]
      if e.include?($options[:trim])
        e[$options[:trim]] = ''
      end
    end
    rec += [[:name, e]]
    want = :fields
  when :fields
    m = reset_re.match(e)
    if e == "Res."
      bitoff -= 1
    elsif m
      l = m[1].split(' ')
      if l.size != sizes
        printf "Error @i %d %d != %d\n", i, l.size, sizes
        p rec
        exit
      end
      sizes = 0
      rec += [[:reset, l]]
      want = :offset
      bitoff = 31
      $periph += [rec]
      rec = []
    else
      # see if the next str is a range
#      p i
      if $work[i+1][0] == "["
        printf "Fix @%d\n", i+1
#        a = $work[i+1].scanf("[%d:%d]")
#        bitwidth = a[0] - a[1] + 1
#        want = :skiprange
      elsif e.include?("[")
        m = e.match(name_re)
        if m
          e = m[1]
          hi = m[2].to_i
          lo = m[3].to_i
          bitwidth = hi - lo + 1
        else
          m = e.match(name1_re)
          if m
            e = m[1]
            bitwidth = 1
          else
            printf "Fix[ @%d\n", i+1
            exit
          end
        end
      else
        bitwidth = 1
      end
      if bitwidth > 1
        bitoff -= bitwidth - 1
      end
      sizes += bitwidth
#      p e,sizes
      rec += [[:field, e]]
      rec += [[:bitoff, bitoff]]
      rec += [[:bitwidth, bitwidth]]
      bitoff -= 1
    end
  when :skiprange
    want = :fields
    next
  end
end
def indent(level, s, nl)
  spaces = $options[:preindent]
  if level > 0
    spaces += $options[:indent] * level
  end
  for i in 0..spaces-1 do
    printf " "
  end
  printf "%s", s
  if nl
    printf "\n"
  end
end
def dump
  indent(0, "<peripheral>", true)
  indent(1, "<name>", false)
  printf "%s", $options[:name]
  printf "</name>\n"
  indent(1, "<groupName>", false)
  printf "%s", $options[:name]
  printf "</groupName>\n"
  indent(1, "<baseAddress>", false)
  printf "0x%08x", $options[:base]
  printf "</baseAddress>\n"
  indent(1, "<addressBlock>", true)
  indent(2, "<offset>0</offset>", true)
  indent(2, "<size>#{$options[:size]}</size>", true)
  indent(2, "<usage>registers</usage>", true)
  indent(1, "</addressBlock>", true)
  indent(1, "<registers>", true)
  $periph.each do |rec|
#    p rec
    off = nil
    indent(2, "<register>", true)
    rec.each do |x|
      case x[0]
      when :name
        indent(3, "<name>#{x[1]}</name>", true)
        indent(3, "<displayName>#{x[1]}</displayName>", true)
        indent(3, "<addressOffset>#{off}</addressOffset>", true)
        indent(3, "<size>0x20</size>", true);
        indent(3, "<access>read-write</access>", true);
        indent(3, "<resetValue>0x00000000</resetValue>", true);
        indent(3, "<fields>", true);
      when :offset
        off = x[1]
      when :field
        indent(4, "<field>", true);
        indent(5, "<name>#{x[1]}</name>", true)
      when :bitoff
        indent(5, "<bitOffset>#{x[1]}</bitOffset>", true);
      when :bitwidth
        indent(5, "<bitWidth>#{x[1]}</bitWidth>", true);
        indent(4, "</field>", true);
      when :reset
      else
        p "else"
        p x[0]
        exit
      end
    end
    indent(3, "</fields>", true);
    indent(2, "</register>", true)
  end
  indent(1, "</registers>", true)
  indent(0, "</peripheral>", true)
end
dump
#p $periph
