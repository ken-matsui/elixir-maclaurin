function = fn 
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

IO.puts "#{function.(0, 0, 1)}"
IO.puts "#{function.(0, 1, 1)}"
IO.puts "#{function.(1, 0, 1)}"
IO.puts "#{function.(1, 1, 5)}"