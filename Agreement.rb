#!/usr/bin/ruby

S = Hash["Active"=>1,"InActive"=>2,"Monitor"=>3]

class Agreement
 @var1 = 'ISDA'
 @status = 0
  def initialize(name, stat)
   @g_name = name
   @status = "#{S[stat]}"
  end
  def getname
   @g_name
  end
  def getstatus
   @status
  end
  def isNetted
   false
  end
  def getThreshold(favor)
   favor > 0 ? 10000 : -10000
  end
  def getMTA
   1000
  end
  def getRnd
   100
  end
 module Checkcalls
   def getmc()
   end
 end
end


