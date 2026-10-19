# Práctica 5.2 — Pruebas BDD con Gherkin
# Aplicación: Sistema de Reservas de Excursiones Turísticas RD

Característica: Gestión de Reservas de Excursiones
  Como usuario interesado en turismo
  Deseo poder reservar excursiones disponibles
  Para asegurar mi lugar y recibir confirmación

  Escenario: Reserva confirmada con datos correctos
    Dado que el sistema está activo y hay cupos para "Isla Saona" el 25 de noviembre de 2026
    Cuando escribo mi nombre "María López", correo "maria@ejemplo.com", teléfono "809-123-4567" y elijo 2 personas
    Y pulso el botón Confirmar Reserva
    Entonces el sistema muestra el mensaje: "Reserva confirmada"
    Y se genera un código de reserva
    Y se envía la confirmación al correo

  Escenario: No se confirma si falta el nombre
    Dado que hay cupos para "Los Haitises" el 30 de noviembre de 2026
    Cuando dejo el campo nombre vacío, completo lo demás y confirmo
    Entonces aparece el aviso: "El nombre es obligatorio"
    Y la reserva NO se guarda

  Escenario: No se reserva si la fecha está llena
    Dado que "Punta Cana Playa" el 20 de diciembre de 2026 ya no tiene lugares
    Cuando elijo esa fecha y lleno todos los datos bien
    Entonces el sistema dice: "No hay cupos disponibles para esta fecha"
    Y no avanza con la reserva

  Escenario: Rechazo si el correo no tiene formato correcto
    Dado que hay cupos para "Cascada El Limón" el 10 de diciembre de 2026
    Cuando escribo el correo como "juan.ejemplo" sin el símbolo @ y lleno todo lo demás
    Entonces se muestra: "Escribe un correo válido, ejemplo@dominio.com"
    Y la reserva no se procesa

  Escenario: Se actualiza el precio al cambiar el número de pasajeros
    Dado que inicié una reserva para 1 persona en "Isla Saona" el 25 de noviembre de 2026
    Cuando cambio la cantidad a 3 personas
    Entonces el sistema recalcula el monto total
    Y muestra: "Cantidad actualizada — Total: $450 USD"