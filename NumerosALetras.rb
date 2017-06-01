class Ordinal

	POSICION = [
		["cero","un", "dos", "tres", "cuatro", "cinco", "seis","siete","ocho", "nueve"],
		[["diez", "once", "doce", "trece", "catorce", "quince", "dieci","dieci","dieci", "dieci"],
		"veinti", "treinta y ", "cuarenta y", "cincuenta y", "sesenta y", "setenta y", "ochenta y", "noventa y"],
		[["cien", "ciento"], "cientos", "cientos", "cientos", "quinientos", "cientos", "setecientos", "cientos", "novecientos"],
		["mil"],
		["millón", "millones"]
	]

	RAIZ_UNIDADES = {
		"0" =>	"cero",
		"1" => "un",
		"2" => "dos",
		"3" => "tres",
		"4" => "cuatro",
		"5" => "cinco",
		"6" => "seis",
		"7" => "siete",
		"8" => "ocho",
		"9" => "nueve"
	}

	RADECENAS = {
		"1" => "dieci",
		"2" => "veinti",
		"3" => "treinta y",
		"4" => "cuarenta y",
		"5" => "cincuenta y",
		"6" => "sesenta y",
		"7" => "setenta y",
		"8" => "occhenta y",
		"9" => "noventa y"
	}

	EXCEP_DECENAS = {
		"10" => "diez",
		"11" => "once",
		"12" => "doce",
		"13" => "trece",
		"14" => "catorce",
		"15" => "quince"
	}

	EXCEP_CENTENAS = {
		"5" => "quinientos",
		"7" => "sete",
		"9" => "nove"
	}

	MILES = {

	}

	DECENASMILES = {

	} 

	CENTENASMILES = {

	}

	MILLONES = {

	}

	def initialize(numero)
		@numero = numero.to_s
		end

	def entero_decimal
		numero_partido = @numero.split('.')
		if numero_partido[0] == "0"
			numero_partido[0] = ""
		end
		if numero_partido[1] == "0"
			numero_partido[1] = ""
		end
		if numero_partido[1].class == NilClass
			numero_partido[1] = ""
		end
		return numero_partido
	end

	def letras_entero(numero_partido)
		puts "la parte entera tiene una longitud de #{numero_partido[0].length} y la parte decimal tiene una longitud de #{numero_partido[1].length}"
		gets.chomp
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
			numero_comprobado = comprobar_numero(numero)
			ordinal = Ordinal.new(numero_comprobado)
			numero_partido = ordinal.entero_decimal
			ordinal.letras_entero(numero_partido)
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
	return numero_comprobado
end


def es_numero(numero_a_comprobar)
	while !(Float(numero_a_comprobar) rescue false) || numero_a_comprobar.to_f < 0
		puts "No has introducido un número correcto. Pulsa Intro"
		gets.chomp
		borrar_pantalla
		puts "Introduce un número positivo y con dos decimales como máximo: "
		numero_a_comprobar = gets.chomp
	end
	numero_a_comprobar = sprintf("%.2f",numero_a_comprobar).to_f
	return numero_a_comprobar
end

entrada_numero()
