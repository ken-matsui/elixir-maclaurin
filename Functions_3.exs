function2 = fn 
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

function3 = fn
 n -> function2.(rem(n, 3), rem(n, 5), n)
end

IO.puts "#{function3.(10)}"
IO.puts "#{function3.(11)}"
IO.puts "#{function3.(12)}"
IO.puts "#{function3.(13)}"
IO.puts "#{function3.(14)}"
IO.puts "#{function3.(15)}"
IO.puts "#{function3.(16)}"