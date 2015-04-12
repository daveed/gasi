class Mpc < ActiveRecord::Base
  self.table_name = 'properties'

  belongs_to :asteroid

  M_INCLINATION = 1.85
  M_MIDR = 227_900_000
  # M_APOGEE = 249_200_000
  # M_PEROGEE = 206_700_000

  GM = 398_600 # (km^3 / s^2)
  MASS_EQUIP = 100 # kg
  VE = 50 #	exhaust velocity, would be about 3km/s for hydrogen+oxygen. 50 for ion plasma thruster
  VELAUNCH = 5 #	exhaust velocity for launch, 5km/s

  # Calculator for delta-v and fuel
  def self.calc_mass_fuel_total(a_mass)

    calc = []

    # step 1 - Delta V from Asteroid to Mars
    # Mpc.where('inclination is not null and semimajor_axis is not null and delta_v is not null').limit(10) do |mpc|
    Mpc.limit(10).each do |mpc|

      a_inclination = mpc.inclination
      a_midr = mpc.semimajor_axis
      deltaVneeded = mpc.delta_v

      # //double velocity1 = sqrt(GM * (2 / a_perogee - 1 / a_midr)	//vis-viva equation, assuming blast at perogee
      velocity1 = Math::sqrt(GM / a_midr) # assumes blast is at the semi-major axis (midr)

      # //delta-v for inclination change
      deltaV1a = Math::sqrt(2 * velocity1 * velocity1 * (1 - Math::cos(M_INCLINATION - a_inclination)))

      # //delta-v for hohmann transfer
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

      calc << {name: mpc.n_or_d, designation: mpc.designation, mass_fuel_total: fuelMassTotal}
    end

    calc
  end

end
