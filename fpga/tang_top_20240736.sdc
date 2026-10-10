# Reloj de placa indicado por el usuario: 27 MHz.
# Periodo = 1/27 MHz = 37.037037 ns. Se redondea a 37.037 ns.
create_clock -name sys_clk -period 37.037 [get_ports {clk}]

# Revisar el informe de timing y la sintaxis soportada por la version
# instalada de Gowin IDE. No se agregan false paths genericos:
# las excepciones de las entradas asincronas deben justificarse y
# configurarse segun el flujo de sincronizacion y las herramientas.
