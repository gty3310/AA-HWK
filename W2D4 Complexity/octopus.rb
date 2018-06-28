def find_fish_o_n2(arr)
  longest = true
  arr.each do |a|
    longest = true
    arr.each do |b|
      # result = a if b.length<a.length && result.length<a.length
      longest = false if a.length > b.length
    end
    return a if longest == true
  end

end



if $PROGRAM_NAME == __FILE__
    puts find_fish_o_n2(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
end
