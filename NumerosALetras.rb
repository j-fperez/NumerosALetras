class Ordinal

	POSICION = [
		["cero","un","uno", "dos", "tres", "cuatro", "cinco", "seis","siete","ocho", "nueve"],
		["diez", "once", "doce", "trece", "catorce", "quince", "dieci","dieci","dieci", "dieci"],
		["veinti", "treinta y ", "cuarenta y", "cincuenta y", "sesenta y", "setenta y", "ochenta y", "noventa y"],
		["cien", "ciento", "cientos"],
		["mil"],
		["millón", "millones"]
	]

	def initialize(numero)
		@numero = numero
		end

	def entero_decimal
		numero_partido = @numero.split('.')
		if numero_partido[0] = "0"
			numero_partido[0] = ""
		end
		puts numero_partido 
		gets.chomp
	end

	def letras_entero
	end

	def letras_decimal
	end

end

def entrada_numero()
	opcion = "S"	
	while opcion == "S"
		borrar_pantalla()
		print "¿Quieres convertir un número a letras? (S/N): "
		opcion = gets.chomp.upcase
		if opcion == "S"
			puts "Introduce un número positivo y con dos decimales como máximo: "
			numero = gets.chomp
			comprobar_numero(numero)
			ordinal = Ordinal.new(numero)
			ordinal.entero_decimal
			ordinal.letras_entero
			ordinal.letras_decimal
		end
	end
end

def borrar_pantalla
		system('clear')
end

def comprobar_numero(numero)
	numero_a_comprobar = numero
	numero_ok = false
	while numero_ok == false
		numero_comprobado = es_numero(numero_a_comprobar)
		numero_ok = true
	end
end


def es_numero(numero_a_comprobar)
	while !(Float(numero_a_comprobar) rescue false) || numero_a_comprobar.to_f < 0
		puts "No has introducido un número correcto. Pulsa Intro"
		gets.chomp
		borrar_pantalla
		puts "Introduce un número positivo y con dos decimales como máximo: "
		numero_a_comprobar = gets.chomp
	end
	numero_a_comprobar = sprintf("%.2f",numero_a_comprobar)
end

entrada_numero()
