require 'liquid'

module Jekyll
	module TraduzMeses

		def traduzmeses(input)
		
			months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
			meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']

			c = 0
			while months[c]

				input = input.gsub(months[c], meses[c])
				c += 1
			end

			return input
		end
	end
end

Liquid::Template.register_filter(Jekyll::TraduzMeses)