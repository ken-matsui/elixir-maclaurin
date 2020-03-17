plot = Explot.new
Explot.title(plot, "sin(x)")

defmodule Sin do
	def finish(plot, sinx) do
		IO.puts "plot sin(x)"

		Explot.add_list(plot, sinx, "sin(x)")
		Explot.show(plot)
	end

	def loop(plot, sinx, min, max) do
		sinx = sinx ++ [:math.sin(min)]

		# Debug
		#IO.puts :math.sin(min)

		if min > max do
			finish(plot, sinx)
		else
			loop(plot, sinx, min + 0.01, max)
		end
	end
end

Sin.loop(plot, [], -5, 5)