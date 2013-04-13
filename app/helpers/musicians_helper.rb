module MusiciansHelper
  def inviteable_musicians(musician)
    Musician.all.collect {|m| [ m.name, m.id ] }.reject{|m| m == [musician.name, musician.id]}
  end

  def inviteable_bands(musician)
    musician.bands.collect {|b| [ b.name, b.id ] }
  end

end
