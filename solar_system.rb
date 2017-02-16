#testing out the github commands
class Planet
  attr_accessor :name, :distance_from_the_sun, :radius, :mass, :moons, :density, :gravity, :rate_solar_rotation

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @distance_from_the_sun = planet_hash[:distance_from_the_sun]
    @radius = planet_hash[:radius]
    @mass = planet_hash[:mass]
    @moons = planet_hash[:moons]
    @density = planet_hash[:density]
    @gravity = planet_hash[:gravity]
    @rate_solar_rotation = planet_hash[:rate_solar_rotation]
  end

  def info
    puts "\nPlanet #{@name}'s' radius is #{@radius} and its mass is #{@mass}. It is #{@distance_from_the_sun} miles away from the Sun and has #{@moons} moon(s)."
    puts "Its density is #{@density} and its gravity is #{@gravity}. "
  end

end


class SolarSystem
  attr_accessor :planets

  def initialize
    @planets = []
  end

  def add_a_planet(planet)

    @planets.push (planet)
  end

  def add_a_list(more_planets)
    @planets += more_planets.planets
  end

  def find_planet(planet_name) #solar_system.find_planet(whatever).distance_from_the_sun
    i = 0
    @planets.length.times do
      if planet_name.downcase == @planets[i].name.downcase
        return @planets[i]
        break
      else
        i = i + 1
      end
    end
  end

  def distance(planetA_name, planetB_name)   #example: solar_system.distance("mercury", "earth")
    planetA = self.find_planet(planetA_name)
    planetB = self.find_planet(planetB_name)
    mi_between_planets = (planetA.distance_from_the_sun.delete(',').to_i - planetB.distance_from_the_sun.delete(',').to_i ).abs
  end

end

solar_system= SolarSystem.new

solar_system.add_a_planet(Planet.new(name: "Jupiter", distance_from_the_sun: "483,600,000", radius: "43,441 mi", mass: "1.898 × 10^27 kg", moons: 16, density: "1.33 g/cm³", gravity: "24.79 m/s²", rate_solar_rotation: 0.416))

solar_system.add_a_planet(Planet.new(name: "Saturn", distance_from_the_sun: "886,700,000", radius: "36,184 mi", mass: "5.683 × 10^26 kg", moons: 53, density: "687 kg/m³",gravity: "10.44 m/s²", rate_solar_rotation: 0.437))

solar_system.add_a_planet(Planet.new(name: "Mercury", distance_from_the_sun: "36,000,000", radius: "1,516 mi", mass: "3.285 × 10^23 kg", moons: 0, density: "5.43 g/cm³", gravity: "3.7 m/s²", rate_solar_rotation: 58.64))

solar_system.add_a_planet(Planet.new(name: "Venus", distance_from_the_sun: "67,200,000", radius: "3,760 mi", mass: "4.867 × 10^24 kg", moons: 0, density: "5.24 g/cm³", gravity: "8.87 m/s²", rate_solar_rotation: 243.02))

solar_system.add_a_planet(Planet.new(name: "Mars", distance_from_the_sun: "141,600,000", radius: "2,106 mi", mass: "6.39 × 10^23 kg", moons: 2, density: "3.93 g/cm³", gravity: "3.711 m/s²", rate_solar_rotation: 1.02))

more_solar_system = SolarSystem.new

more_solar_system.add_a_planet(Planet.new(name: "Earth", distance_from_the_sun: "92,960,000", radius: "3,959 mi", mass: "5.972 × 10^24 kg", moons: 0, density: "5.51 g/cm³", gravity: "9.807 m/s²", rate_solar_rotation: 365))
more_solar_system.add_a_planet(Planet.new(name: "Uranus", distance_from_the_sun: "1,784,000,000", radius: "15,759 mi", mass: "8.681 × 10^25 kg", moons: 27, density: "1.27 g/cm³", gravity: "8.69 m/s²", rate_solar_rotation: 0.7))


solar_system.add_a_list(more_solar_system)



print "Choose the planet you want to learn about.\nChoose from Jupiter, Saturn, Mercury, Venus, Mars, Earth, Uranus (N to quit): "
entered_planet = gets.chomp.downcase
while true
  if entered_planet.downcase == "n"
    break
  else
    num = 0
    info_planet = nil
    while info_planet == nil
      i = 0
      solar_system.planets.length.times do
        if entered_planet == solar_system.planets[i].name.downcase
          info_planet = entered_planet
          num = i
          break
        else
          i += 1
        end
      end
      if info_planet != nil
        break
      else
      print "Re-Enter the name of a planet you want to learn about.\nChoose from Jupiter, Saturn, Mercury, Venus, Mars, Earth, Uranus: "
      entered_planet = gets.chomp.downcase
      end
    end
  end
  puts solar_system.planets[num].info
  print "Choose the planet you want to learn about.\nChoose from Jupiter, Saturn, Mercury, Venus, Mars, Earth, Uranus (N to quit): "
  entered_planet = gets.chomp.downcase
end

print "Do you want to know the distance between planets? (Y to continue, N to quit)"
answer_dis = gets.chomp.downcase

def separate_comma(number)
  number.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
end

if answer_dis == "n"
  exit
else
  print "Enter the first planet. Jupiter, Saturn, Mercury, Venus, Mars, Earth, Uranus: "
  f_planet = gets.chomp
  print "Enter the second planet. Jupiter, Saturn, Mercury, Venus, Mars, Earth, Uranus: "
  s_planet = gets.chomp
  distance = separate_comma(solar_system.distance(f_planet, s_planet))
  puts "Distance between #{f_planet.capitalize} and #{s_planet.capitalize} is #{distance} miles."
end
