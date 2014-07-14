#!/usr/bin/ruby
$LOAD_PATH << '.'

require 'Tasks'
require 'Agreement'

$g_uid, $g_pwd = "sentry", "feng"
$g_status = ""

ag = Agreement.new("AlexCA","Active")
puts ag.getname

loadF = LoadFile.new("C:\\Imports\\Newedge.csv")
if loadF.getState() == 0
  Trades = ReadTrades.new(loadF.getFileC, loadF.getFArrLength, ',')
  totalExp = Trades.getTotalExp()
else
  totalExp = 0
end

puts "Total Exposure: " + totalExp.to_s

calc = CalculateMargin.new("A CA",totalExp,150355,1400101)
print "Margin Result: "
puts calc.getFinalMarginResult()


#print ag.getname+" is valid\n" if 1 == 1

