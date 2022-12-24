class Tamawacho

  @estado # Patron de diseño STATE
  @felicidad = 0

  def comer!
    @estado.comer!(self)
  end

  def jugar!
    @estado.jugar!
  end

  def puedeJugar?
    @estado.puedeJugar?
  end

  def felicidad
    @felicidad
  end

  def incrementarFelicidad(cantidad)
    @felicidad += cantidad
  end

  def cambiarEstado!(nuevoEstado)
    @estado = nuevoEstado
  end

end

module Contento

  def comer!(mascota)
    mascota.incrementarFelicidad(1)
  end

  def jugar!(mascota)
    mascota.incrementarFelicidad(2)
  end

  def puedeJugar?
    true
  end

end

module Hambriento

  def comer!(mascota)
    mascota.cambiarEstado!(Contento)
  end

  def jugar!(mascota)
  end

  def puedeJugar?
    false
  end

  def dormir!(mascota)
    mascota.cambiarEstado!(Aburrido.new)
  end

end

class Aburrido
  @tiempo = 0

  def comer!(mascota)
    if @tiempo > 80
      mascota.cambiarEstado!(Contento)
    end
  end

  def jugar!(mascota)
    mascota.cambiarEstado!(Contento)
  end

  def puedeJugar?
    true
  end

end

