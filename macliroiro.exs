defmodule Macl do
	def maclaurin(max, s, d, x, k, deg) do
		d = -1 * d * (x * x) / (k * (k + 1))
 		s = s + d
 		k = k + 2

 		if k >= max do
 			# sの返却
 			s
 		else
 			maclaurin(max, s, d, x, k, deg)
 		end
 	end

 	def start(plot, xziku, sinx, one, two, three, four, five, min, max) do
		sinx = sinx ++ [:math.sin(min)]

		one = one ++ [min]
		two = two ++ [maclaurin(2*2, min, min, min, 2, min)]
		three = three ++ [maclaurin(3*2, min, min, min, 2, min)]
		four = four ++ [maclaurin(4*2, min, min, min, 2, min)]
		five = five ++ [maclaurin(5*2, min, min, min, 2, min)]

		xziku = xziku ++ [Float.ceil(min, 1)]

		if min > max do
			IO.puts "plot sin(x)"

			Explot.add_list(plot, sinx, "sin(x)")
			Explot.add_list(plot, one, "Up to 1")
			Explot.add_list(plot, two, "Up to 2")
			Explot.add_list(plot, three, "Up to 3")
			Explot.add_list(plot, four, "Up to 4")
			Explot.add_list(plot, five, "Up to 5")

			Explot.x_axis_labels(plot, xziku)

			Explot.show(plot)
		else
			start(plot, xziku, sinx, one, two, three, four, five, min + 0.01, max)
		end
	end
end

plot = Explot.new
Explot.title(plot, "maclaurin")

Macl.start(plot,[], [], [], [], [], [], [], -5.0, 5.0)