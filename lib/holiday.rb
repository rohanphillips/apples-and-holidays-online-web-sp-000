require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |holiday, season|
    if holiday == :winter
      season.each do |holiday_name, data|
        #binding.pry
        data << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |holiday, season|
    season.each do |holiday_name, data|
      if holiday_name == :memorial_day
        data << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |holiday_season, holidaynames|

    if holidaynames.has_value?(season) == false
      holidaynames.store(holiday_name, supply_array)
    end
  end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  collection =[]
  holiday_hash.each do |holiday_season, holidaynames|
    #binding.pry
    if holiday_season == :winter
      holidaynames.each do |holiday, data|
        #binding.pry
        collection.push(*data)
      end
    end
  end
  #binding.pry
  collection
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  x = ""
  holiday_hash.each do |season,holidays|
    #binding.pry
    puts season.slice(0, season.size).capitalize + ":"
    holidays.each do |holiday, data|
      x = holiday.slice(0, holiday.size)
      x.gsub!("_", " ")
      puts "  " + x.split.map(&:capitalize).join(' ') + ": " + data.join(", ")
    #  binding.pry
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  collection = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, data|

      if data.include?("BBQ")
        collection << holiday
      end
    end
  end
  collection
end
