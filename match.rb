def regcheck(str)
  /^[0-9]{1,2}(:[0-9]{1,2})+?$/ =~ str
end

puts regcheck("0:00")
puts regcheck("00:00")
puts regcheck("1:00:00")
puts regcheck("1:00:00A")
