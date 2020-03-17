defmodule Macl do
	def finish() do
		IO.puts "finish maclaurin..."
 	end

 	def loop(s, d, x, k, deg) do
 		max = 200
 		eps = :math.pow(10, -8)

 		d = -1 * d * (x * x) / (k * (k + 1))
 		s = s + d
 		k = k + 2

 		if k >= max do
 			if (abs d) > eps do
 				IO.puts "収束しない"
 			else
 				IO.puts "sin(#{deg}) = #{s}"
 			end
 			finish()
 		else
 			loop(s, d, x, k, deg)
 		end
 	end

 	def start() do
		deg = IO.gets "角度を入力 : "

		# Integer.parse(string("0\n")) => {0, \n}
		# elem(tuple{0, \n}, 0) => 0
		deg = elem(Integer.parse(deg), 0)
 		x = :math.pi() * deg / 180.0

 		loop(x, x, x, 2, deg)
 	end
end

Macl.start()