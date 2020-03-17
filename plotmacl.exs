defmodule Macl do
	def finish(plot, xziku, sinx, maclx) do
		IO.puts "plot sin(x)"

		Explot.add_list(plot, sinx, "sin(x)")
		Explot.add_list(plot, maclx, "maclaurin")

		Explot.x_axis_labels(plot, xziku)

		Explot.show(plot)
	end

 	def maclaurin(s, d, x, k, deg) do
 		max = 1000
 		eps = :math.pow(10, -8)

 		d = -1 * d * (x * x) / (k * (k + 1))
 		s = s + d
 		k = k + 2

 		if k >= max do
 			if (abs d) > eps do
 				IO.puts "収束しない"
 			else
 				# sの返却
 				s
 			end
 		else
 			maclaurin(s, d, x, k, deg)
 		end
 	end

 	def start(plot, xziku, sinx, maclx, min, max) do
		sinx = sinx ++ [:math.sin(min)]

		# maclaurin...
		x = :math.pi() * (min*60.0) / 180.0
		IO.puts "macl dbug = #{maclaurin(x, x, x, 2, min)}"
		maclx = maclx ++ [maclaurin(x, x, x, 2, min)]

		xziku = xziku ++ [Float.ceil(min, 1)]

		if min > max do
			finish(plot, xziku, sinx, maclx)
		else
			start(plot, xziku, sinx, maclx, min + 0.01, max)
		end
	end
end

plot = Explot.new
Explot.title(plot, "sin(x)")

Macl.start(plot,[], [], [], -5.0, 5.0)