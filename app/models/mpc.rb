class Mpc < ActiveRecord::Base
  self.table_name = 'properties'

  belongs_to :asteroid

  M_INCLINATION = 1.85
  M_MIDR        = 227_900_000
  GM            = 132_700_000_000
  MASS_EQUIP    = 100 # in kg
  VE            = 50  #	exhaust velocity, about 3km/s for hydrogen+oxygen.
                      # 50 for ion plasma thruster
  VELAUNCH      = 5   #	exhaust velocity for launch, 5km/s
  AU            = 149_598_000 # AU in km

  # Calculator for delta-v and fuel
  def self.calc_mass_fuel_total(a_mass)

    calc = []

    # step 1 - Delta V from Asteroid to Mars
    Mpc.where('perihelion_distance > 1 AND aphelion_distance < 2').each do |mpc|

      a_inclination = mpc.inclination
      a_midr = mpc.semimajor_axis * AU
      deltaVneeded = mpc.delta_v

      # vis-viva equation, assuming blast at perogee
      velocity1 = Math::sqrt(GM / a_midr) # assumes blast is at the semi-major axis (midr)

      # delta-v for inclination change
      deltaV1a = Math::sqrt(2 * velocity1 * velocity1 * (1 - Math::cos(M_INCLINATION - a_inclination)))

      # delta-v for hohmann transfer
      deltaV1b = Math::sqrt(GM / a_midr) * (Math::sqrt(2 * a_midr / (a_midr + M_MIDR)) - 1).abs

      # step 2 - Fuel needed for DeltaV - uses deltaV from asteroid to Mars (above) and mass of the asteroid
      # mass is based on density (1.38 g/cm^3) * 4 π / 3 * radius^3 * (10000 cm/m * 10000 cm/m * 10000 cm/m) * (1 kg / 1000 g)
      # !! USER INPUT
      #a_mass = 5_000 # 1.38 * 4 / 3 * PI * (a_diameter * a_diameter * a_diameter) / 8 * 10E9

      fuelMass1 = (MASS_EQUIP + a_mass) * (Math::exp((deltaV1a + deltaV1b) / VE) - 1)

      # step 3 - Fuel needed to get to the Asteroid
      fuelMass2 = (MASS_EQUIP + fuelMass1) * (Math::exp(deltaVneeded / VE) - 1)

      # step 4 - Fuel needed to launch into LEO
      # deltaVtoLEO = 9 # km/s
      # fuelMass3 = (MASS_EQUIP + fuelMass1 + fuelMass2) * (Math::exp(deltaVtoLEO / VELAUNCH) - 1)
      fuelMassTotal = fuelMass1 + fuelMass2 # + fuelMass3

      calc << {name: mpc.n_or_d, designation: mpc.designation, diameter: mpc.diameter, mass_fuel_total: fuelMassTotal.to_f.round(2)}
    end

    calc.sort_by { |hsh| hsh[:mass_fuel_total] }
  end

end
