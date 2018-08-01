def aprobados(nota_min)
	file_name = 'notas.csv'
	data=[]
	File.open(file_name, "r") { |file|  
		data=file.readlines.map { |w| w.chomp.split(', ') }
	}

	sum={}
	data.each { |x| sum.merge!({x[0] => (x[1].to_i+x[2].to_i+x[3].to_i+x[4].to_i+x[5].to_i)/(x.length-1)}) }
	sum.each {|y,z| puts "Alumno: #{y}  Nota Final: #{z}" if z>=nota_min }
end

file_name = 'notas.csv'
data=[]
File.open(file_name, "r") { |file|  
		data=file.readlines.map { |w| w.chomp.split(', ') }
	}

opcion=0
while opcion != 4
	puts '1. Generar promedios de notas.'
	puts '2. Ver inasistencias totales.'
	puts '3. Ver alumnos aprobados.'
	puts '4. Salir'
	opcion = gets.chomp.to_i
	if opcion == 1
		suma={}
		data.each { |x| suma.merge!({x[0] => (x[1].to_i+x[2].to_i+x[3].to_i+x[4].to_i+x[5].to_i)/(x.length-1)}) }
		puts suma
		File.open("promedios.csv", "a") { |file|  
			suma.each {|a,b| file.puts "#{a}, #{b}"}
		}
	elsif opcion == 2
		faltas=0
		faltas_dia1={}
		faltas_dia2={}
		faltas_dia3={}
		faltas_dia4={}
		faltas_dia5={}
		data.each { |x| faltas_dia1.merge!({x[0] => x[1]}) }
		data.each { |x| faltas_dia2.merge!({x[0] => x[2]}) }
		data.each { |x| faltas_dia3.merge!({x[0] => x[3]}) }
		data.each { |x| faltas_dia4.merge!({x[0] => x[4]}) }
		data.each { |x| faltas_dia5.merge!({x[0] => x[5]}) }
		faltas_dia1.select {|x,y| puts "Alumno #{x} registra inasistencia en clase 1" if y=='A'}
		faltas_dia2.select {|x,y| puts "Alumno #{x} registra inasistencia en clase 2" if y=='A'}
		faltas_dia3.select {|x,y| puts "Alumno #{x} registra inasistencia en clase 3" if y=='A'}
		faltas_dia4.select {|x,y| puts "Alumno #{x} registra inasistencia en clase 4" if y=='A'}
		faltas_dia5.select {|x,y| puts "Alumno #{x} registra inasistencia en clase 5" if y=='A'}
		faltas+=faltas_dia1.count{|x,y| y=='A'}
		faltas+=faltas_dia2.count{|x,y| y=='A'}
		faltas+=faltas_dia3.count{|x,y| y=='A'}
		faltas+=faltas_dia4.count{|x,y| y=='A'}
		faltas+=faltas_dia5.count{|x,y| y=='A'}
		puts "El total de inasistencias fue: #{faltas}"
	elsif opcion == 3
		puts 'Ingrese nota minima para aprobar:'
		umbral=gets.chomp.to_i
		aprobados(umbral)
	elsif opcion == 4
		puts 'Good Bye'
	else
		puts 'Favor asegurese de elegir una opción válida!'
	end
end
